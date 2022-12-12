package middleware

import (
	"Back-End.clothway/database"
	"github.com/gin-gonic/gin"
)

func Link_api_to_db(db *database.Database) gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Set("gorm", *db.DB)
		c.Next()
	}
}
