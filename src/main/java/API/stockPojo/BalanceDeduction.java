package API.stockPojo;

import com.fasterxml.jackson.annotation.*;

import java.util.LinkedHashMap;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "source",
        "productId",
        "transactionId",
        "issueTypeCode",
        "cardType",
        "paymentType",
        "shopCode",
        "branchCode",
        "gsmNo",
        "icci",
        "isTourist",
        "isEsim",
        "isFree"
})
public class BalanceDeduction {

    @JsonProperty("source")
    private String source;
    @JsonProperty("productId")
    private String productId;
    @JsonProperty("transactionId")
    private String transactionId;
    @JsonProperty("issueTypeCode")
    private String issueTypeCode;
    @JsonProperty("cardType")
    private String cardType;
    @JsonProperty("paymentType")
    private String paymentType;
    @JsonProperty("shopCode")
    private String shopCode;
    @JsonProperty("branchCode")
    private Object branchCode;
    @JsonProperty("gsmNo")
    private String gsmNo;
    @JsonProperty("icci")
    private String icci;
    @JsonProperty("isTourist")
    private String isTourist;
    @JsonProperty("isEsim")
    private String isEsim;
    @JsonProperty("isFree")
    private String isFree;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

    @JsonProperty("source")
    public String getSource() {
        return source;
    }

    @JsonProperty("source")
    public void setSource(String source) {
        this.source = source;
    }

    @JsonProperty("productId")
    public String getProductId() {
        return productId;
    }

    @JsonProperty("productId")
    public void setProductId(String productId) {
        this.productId = productId;
    }

    @JsonProperty("transactionId")
    public String getTransactionId() {
        return transactionId;
    }

    @JsonProperty("transactionId")
    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    @JsonProperty("issueTypeCode")
    public String getIssueTypeCode() {
        return issueTypeCode;
    }

    @JsonProperty("issueTypeCode")
    public void setIssueTypeCode(String issueTypeCode) {
        this.issueTypeCode = issueTypeCode;
    }

    @JsonProperty("cardType")
    public String getCardType() {
        return cardType;
    }

    @JsonProperty("cardType")
    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    @JsonProperty("paymentType")
    public String getPaymentType() {
        return paymentType;
    }

    @JsonProperty("paymentType")
    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @JsonProperty("shopCode")
    public String getShopCode() {
        return shopCode;
    }

    @JsonProperty("shopCode")
    public void setShopCode(String shopCode) {
        this.shopCode = shopCode;
    }

    @JsonProperty("branchCode")
    public Object getBranchCode() {
        return branchCode;
    }

    @JsonProperty("branchCode")
    public void setBranchCode(Object branchCode) {
        this.branchCode = branchCode;
    }

    @JsonProperty("gsmNo")
    public String getGsmNo() {
        return gsmNo;
    }

    @JsonProperty("gsmNo")
    public void setGsmNo(String gsmNo) {
        this.gsmNo = gsmNo;
    }

    @JsonProperty("icci")
    public String getIcci() {
        return icci;
    }

    @JsonProperty("icci")
    public void setIcci(String icci) {
        this.icci = icci;
    }

    @JsonProperty("isTourist")
    public String getIsTourist() {
        return isTourist;
    }

    @JsonProperty("isTourist")
    public void setIsTourist(String isTourist) {
        this.isTourist = isTourist;
    }

    @JsonProperty("isEsim")
    public String getIsEsim() {
        return isEsim;
    }

    @JsonProperty("isEsim")
    public void setIsEsim(String isEsim) {
        this.isEsim = isEsim;
    }
    @JsonProperty("isFree")
    public void setIsFree(String isFree) {
        this.isFree = isFree;
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