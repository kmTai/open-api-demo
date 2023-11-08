package dev.kinman.openapidemo.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;

@ToString
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    private Long customerNumber;

    @Column(length = 50, nullable = false)
    private String customerName;

    @Column(length = 50, nullable = false)
    private String contactLastName;

    @Column(length = 50, nullable = false)
    private String contactFirstName;

    @Column(length = 50, nullable = false)
    private String phone;

    //@Column(precision = 10, scale = 2)
    @Column(precision = 10)
    private Float creditLimit;

    @OneToOne(mappedBy = "customer", orphanRemoval = true)
    @PrimaryKeyJoinColumn
    @JsonManagedReference
    @ToString.Exclude
    private Customerdetail customerdetail;

    public Long getCustomerNumber() {
        return customerNumber;
    }

    public void setCustomerNumber(Long customerNumber) {
        this.customerNumber = customerNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getContactLastName() {
        return contactLastName;
    }

    public void setContactLastName(String contactLastName) {
        this.contactLastName = contactLastName;
    }

    public String getContactFirstName() {
        return contactFirstName;
    }

    public void setContactFirstName(String contactFirstName) {
        this.contactFirstName = contactFirstName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Float getCreditLimit() {
        return creditLimit;
    }

    public void setCreditLimit(Float creditLimit) {
        this.creditLimit = creditLimit;
    }

    public Customerdetail getCustomerdetail() {
        return customerdetail;
    }

    public void setCustomerdetail(Customerdetail customerdetail) {
        this.customerdetail = customerdetail;
        this.customerdetail.setCustomer(this);
    }

    @Override
    public int hashCode() {
        return 2021;
    }

    @Override
    public boolean equals(Object obj) {

        if (obj == null) {
            return false;
        }

        if (this == obj) {
            return true;
        }

        if (getClass() != obj.getClass()) {
            return false;
        }

        return customerNumber != null && customerNumber.equals(((Customer) obj).customerNumber);
    }
}

