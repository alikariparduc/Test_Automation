package API.config;

import io.restassured.RestAssured;
import io.restassured.config.HttpClientConfig;
import io.restassured.config.RestAssuredConfig;

public class RestAssuredConfigurator {
    private static RestAssuredConfig restAssuredConfig;
    public static void configure() {
        // Create a customized HttpClientConfig with "no proxy" configuration
        HttpClientConfig httpClientConfig = HttpClientConfig.httpClientConfig()
                .setParam("http.route.default-proxy", null)
                .setParam("https.route.default-proxy", null);
        // Create a Rest Assured configuration with the customized HttpClientConfig
        restAssuredConfig = RestAssured.config().httpClient(httpClientConfig);
        // Set the Rest Assured configuration globally
        RestAssured.config = restAssuredConfig;
    }
    public static RestAssuredConfig getRestAssuredConfig() {
        if (restAssuredConfig == null) {
            configure();
        }
        return restAssuredConfig;
    }
}