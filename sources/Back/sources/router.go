package router

import (
	"encoding/json"
	"fmt"
	"io"
	"strings"
	"strconv"
	"Back-End.clothway/models"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type NewUser struct {
	Login    string
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

func Handle_home_request(context *gin.Context) {
	var msg string
	if err := context.ShouldBind(&msg); err != nil {
		context.JSON(400, gin.H{"Error": "Wrong home request format"})
	} else {
		context.JSON(200, gin.H{"Home": "OK"})
	}
}

func Handle_register_request(context *gin.Context) {
	var user NewUser
	string_body, _ := io.ReadAll(context.Request.Body)
	err := json.Unmarshal([]byte(string_body), &user)
	if err != nil {
		context.JSON(400, gin.H{"Error": "Wrong register request format"})
	} else if user.Login == "" {
		context.JSON(400, gin.H{"Error": "error no login given"})
	} else if user.Password == "" {
		context.JSON(400, gin.H{"Error": "error no password given"})
	} else if user.Email == "" {
		context.JSON(400, gin.H{"Error": "error no email given"})
	} else {
		db := context.MustGet("gorm").(gorm.DB)
		user_model := models.User{Name: user.Login, Email: user.Email, Password: user.Password}
		db.Create(&user_model)
		var tmp_user []models.User
		db.Find(&tmp_user)
		fmt.Println(tmp_user)
		context.JSON(200, gin.H{"Register": "OK"})
	}
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

func Handle_login_request(context *gin.Context) {
	var user models.User
	string_body, _ := io.ReadAll(context.Request.Body)
	err := json.Unmarshal([]byte(string_body), &user)
	if err != nil {
		context.JSON(400, gin.H{"Error": "Wrong login request format"})
	} else if user.Name == "" {
		context.JSON(400, gin.H{"Error": "error no login given"})
	} else if user.Password == "" {
		context.JSON(400, gin.H{"Error": "error no password given"})
	} else {
		context.JSON(200, gin.H{"Login": "OK"})
	}
}

func calc_score(materials string, type_ string, water int, gaz int, origin string) (result string) {
	score := 5

	if strings.Contains(materials, "coton") == true && score > 1 {
		score -= 1
	}
	if strings.Contains(materials, "polyester") == true && score > 1 {
		score -= 1
	}
	if strings.Contains(materials, "viscose") == true && score > 1 {
		score -= 1
	}
	if strings.Contains(materials, "bio") == true && score < 5 {
		score += 1
	}
	if gaz > 20 {
		score -= 1
	}

	if (origin == "Chine" || origin == "Bangladesh" || origin == "Vietnam" || origin == "Thaïlande") && score > 1 {
		score -= 1
	}

	if (origin == "France" || origin == "Allemagne" || origin == "Suisse" || origin == "Suède" || origin == "Canada" || origin == "Finlande" || origin == "Norvège") && score < 5 {
		score += 1
	}
	if water > 8000 {
		score -= 1
	}
	return strconv.Itoa(score)
}

func calc_water_consommation(type_ string) (result string) {
	if type_ == "Haut" {
		return "1300"
	}
	if type_ == "Bas" {
		return "8500"
	}
	if type_ == "Chaussures" {
		return "8000"
	}
	return "-1"
}

func calc_gaz_consommation(type_ string) (result string) {
	if type_ == "Haut" {
		return "10"
	}
	if type_ == "Bas" {
		return "25"
	}
	if type_ == "Chaussures" {
		return "13"
	}
	return "-1"
}

func calc_water_score(type_ string) (result string) {
	if type_ == "Haut" {
		return "4"
	}
	if type_ == "Bas" {
		return "3"
	}
	if type_ == "Chaussures" {
		return "3"
	}
	return "-1"
}

func calc_gaz_score(type_ string) (result string) {
	if type_ == "Haut" {
		return "4"
	}
	if type_ == "Bas" {
		return "3"
	}
	if type_ == "Chaussures" {
		return "3"
	}
	return "-1"
}

func calc_materials_score(materials string) (result string) {
	if (strings.Contains(materials, "chanvre") == true || strings.Contains(materials, "lin") == true || strings.Contains(materials, "coton biologique") == true || strings.Contains(materials, "laine") == true) && strings.Contains(materials, "polyester") == false && strings.Contains(materials, "viscose") == false {
		return "5"
	}
	if strings.Contains(materials, "coton") == false && strings.Contains(materials, "polyester") == false && strings.Contains(materials, "viscose") == false {
		return "4"
	}
	if strings.Contains(materials, "coton") == true && strings.Contains(materials, "polyester") == true && strings.Contains(materials, "viscose") == true {
		return "1"
	}
	if strings.Contains(materials, "coton") == true || strings.Contains(materials, "polyester") == true || strings.Contains(materials, "viscose") == true {
		return "3"
	}
	return "-1"
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
		w_conso, _ := strconv.Atoi(cloth.Water_conso)
		g_conso, _:=strconv.Atoi(cloth.Greenhouse_gaz_conso)
		cloth_model := models.Cloth{Greenhouse_gaz_conso: calc_gaz_consommation(cloth.Type), Water_conso: calc_water_consommation(cloth.Type), Quality_product: cloth.Quality_product, Conditions_working: cloth.Conditions_working, Materials: cloth.Materials, Factory: cloth.Factory, Pre_wash: cloth.Pre_wash, Packaging: cloth.Packaging, Original_country: cloth.Original_country, Means_of_transports: cloth.Means_of_transports,Brand: cloth.Brand, Type: cloth.Type, Score: calc_score(cloth.Materials, cloth.Type, w_conso, g_conso, cloth.Original_country), Water_score: calc_water_score(cloth.Type), Materials_score: calc_materials_score(cloth.Materials), Gaz_score: calc_gaz_score(cloth.Type), Description: cloth.Description, Price: cloth.Price, Picture: cloth.Picture}
		db.Create(&cloth_model)
		var tmp_cloth []models.Cloth
		db.Find(&tmp_cloth)
		context.JSON(200, gin.H{"Cloth Upload": "OK"})
	}
}

func Handle_get_all_cloths_request(context *gin.Context) {
	var result []models.Cloth
	db := context.MustGet("gorm").(gorm.DB)
	db.Raw("SELECT * FROM cloths").Scan(&result)
	context.JSON(200, gin.H{"All cloths": result})
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
//}
