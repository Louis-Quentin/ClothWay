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
	r.GET("/", router.Handle_home_request)
	r.POST("/signin", router.Handle_signin_request)
	r.POST("/signup", router.Handle_signup_request)
	r.GET("/get_all", router.Handle_get_all_cloths_request)
	r.POST("/partner_signin", router.Handle_partner_signin_request)
	r.POST("/partner_signup", router.Handle_partner_signup_request)
	r.POST("/register_cloth", router.Handle_upload_cloth_request)
	r.GET("/get_user_profile", middleware.Require_auth, router.Handle_user_profile)
	r.GET("/get_social_network", router.Handle_get_social_network)
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
