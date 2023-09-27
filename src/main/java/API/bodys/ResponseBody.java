package API.bodys;

import com.saf.framework.AutomationConstants;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.apache.http.HttpStatus;

import java.util.Map;

import static io.restassured.RestAssured.given;
import static io.restassured.http.ContentType.JSON;
import static io.restassured.http.ContentType.XML;
import static io.restassured.specification.ProxySpecification.host;

public class ResponseBody {

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

    public static Response getResponse(String desiredRequest, String reqBody, String token, String desiredPostURL, Map<String, String> map) {
        try {
            switch (desiredRequest) {
                case "GET":
                    return given()
                            .header("Authorization", "Bearer " + token)
                            .headers(Header.headers)
                            .queryParams(map)
                            .and()
                            .body(reqBody)
                            .when()
                            .get(desiredPostURL)
                            .then()
                            .assertThat().statusCode(HttpStatus.SC_OK)
                            .extract().response();
                case "POST":
                    return given()
                            .header("Authorization", "Bearer " + token)
                            .headers(Header.headers)
                            .queryParams(map)
                            .and()
                            .body(reqBody)
                            .when()
                            .post(desiredPostURL)
                            .then()
                            .assertThat().statusCode(HttpStatus.SC_OK)
                            .extract().response();
            }

        } catch (Exception e) {
            e.getMessage();
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
     *                       Author: Hilal Yilmaz
     *                       Date: 04-06-21
     */

    public static Response getResponse(String desiredRequest, String reqBody, String desiredPostURL, Map<String, String> map) {
        try {
            switch (desiredRequest) {
                case "GET":
                    return given()
                            .headers(Header.headers)
                            .queryParams(map)
                            .and()
                            .body(reqBody)
                            .when()
                            .get(desiredPostURL)
                            .then()
                            .assertThat().statusCode(HttpStatus.SC_OK)
                            .extract().response();
                case "POST":
                    return given()
                            .headers(Header.headers)
                            .queryParams(map)
                            .and()
                            .body(reqBody)
                            .when()
                            .post(desiredPostURL)
                            .then()
                            .assertThat().statusCode(HttpStatus.SC_OK)
                            .extract().response();
            }

        } catch (Exception e) {
            e.getMessage();
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
    public static Response getResponse(String desiredRequestMethod, String reqBody, String token, String desiredPostURL) {
        try {
            switch (desiredRequestMethod) {
                case "GET":
                    return given()
                            //.headers(Header.headers)
                            .header("Authorization", "Bearer " + token)
                            .contentType(JSON)
                            .body(reqBody)
                            .when()
                            .get(desiredPostURL)
                            .then()
                            //.statusCode(HttpStatus.SC_OK)
                            .extract().response();
                case "POST":
                    return given()
                            //.headers(Header.headers)
                            .header("Authorization", "Bearer " + token)
                            .contentType(ContentType.JSON)
                            .body(reqBody)
                            .when()
                            .post(desiredPostURL)
                            .then()
                            // .statusCode(HttpStatus.SC_OK)
                            .extract().response();
            }

        } catch (Exception e) {
            e.printStackTrace();
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
     *                       Author: Hilal Yilmaz
     *                       Date: 04-06-21
     */
    public static Response getResponse(String desiredRequest, String reqBody, String desiredPostURL) {
        try {
            switch (desiredRequest) {
                case "GET":
                    return given()
                            .contentType(JSON)
                            .body(reqBody)
                            .when()
                            .get(desiredPostURL)
                            .then()
                            //.statusCode(HttpStatus.SC_OK)
                            .extract().response();
                case "POST":
                    return given()
                            .contentType(ContentType.JSON)
                            .body(reqBody)
                            .when()
                            .post(desiredPostURL)
                            .then()
                            //.statusCode(HttpStatus.SC_OK)
                            .extract().response();
            }

        } catch (Exception e) {
            e.printStackTrace();
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

    public static Response getResponseWithSOAPAPI(String reqBody, String desiredPostURL) {
        return given()
                .request().body(reqBody)
                .contentType(XML)
                .headers("SOAPAction", "findSoapAction").
                        when()
                .post(desiredPostURL).
                        then()
                .assertThat()
                .statusCode(HttpStatus.SC_OK).extract().response();
    }

}

