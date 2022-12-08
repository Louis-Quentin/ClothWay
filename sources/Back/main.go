package main

import (
	"Back-End.clothway/database"
	"Back-End.clothway/models"
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
	var db database.Database
	err := db.Init_database()
	if err != nil {
		log.Fatal(err)
	}
	user_model := models.User{Name: "user"}
	_ = user_model.Create(db.DB)
	apply_routes(r)
	err = r.Run(":8080")
	if err != nil {
		log.Fatal(err)
	}
}
