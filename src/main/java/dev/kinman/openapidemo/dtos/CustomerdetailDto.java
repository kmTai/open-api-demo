package dev.kinman.openapidemo.dtos;

import dev.kinman.openapidemo.entities.Customer;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CustomerdetailDto {

    private Long customerNumber;
    private String addressLineFirst;
    private String addressLineSecond;
    private String city;
    private String state;
    private String postalCode;
    private String country;
    //private CustomerDto customer;
}
