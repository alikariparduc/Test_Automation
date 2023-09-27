package API.stockPojo;

import com.fasterxml.jackson.annotation.*;

import java.util.LinkedHashMap;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "provisionId",
        "shopCode",
        "amountAvailable",
        "bankCode",
        "transferAmount",
        "transferAmountUom"
})
public class BPPS {

    @JsonProperty("provisionId")
    private String provisionId;
    @JsonProperty("shopCode")
    private String shopCode;
    @JsonProperty("amountAvailable")
    private Integer amountAvailable;
    @JsonProperty("bankCode")
    private String bankCode;
    @JsonProperty("transferAmount")
    private Double transferAmount;
    @JsonProperty("transferAmountUom")
    private Integer transferAmountUom;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

    @JsonProperty("provisionId")
    public String getProvisionId() {
        return provisionId;
    }

    @JsonProperty("provisionId")
    public void setProvisionId(String provisionId) {
        this.provisionId = provisionId;
    }

    @JsonProperty("shopCode")
    public String getShopCode() {
        return shopCode;
    }

    @JsonProperty("shopCode")
    public void setShopCode(String shopCode) {
        this.shopCode = shopCode;
    }

    @JsonProperty("amountAvailable")
    public Integer getAmountAvailable() {
        return amountAvailable;
    }

    @JsonProperty("amountAvailable")
    public void setAmountAvailable(Integer amountAvailable) {
        this.amountAvailable = amountAvailable;
    }

    @JsonProperty("bankCode")
    public String getBankCode() {
        return bankCode;
    }

    @JsonProperty("bankCode")
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }

    @JsonProperty("transferAmount")
    public Double getTransferAmount() {
        return transferAmount;
    }

    @JsonProperty("transferAmount")
    public void setTransferAmount(Double transferAmount) {
        this.transferAmount = transferAmount;
    }

    @JsonProperty("transferAmountUom")
    public Integer getTransferAmountUom() {
        return transferAmountUom;
    }

    @JsonProperty("transferAmountUom")
    public void setTransferAmountUom(Integer transferAmountUom) {
        this.transferAmountUom = transferAmountUom;
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