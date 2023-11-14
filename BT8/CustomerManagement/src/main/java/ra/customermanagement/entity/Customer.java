package ra.customermanagement.entity;

import java.util.Date;

public class Customer {

    private int id;


    private String name;


    private Date birthday;


    private String address;


    private String img;

    public Customer() {
    }

    public Customer(int id, String name, Date birthday, String address, String img) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.address = address;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date date) {
        this.birthday = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Customer [id=" + id + ", name=" + name + ", birthday=" + birthday + ", address=" + address + "]";
    }
}
