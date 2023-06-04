package router

import (
	"Back-End.clothway/models"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
	"io"
	"net/http"
	"os"
	"strconv"
	"strings"
	"time"
	"unicode"
)

type UpdatedUser struct {
	Pseudo string
	Email  string
}

type NewUser struct {
	Password string
	Email    string
}

type NewPartner struct {
	Password string
	Email    string
}

type GetUser struct {
	Email string
}

type InfosFromGet struct {
	Name  string
	Email string
}

type SocialNetwork struct {
	SocialNetwork string
}

func Handle_home_request(context *gin.Context) {
	var msg string
	if err := context.ShouldBind(&msg); err != nil {
		context.JSON(400, gin.H{"Error": "Wrong home request format"})
	} else {
		context.JSON(200, gin.H{"Home": "OK"})
	}
}

func Handle_get_social_network(context *gin.Context) {
	var body SocialNetwork
	err := json.NewDecoder(context.Request.Body).Decode(&body)
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"Error": "Failed to read body",
		})
		return
	}
	if body.SocialNetwork == "instagram" {
		context.JSON(http.StatusOK, gin.H{
			"URL": "https://www.instagram.com/clothwayclothway/",
		})
	} else if body.SocialNetwork == "twitter" {
		context.JSON(http.StatusOK, gin.H{
			"URL": "https://twitter.com/_clothway_",
		})
	} else {
		context.JSON(http.StatusOK, gin.H{
			"Unknown social network": "try <instagram> or <twitter>",
		})
	}
}

func Handle_user_profile(context *gin.Context) {
	var body UpdatedUser
	err := json.NewDecoder(context.Request.Body).Decode(&body)
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"Error": "Failed to read body",
		})
		return
	}
	db := context.MustGet("gorm").(gorm.DB)
	println("ici ?")
	tmp_user := context.MustGet("user").(models.User)
	println("ici 2 ?")
	if body.Pseudo != "" {
		tmp_user.Pseudo = body.Pseudo
	}
	if body.Email != "" {
		tmp_user.Email = body.Email
	}
	res := db.Model(&tmp_user).Updates(&tmp_user)
	if res.Error != nil {
		println("update failed")
		context.JSON(http.StatusBadRequest, gin.H{
			"Error": "profile update failed",
		})
		return
	}
	context.JSON(http.StatusOK, gin.H{
		"Success": tmp_user,
	})
}

func Handle_signin_request(context *gin.Context) {
	var body NewUser
	err := json.NewDecoder(context.Request.Body).Decode(&body)
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"Error": "Failed to read body",
		})
		return
	}
	var user models.User
	db := context.MustGet("gorm").(gorm.DB)
	db.First(&user, "email=?", body.Email)

	if user.ID == 0 {
		context.JSON(http.StatusBadRequest, gin.H{
			"Error": "Invalid email",
		})
		return
	}
	/*if user.Password != body.Password {
		context.JSON(http.StatusBadRequest, gin.H{
			"Error": "Invalid Password",
		})
		return
	}*/

	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(body.Password))

	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid Password",
		})
		return
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"sub": user.ID,
		"exp": time.Now().Add(time.Hour * 24 * 30).Unix(),
	})

	token_string, err := token.SignedString([]byte(os.Getenv("SECRET")))
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to create token",
		})
		return
	}
	//r.SetSameSite(http.SameSiteLaxMode)
	context.SetCookie("Authorization", token_string, 3600*24*30, "", "", false, false)

	context.SetCookie("email", body.Email, 3600*24*30, "", "", false, false)
	context.JSON(http.StatusAccepted, gin.H{
		"Success": "Successfully connected",
	})
}

func contains_digit(s string) bool {
	for _, c := range s {
		if unicode.IsDigit(c) {
			return true
		}
	}
	return false
}

func contains_char(s string) bool {
	for _, c := range s {
		if unicode.IsLetter(c) {
			return true
		}
	}
	return false
}

func Handle_signup_request(context *gin.Context) {
	var body NewUser
	err := json.NewDecoder(context.Request.Body).Decode(&body)
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"Error": "Failed to read body",
		})
		return
	}
	hash, err := bcrypt.GenerateFromPassword([]byte(body.Password), 10)
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{
			"error": "failed to hash the password",
		})
		return
	}
	context.SetCookie("email", body.Email, 3600*24*30, "", "", false, false)
	db := context.MustGet("gorm").(gorm.DB)
	user := models.User{Email: body.Email, Password: hash}
	res := db.Where(&user).Find(&user)
	if res.Error != nil && res.Error != gorm.ErrRecordNotFound {
		println("not found")
	}
	if res.RowsAffected == 0 {
		if len(body.Password) < 8 {
			context.JSON(http.StatusBadRequest, gin.H{
				"Error": "Too short password",
			})
			return
		} else if contains_char(body.Password) == false {
			context.JSON(http.StatusBadRequest, gin.H{
				"Error": "password require at least one char",
			})
			return
		} else if contains_digit(body.Password) == false {
			context.JSON(http.StatusBadRequest, gin.H{
				"Error": "password require at least one digit",
			})
			return
		}
		db.FirstOrCreate(&user, user)
		context.JSON(http.StatusCreated, gin.H{
			"Success": "User Successfully created",
		})
	} else {
		context.JSON(http.StatusBadRequest, gin.H{
			"Error": "User already Existing",
		})
	}
	println("debug end")
}

func Handle_partner_signin_request(context *gin.Context) {
	var body NewPartner
	err := json.NewDecoder(context.Request.Body).Decode(&body)
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"Error": "Failed to read body",
		})
		return
	}
	var partner models.Partner
	db := context.MustGet("gorm").(gorm.DB)
	db.First(&partner, "email=?", body.Email)

	if partner.ID == 0 {
		context.JSON(http.StatusBadRequest, gin.H{
			"Error": "Invalid email",
		})
		return
	}
	err = bcrypt.CompareHashAndPassword([]byte(partner.Password), []byte(body.Password))

	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid Password",
		})
		return
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"sub": partner.ID,
		"exp": time.Now().Add(time.Hour * 24 * 30).Unix(),
	})

	token_string, err := token.SignedString([]byte(os.Getenv("SECRET")))
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to create token",
		})
		return
	}
	//r.SetSameSite(http.SameSiteLaxMode)
	context.SetCookie("Authorization", token_string, 3600*24*30, "", "", false, false)

	context.SetCookie("email", body.Email, 3600*24*30, "", "", false, false)
	context.JSON(http.StatusAccepted, gin.H{
		"Success": "Partner Successfully connected",
	})
}

func Handle_partner_signup_request(context *gin.Context) {
	var body NewPartner
	err := json.NewDecoder(context.Request.Body).Decode(&body)
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"Error": "Failed to read body",
		})
		return
	}
	hash, err := bcrypt.GenerateFromPassword([]byte(body.Password), 10)
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{
			"error": "failed to hash the password",
		})
		return
	}
	context.SetCookie("email", body.Email, 3600*24*30, "", "", false, false)
	db := context.MustGet("gorm").(gorm.DB)
	partner := models.Partner{Email: body.Email, Password: hash}
	res := db.Where(&partner).Find(&partner)
	if res.Error != nil && res.Error != gorm.ErrRecordNotFound {
		println("not found")
	}
	if res.RowsAffected == 0 {
		if len(body.Password) < 8 {
			context.JSON(http.StatusBadRequest, gin.H{
				"Error": "Too short password",
			})
			return
		} else if contains_char(body.Password) == false {
			context.JSON(http.StatusBadRequest, gin.H{
				"Error": "password require at least one char",
			})
			return
		} else if contains_digit(body.Password) == false {
			context.JSON(http.StatusBadRequest, gin.H{
				"Error": "password require at least one digit",
			})
			return
		}
		db.FirstOrCreate(&partner, partner)
		context.JSON(http.StatusCreated, gin.H{
			"Success": "Partner Successfully created",
		})
	} else {
		context.JSON(http.StatusBadRequest, gin.H{
			"Error": "Partner already Existing",
		})
	}
	println("debug end")
}

func Handle_get_all_cloths_request(context *gin.Context) {
	var result []models.Cloth

	db := context.MustGet("gorm").(gorm.DB)
	err := db.Raw("SELECT * FROM cloths").Scan(&result)

	if err != nil {
		context.JSON(500, gin.H{"error": err})
	} else if len(result) <= 0 {
		context.JSON(400, gin.H{"Error": "No cloths founded"})
	}
	context.JSON(200, gin.H{"All cloths": result})
}

func Handle_get_user_request(context *gin.Context) {
	var mail GetUser
	string_body, _ := io.ReadAll(context.Request.Body)
	err := json.Unmarshal([]byte(string_body), &mail)
	if err != nil {
		context.JSON(400, gin.H{"Error": "Wrong register request format"})
	} else if mail.Email == "" {
		context.JSON(400, gin.H{"Error": "error no mail given"})
	} else {
		db := context.MustGet("gorm").(gorm.DB)
		var result InfosFromGet
		db.Raw("SELECT Name, Email FROM users WHERE Email= ?", mail.Email).Scan(&result)
		context.JSON(200, gin.H{"Get_user": result})
	}
}

func calc_score(materials string, type_ string, water int, gaz int, origin string, means_of_transports string, brand string) (result string) {
	//Score de base
	score := 3.0

	materials_score, err := strconv.ParseFloat(calc_materials_score(materials), 64)
	if err != nil {
		fmt.Println("Error :", err)
	}
	if materials_score >= 3.5 && score < 5 {
		score += 1
	} else {
		if score > 1 {
			score -= 1
		}
	}

	if gaz >= 20 {
		score -= 0.5
	}

	worst_country := [8]string{
		"Bangladesh",
		"Chine",
		"Inde",
		"Vietnam",
		"Thaïlande",
		"Cambodge",
		"Indonésie",
		"Pakistan",
	}

	good_country := [9]string{
		"France",
		"Suède",
		"Allemagne",
		"Canada",
		"Suisse",
		"Danemark",
		"Finlande",
		"Norvège",
		"Pays-Bas",
	}

	for i := 0; i < len(good_country); i++ {
		if origin == good_country[i] && score < 5 {
			score += 1
		}
	}

	for i := 0; i < len(worst_country); i++ {
		if origin == worst_country[i] && score > 1 {
			score -= 1
		}
	}

	if water >= 8000 {
		score -= 0.5
	}

	good_transport := [1]string{
		"Train",
	}

	worst_transport := [3]string{
		"Avion",
		"Bâteau",
		"Camion",
	}

	for i := 0; i < len(good_transport); i++ {
		if strings.Contains(means_of_transports, good_transport[i]) && score < 5 {
			score += 0.5
		}
	}

	for i := 0; i < len(worst_transport); i++ {
		if strings.Contains(means_of_transports, worst_transport[i]) && score > 1 {
			score -= 0.5
		}
	}

	good_brand := [3]string{
		"Patagonia",
		"Veja",
		"Le Slip Français",
	}

	for i := 0; i < len(good_brand); i++ {
		if strings.Contains(brand, good_brand[i]) && score < 5 {
			score += 0.5
		}
	}

	fmt.Println("Score : ", score)
	return strconv.FormatFloat(score, 'f', 2, 64)
}

func calc_water_consommation(type_ string) (result string) {
	//en litres
	arr := map[string]int{
		"Écharpe":     2000,
		"Casquette":   1000,
		"Pull":        5500,
		"T-shirt":     2700,
		"Pantalon":    8500,
		"Short":       2000,
		"Chaussures":  8000,
		"Chaussettes": 70,
	}

	for categories, conso := range arr {
		if type_ == categories {
			return strconv.Itoa(conso)
		}
	}
	return "-1"
}

func calc_gaz_consommation(type_ string) (result string) {

	//en kg
	arr := map[string]float64{
		"Écharpe":     5,
		"Casquette":   0.3,
		"Pull":        20,
		"T-shirt":     6,
		"Pantalon":    25,
		"Short":       5,
		"Chaussures":  13,
		"Chaussettes": 0.15,
	}

	for categories, conso := range arr {
		if type_ == categories {
			return strconv.FormatFloat(conso, 'f', 2, 64)
		}
	}
	return "-1"
}

func calc_water_score(type_ string) (result string) {
	arr := map[string]float64{
		"Écharpe":     3.5,
		"Casquette":   4.0,
		"Pull":        2.5,
		"T-shirt":     3.0,
		"Pantalon":    2.0,
		"Short":       4.0,
		"Chaussures":  3.5,
		"Chaussettes": 4.5,
	}

	for categories, conso := range arr {
		if type_ == categories {
			return strconv.FormatFloat(conso, 'f', 2, 64)
		}
	}

	return "-1"
}

func calc_gaz_score(type_ string) (result string) {

	arr := map[string]float64{
		"Écharpe":     4.5,
		"Casquette":   4.5,
		"Pull":        2.0,
		"T-shirt":     3.5,
		"Pantalon":    3,
		"Short":       3.5,
		"Chaussures":  3,
		"Chaussettes": 4.5,
	}

	for categories, conso := range arr {
		if type_ == categories {
			return strconv.FormatFloat(conso, 'f', 2, 64)
		}
	}
	return "-1"
}

func calc_materials_score(materials string) (result string) {
	score := 3.0

	//textiles les mieux côtés
	good_materials := [8]string{
		"Chanvre",
		"Lin",
		"Coton biologique",
		"Laine",
		"Tencel",
		"Cuir végétal",
		"Lyocell",
		"Laine mérinos",
	}

	//texttiles les moins côtés
	worst_materials := [7]string{
		"Polyester",
		"Viscose",
		"Nylon",
		"Acrylique",
		"Cuir",
		"Cachemire",
		"Polyuréthane",
	}

	for i := 0; i < len(good_materials); i++ {
		if strings.Contains(materials, good_materials[i]) && score < 5 {
			score += 0.5
		}
	}

	for i := 0; i < len(worst_materials); i++ {
		if strings.Contains(materials, worst_materials[i]) && score > 1 {
			score -= 1.0
		}
	}
	return strconv.FormatFloat(score, 'f', 1, 64)
}

func Handle_upload_cloth_request(context *gin.Context) {
	var cloth models.Cloth
	string_body, _ := io.ReadAll(context.Request.Body)
	err := json.Unmarshal([]byte(string_body), &cloth)
	if err != nil {
		context.JSON(400, gin.H{"Error": "Wrong upload request format"})
		//} else if cloth.ID < 0 {
		//	context.JSON(400, gin.H{"Error": "error no id given"})
	} else if cloth.Brand == "" {
		context.JSON(400, gin.H{"Error": "error no brand given"})
		//} else if cloth.Quality_product <= 0 || cloth.Quality_product > 5 {
		//	context.JSON(400, gin.H{"Error": "error no quality_product given"})
		//} else if cloth.Conditions_working == "" {
		//	context.JSON(400, gin.H{"Error": "error no conditions_working given"})
		//} else if cloth.Workers_salary <= 0 {
		//	context.JSON(400, gin.H{"Error": "error no workers_salary given"})
	} else if cloth.Materials == "" {
		context.JSON(400, gin.H{"Error": "error no materials given"})
		//} else if cloth.Factory == "" {
		//	context.JSON(400, gin.H{"Error": "error no factory given"})
		//} else if cloth.Pre_wash <= 0 {
		//	context.JSON(400, gin.H{"Error": "error no pre_wash given"})
		//} else if cloth.Packaging <= 0 {
		//	context.JSON(400, gin.H{"Error": "error no packaging given"})
		//} else if cloth.Original_country == "" {
		//	context.JSON(400, gin.H{"Error": "error no original_country given"})
		//} else if cloth.Means_of_transports == "" {
		//	context.JSON(400, gin.H{"Error": "error no means_of_transports given"})
	} else if cloth.Type == "" {
		context.JSON(400, gin.H{"Error": "error no type given"})
	} else if cloth.Description == "" {
		context.JSON(400, gin.H{"Error": "error no description given"})
	} else if cloth.Price == "" {
		context.JSON(400, gin.H{"Error": "error no price given"})
	} else if cloth.Picture == "" {
		context.JSON(400, gin.H{"Error": "error no Picture given"})
	} else {
		db := context.MustGet("gorm").(gorm.DB)
		w_conso, err2 := strconv.Atoi(calc_water_consommation(cloth.Type))
		if err2 != nil {
			fmt.Println("Error: ", err2)
		}
		g_conso, err3 := strconv.Atoi(calc_gaz_consommation(cloth.Type))
		if err3 != nil {
			fmt.Println("Error: ", err3)
		}
		cloth_model := models.Cloth{Greenhouse_gaz_conso: calc_gaz_consommation(cloth.Type), Water_conso: calc_water_consommation(cloth.Type), Quality_product: cloth.Quality_product, Conditions_working: cloth.Conditions_working, Materials: cloth.Materials, Pre_wash: cloth.Pre_wash, Packaging: cloth.Packaging, Original_country: cloth.Original_country, Means_of_transports: cloth.Means_of_transports, Brand: cloth.Brand, Type: cloth.Type, Score: calc_score(cloth.Materials, cloth.Type, w_conso, g_conso, cloth.Original_country, cloth.Means_of_transports, cloth.Brand), Water_score: calc_water_score(cloth.Type), Materials_score: calc_materials_score(cloth.Materials), Gaz_score: calc_gaz_score(cloth.Type), Description: cloth.Description, Price: cloth.Price, Picture: cloth.Picture}
		db.Create(&cloth_model)
		var tmp_cloth []models.Cloth
		db.Find(&tmp_cloth)

		for _, cloth := range tmp_cloth {
			fmt.Println(cloth.Gaz_score, cloth.Materials_score, cloth.Water_score, cloth.Score)
		}
		context.JSON(200, gin.H{"Cloth Upload": "OK"})
	}
}

// func Handle_get_cloth_request(context *gin.Context) {
// 	type Get_Id struct {
// 		ID int
// 	}
// 	var id Get_Id
// 	string_body, _ := io.ReadAll(context.Request.Body)
// 	err := json.Unmarshal([]byte(string_body), &id)
// 	if err != nil {
// 		context.JSON(400, gin.H{"Error": "Wrong register request format"})
// 	} else if id.ID <= 0 {
// 		context.JSON(400, gin.H{"Error": "error no id given"})
// 	} else {
// 		db := context.MustGet("gorm").(gorm.DB)
// 		var result models.Cloth
// 		db.Raw("SELECT * FROM cloths WHERE ID= ?", id.ID).Scan(&result)
// 		context.JSON(200, gin.H{"Get cloth": result})
// 	}
//}*/
