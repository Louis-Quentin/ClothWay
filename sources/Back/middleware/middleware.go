package middleware

import (
	"Back-End.clothway/database"
	"Back-End.clothway/models"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt"
	"gorm.io/gorm"
	"net/http"
	"os"
	"time"
)

func Link_api_to_db(db *database.Database) gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Set("gorm", *db.DB)
		c.Next()
	}
}

func Require_auth(r *gin.Context) {
	token_string, err := r.Cookie("Authorization")

	if err != nil {
		r.AbortWithStatus(http.StatusUnauthorized)
		return
	}
	token, err := jwt.Parse(token_string, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
		}
		return []byte(os.Getenv("SECRET")), nil
	})
	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		if float64(time.Now().Unix()) > claims["exp"].(float64) {
			r.AbortWithStatus(http.StatusUnauthorized)
			return
		}
		var user models.User
		db := r.MustGet("gorm").(gorm.DB)
		db.First(&user, claims["sub"])
		if user.ID == 0 {
			r.AbortWithStatus(http.StatusUnauthorized)
			return
		}
		println("user set in context")
		r.Set("user", user)
		r.Next()
	} else {
		r.Redirect(http.StatusTemporaryRedirect, "http://localhost:8080/signin")
		//r
		r.Abort()
		return
	}
}
