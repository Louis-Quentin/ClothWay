package router

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"io"
)

type User struct {
	Login    string
	Password string
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
		context.JSON(200, gin.H{"Register": "OK"})
	}
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
		context.JSON(200, gin.H{"Login": "OK"})
	}
}
