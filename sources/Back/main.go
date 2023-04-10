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
