package API.stockPojo;

import com.fasterxml.jackson.annotation.*;

import java.util.LinkedHashMap;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "sessionId",
        "startIcci",
        "endIcci",
        "storeCode",
        "sku",
        "barcode",
        "invoiceNo",
        "dispatchNo",
        "initialDateTime"
})
public class ICCI {

    @JsonProperty("sessionId")
    private String sessionId;
    @JsonProperty("startIcci")
    private String startIcci;
    @JsonProperty("endIcci")
    private String endIcci;
    @JsonProperty("storeCode")
    private String storeCode;
    @JsonProperty("sku")
    private String sku;
    @JsonProperty("barcode")
    private String barcode;
    @JsonProperty("invoiceNo")
    private String invoiceNo;
    @JsonProperty("dispatchNo")
    private String dispatchNo;
    @JsonProperty("initialDateTime")
    private String initialDateTime;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

    @JsonProperty("sessionId")
    public String getSessionId() {
        return sessionId;
    }

    @JsonProperty("sessionId")
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    @JsonProperty("startIcci")
    public String getStartIcci() {
        return startIcci;
    }

    @JsonProperty("startIcci")
    public void setStartIcci(String startIcci) {
        this.startIcci = startIcci;
    }

    @JsonProperty("endIcci")
    public String getEndIcci() {
        return endIcci;
    }

    @JsonProperty("endIcci")
    public void setEndIcci(String endIcci) {
        this.endIcci = endIcci;
    }

    @JsonProperty("storeCode")
    public String getStoreCode() {
        return storeCode;
    }

    @JsonProperty("storeCode")
    public void setStoreCode(String storeCode) {
        this.storeCode = storeCode;
    }

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

    @JsonProperty("invoiceNo")
    public String getInvoiceNo() {
        return invoiceNo;
    }

    @JsonProperty("invoiceNo")
    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    @JsonProperty("dispatchNo")
    public String getDispatchNo() {
        return dispatchNo;
    }

    @JsonProperty("dispatchNo")
    public void setDispatchNo(String dispatchNo) {
        this.dispatchNo = dispatchNo;
    }

    @JsonProperty("initialDateTime")
    public String getInitialDateTime() {
        return initialDateTime;
    }

    @JsonProperty("initialDateTime")
    public void setInitialDateTime(String initialDateTime) {
        this.initialDateTime = initialDateTime;
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