package middleware

import (
	"fmt"
	"log"

	"temp/models"

	jwt "github.com/dgrijalva/jwt-go"
)

var jwtKey = []byte("6B833C42246DA36D0DCC912DE9220DE4F6DD146321639B59AC4D1B9BD226A228")

type claims struct {
	Email    string `json:"email"`
	Password string `json:"password"`
	jwt.StandardClaims
}

// //JwtAuthentication validate the jwt for the incoming request
// func JwtAuthentication(next http.HandlerFunc) http.HandlerFunc {
// 	return func(w http.ResponseWriter, r *http.Request) {

// 		c := r.Header.Get("Authorization")
// 		if c == "" {
// 			res.RespondWithError(w, http.StatusUnauthorized, "Missing auth token")
// 			log.Println("Missing auth token")
// 			return
// 		}

// 		tknStr := strings.TrimPrefix(c, "Bearer ")

// 		claims := &claims{}

// 		tkn, err := jwt.ParseWithClaims(tknStr, claims, func(token *jwt.Token) (interface{}, error) {
// 			return jwtKey, nil
// 		})
// 		if err != nil {
// 			if err == jwt.ErrSignatureInvalid {
// 				// For any other type of error, return a bad request status
// 				res.RespondWithError(w, http.StatusUnauthorized, "Unauthorized Request")
// 				log.Printf("Unauthorized Request, error: %v", err)
// 				return
// 			}
// 			res.RespondWithError(w, http.StatusForbidden, "JWT expired  Has to renew de JWT")
// 			log.Println("JWT expired - Has to renew de JWT")
// 			return
// 		}
// 		if !tkn.Valid {
// 			res.RespondWithError(w, http.StatusUnauthorized, "Unauthorized Request")
// 			log.Printf("Unauthorized Request, token no valid")
// 			return
// 		}

// 		//Everything went well, proceed with the request and set the caller to the user retrieved from the parsed token
// 		fmt.Printf("User: %v, is login", claims.Email) //Useful for monitoring
// 		ctx := context.WithValue(r.Context(), "user", claims.Email)
// 		r = r.WithContext(ctx)
// 		next.ServeHTTP(w, r) //proceed in the middleware chain!
// 	}
// }

// Signin givin a user, will generate the Token.
func Signin(user *models.User) (string, error) {

	claims := &claims{
		Email:          user.Email,
		StandardClaims: jwt.StandardClaims{},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

	tokenString, err := token.SignedString(jwtKey)
	if err != nil {
		log.Printf("Internal server error, error: %v", err)
		return "", err
	}

	fmt.Printf("Token generated for User: %v", claims.Email)
	return tokenString, nil
}
