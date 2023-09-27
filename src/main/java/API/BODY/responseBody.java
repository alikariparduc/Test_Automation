package API.BODY;

import io.restassured.response.Response;

import java.util.Map;

import static io.restassured.RestAssured.given;
import static io.restassured.http.ContentType.JSON;

public class responseBody {

    /**
     * Function:GetResponse
     * Description:
     * Input Parameters:
     *
     * @param reqBody        Body of the sent request.
     * @param desiredPostURL URL to be posted
     * @param token          Token information
     *                       Author: Hilal Yilmaz
     *                       Date: 04-06-21
     */
    public static Response getResponse(String desiredAPIPath, String reqBody, String token, String desiredPostURL, Map<String, String> map) {
        switch (desiredAPIPath) {
            case "GET":
                return given()
                        .header("Authorization", "Bearer " + token)
                        .contentType(JSON)
                        .queryParams(map)
                        .and()
                        .body(reqBody)
                        .when()
                        .get(desiredPostURL)
                        .then()
                        .extract().response();
            case "POST":
                return given()
                        .header("Authorization", "Bearer " + token)
                        .contentType(JSON)
                        .queryParams(map)
                        .and()
                        .body(reqBody)
                        .when()
                        .post(desiredPostURL)
                        .then()
                        .extract().response();
        }
        return null;
    }

    /**
     * Function:GetResponse
     * Description:
     * Input Parameters:
     *
     * @param reqBody        Body of the sent request.
     * @param desiredPostURL URL to be posted
     * @param token          Token information
     *                       Author: Hilal Yilmaz
     *                       Date: 04-06-21
     */
    public static Response getResponse(String desiredAPIPath,String reqBody, String token, String desiredPostURL) {
        switch (desiredAPIPath) {
            case "GET":
                return given()
                        .header("Authorization", "Bearer " + token)
                        .contentType(JSON)
                        .and()
                        .body(reqBody)
                        .when()
                        .get(desiredPostURL)
                        .then()
                        .extract().response();
            case "POST":
                return given()
                        .header("Authorization", "Bearer " + token)
                        .contentType(JSON)
                        .and()
                        .body(reqBody)
                        .when()
                        .post(desiredPostURL)
                        .then()
                        .extract().response();
        }
        return null;
    }

    /**
     * Function:GetResponseWithBasicAuthentication
     * Description:Response method with token information.
     * Input Parameters: None.
     * Author: Hilal Yilmaz
     * Date: 04-06-21
     */
    public static Response getResponseWithBasicAuthentication(String reqBody, String desiredPostURL
            , String username, String password) {
        return given()
                .auth()
                .preemptive()
                .basic(username, password)
                .contentType(JSON)
                .and()
                .body(reqBody)
                .when()
                .post(desiredPostURL)
                .then()
                .extract().response();
    }


}

