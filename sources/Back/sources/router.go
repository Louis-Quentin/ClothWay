package router

import (
	"Back-End.clothway/models"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
	"io"
)

type User struct {
	Login    string `json:"login"`
	Password string `json:"password"`
}

type NewUser struct {
	Login    string
	Password string
	Email    string
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
		context.JSON(300, gin.H{"Error": "error no login given"})
	} else if user.Password == "" {
		context.JSON(300, gin.H{"Error": "error no password given"})
	} else if user.Email == "" {
		context.JSON(300, gin.H{"Error": "error no email given"})
	} else {
		db := context.MustGet("gorm").(gorm.DB)
		user_model := models.User{Name: user.Login, Email: user.Email, Password: user.Password}
		err = user_model.Create(&db)
		if err != nil {
			context.JSON(300, gin.H{"Error": "failed to create a new user"})
		}
		var tmp_user []User
		db.Find(&tmp_user)
		fmt.Println(tmp_user)
		context.JSON(200, gin.H{"Register": "OK"})
	}
}

func Handle_get_user_request(context *gin.Context) {
	//récuperer proproment l'user
	var user []User
	db := context.MustGet("gorm").(gorm.DB)
	user_find := db.Find(&user)
	result, _ := json.Marshal(user_find)
	context.JSON(100, result)
}

func Handle_login_request(context *gin.Context) {
	var user User
	string_body, _ := io.ReadAll(context.Request.Body)
	err := json.Unmarshal([]byte(string_body), &user)
	if err != nil {
		context.JSON(400, gin.H{"Error": "Wrong login request format"})
	} else if user.Login == "" {
		context.JSON(300, gin.H{"Error": "error no login given"})
	} else if user.Password == "" {
		context.JSON(300, gin.H{"Error": "error no password given"})
	} else {
		//db := context.MustGet("gorm").(gorm.DB)
		//db.Get("")
		context.JSON(200, gin.H{"Login": "OK"})
	}
}
