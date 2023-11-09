package ra.exercise07.entity;

public class Discount {
    private String description;

    private Double listPrice;

    private Double discountPercent;

    private Double discountAmount;

    private Double discountPrice;

    public Discount() {
    }

    public Discount(String description, Double price, Double discountPercent, Double discountAmount, Double discountPrice) {
        this.description = description;
        this.listPrice= price;
        this.discountPercent = discountPercent;
        this.discountAmount = discountAmount;
        this.discountPrice = discountPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getListPrice() {
        return listPrice;
    }

    public void setListPrice(Double listPrice) {
        this.listPrice = listPrice;
    }

    public Double getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(Double discountPercent) {
        this.discountPercent = discountPercent;
    }

    public Double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(Double discountAmount) {
        this.discountAmount = discountAmount;
    }

    public Double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(Double discountPrice) {
        this.discountPrice = discountPrice;
    }
}
