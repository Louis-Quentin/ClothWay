package router

import (
	"encoding/json"
	"fmt"
	"io"
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
	Name string
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
		user_model := models.User{Name: user.Login,Email: user.Email, Password: user.Password}
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

func Handle_upload_cloth_request(context *gin.Context) {
	var cloth models.Cloth
	string_body, _ := io.ReadAll(context.Request.Body)
	err := json.Unmarshal([]byte(string_body), &cloth)
	if err != nil  {
		context.JSON(400, gin.H{"Error": "Wrong upload cloth request format"})
	} else if cloth.Price <= 0 {
		context.JSON(400, gin.H{"Error": "error no price given"})
	} else if cloth.Elec_Conso <= 0 {
		context.JSON(400, gin.H{"Error": "error no electricity consumption given"})
	} else if cloth.Co2_Conso <= 0 {
		context.JSON(400, gin.H{"Error": "error no co2 consumption given"})
	} else if cloth.Water_Conso <= 0 {
		context.JSON(400, gin.H{"Error": "error no water consumption given"})
	} else if cloth.ID <= 0 {
		context.JSON(400, gin.H{"Error": "error no id given"})
	} else if cloth.Brand == "" {
		context.JSON(400, gin.H{"Error": "error no brand given"})
	} else {
		db := context.MustGet("gorm").(gorm.DB)
		cloth_model := models.Cloth{Price: cloth.Price, Elec_Conso: cloth.Price, Co2_Conso: cloth.Co2_Conso, Water_Conso: cloth.Co2_Conso, ID: cloth.ID, Brand: cloth.Brand}

		db.Create(&cloth_model)
		var tmp_cloth []models.Cloth
		db.Find(&tmp_cloth)
		fmt.Println(tmp_cloth)
		context.JSON(200, gin.H{"Cloth Upload": "OK"})
	}
}

func Handle_get_cloth_request(context *gin.Context) {
	type Get_Id struct {
		ID int
	}
	var id Get_Id
	string_body, _ := io.ReadAll(context.Request.Body)
	err := json.Unmarshal([]byte(string_body), &id)
	if err != nil {
		context.JSON(400, gin.H{"Error": "Wrong register request format"})
	} else if id.ID <= 0 {
		context.JSON(400, gin.H{"Error": "error no id given"})
	} else {
		db := context.MustGet("gorm").(gorm.DB)
		var result models.Cloth
		db.Raw("SELECT * FROM cloths WHERE ID= ?", id.ID).Scan(&result)
		context.JSON(200, gin.H{"Get cloth": result})
	}
}
