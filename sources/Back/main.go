package main

import (
	router "Back-End.clothway/sources"
	"github.com/gin-gonic/gin"
	"log"
)

func apply_routes(r *gin.Engine) {

	r.GET("/home", router.Handle_home_request)
	r.GET("/", router.Handle_home_request)
	r.POST("/login", router.Handle_login_request)
	r.POST("/register", router.Handle_register_request)

}

func main() {
	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()
	apply_routes(r)
	err := r.Run(":8080")
	if err != nil {
		log.Fatal(err)
	}
}
