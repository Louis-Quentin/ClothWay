package main

import (
	"Back-End.clothway/database"
	"Back-End.clothway/middleware"
	router "Back-End.clothway/sources"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"log"
)

func apply_routes(r *gin.Engine, db *database.Database) {

	r.Use(middleware.Link_api_to_db(db))
	r.GET("/home", router.Handle_home_request)
	r.GET("/", router.Handle_home_request)
	r.GET("/get_user", router.Handle_get_user_request)
	r.POST("/login", router.Handle_login_request)
	r.POST("/register", router.Handle_register_request)
	r.POST("/upload_cloth", router.Handle_upload_cloth_request)
	r.GET("/get_cloth", router.Handle_get_cloth_request)
	r.GET("/get_all_cloths", router.Handle_get_all_cloths_request)
}

func main() {
	var db database.Database
	gin.SetMode(gin.ReleaseMode)
	r := gin.New()

	r.Use(cors.Default())
	err := db.Init_database()
	if err != nil {
		log.Fatal(err)
	}
	apply_routes(r, &db)
	err = r.Run(":8080")
	if err != nil {
		log.Fatal(err)
	}
}
