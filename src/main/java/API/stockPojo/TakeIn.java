package API.stockPojo;

import com.fasterxml.jackson.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "storeCode",
        "agent",
        "products"
})
//@Generated("jsonschema2pojo")
public class TakeIn {

    @JsonProperty("storeCode")
    private String storeCode;
    @JsonProperty("agent")
    private String agent;
    @JsonProperty("products")
    private List<Product> products;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

    @JsonProperty("storeCode")
    public String getStoreCode() {
        return storeCode;
    }

    @JsonProperty("storeCode")
    public void setStoreCode(String storeCode) {
        this.storeCode = storeCode;
    }

    @JsonProperty("agent")
    public String getAgent() {
        return agent;
    }

    @JsonProperty("agent")
    public void setAgent(String agent) {
        this.agent = agent;
    }

    @JsonProperty("products")
    public List<Product> getProducts() {
        return products;
    }

    @JsonProperty("products")
    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

}