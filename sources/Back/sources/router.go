package router

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func Handle_home_request(context *gin.Context) {
	var msg string
	if err := context.ShouldBind(&msg); err != nil {
		context.AbortWithError(http.StatusBadRequest, err)
	} else {
		fmt.Println(context.Request)
		context.JSON(200, gin.H{"path": "home"})
	}
}

func Handle_register_request(context *gin.Context) {
	var msg string

	if err := context.ShouldBind(&msg); err != nil {
		context.AbortWithError(http.StatusBadRequest, err)
	} else {
		fmt.Println(context.Request)
		context.JSON(200, gin.H{"path": "register"})
	}
}

func Handle_login_request(context *gin.Context) {
	var msg string

	if err := context.ShouldBind(&msg); err != nil {
		context.AbortWithError(http.StatusBadRequest, err)
	} else {
		fmt.Println(context.Request)
		context.JSON(200, gin.H{"path": "login"})
	}
}
