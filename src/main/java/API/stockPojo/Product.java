package API.stockPojo;

import com.fasterxml.jackson.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "sku",
        "barcode",
        "imeiList",
        "offerType",
        "quantity"
})
//@Generated("jsonschema2pojo")
public class Product {

    @JsonProperty("sku")
    private String sku;
    @JsonProperty("barcode")
    private String barcode;
    @JsonProperty("imeiList")
    private List<String> imeiList;
    @JsonProperty("offerType")
    private String offerType;
    @JsonProperty("quantity")
    private Integer quantity;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

    @JsonProperty("sku")
    public String getSku() {
        return sku;
    }

    @JsonProperty("sku")
    public void setSku(String sku) {
        this.sku = sku;
    }

    @JsonProperty("barcode")
    public String getBarcode() {
        return barcode;
    }

    @JsonProperty("barcode")
    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    @JsonProperty("imeiList")
    public List<String> getImeiList() {
        return imeiList;
    }

    @JsonProperty("imeiList")
    public void setImeiList(List<String> imeiList) {
        this.imeiList = imeiList;
    }

    @JsonProperty("offerType")
    public String getOfferType() {
        return offerType;
    }

    @JsonProperty("offerType")
    public void setOfferType(String offerType) {
        this.offerType = offerType;
    }

    @JsonProperty("quantity")
    public Integer getQuantity() {
        return quantity;
    }

    @JsonProperty("quantity")
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
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
