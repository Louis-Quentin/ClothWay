package router

import (
	"Back-End.clothway/models"
	"bytes"
	"encoding/json"
	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"net/http"
	"net/http/httptest"
	"testing"
)

type Database struct {
	*gorm.DB
}

func TestHandleSigninRequest(t *testing.T) {
	// set up test database
	dsn := "host=db user=dev_user password=Clothway dbname=gorm port=5432 sslmode=disable TimeZone=Europe/Paris"
	var db Database
	var err error
	db.DB, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	println("dbug 1")
	assert.NoError(t, err)
	err = db.AutoMigrate(&models.User{})
	assert.NoError(t, err)

	// create a test Gin context with request body and database
	body := gin.H{"email": "user@example.com", "password": "password123"}
	bodyBytes, _ := json.Marshal(body)
	req, _ := http.NewRequest("POST", "/", bytes.NewBuffer(bodyBytes))
	w := httptest.NewRecorder()
	c, _ := gin.CreateTestContext(w)
	c.Request = req
	c.Set("gorm", db)

	// create a test user in the database
	user := models.User{Email: "user@example.com", Password: "password123"}
	err = db.Create(&user).Error
	assert.NoError(t, err)

	// call the function to test
	Handle_signin_request(c)

	// check the response status code and body
	assert.Equal(t, http.StatusAccepted, w.Code)
	assert.JSONEq(t, `{"Success": "Successfully connected"}`, w.Body.String())
}
