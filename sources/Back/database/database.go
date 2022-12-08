package database

import (
	"Back-End.clothway/models"
	"gorm.io/driver/postgres"

	//"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type Database struct {
	*gorm.DB
}

func (database *Database) Init_database() (err error) {
	dsn := "host=localhost user=dev_user password=Clothway dbname=gorm port=5432 sslmode=disable TimeZone=Europe/Paris"
	database.DB, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		return
	}
	err = database.DB.AutoMigrate(&models.User{})
	return
}
