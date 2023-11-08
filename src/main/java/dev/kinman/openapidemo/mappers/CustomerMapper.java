package dev.kinman.openapidemo.mappers;

import dev.kinman.openapidemo.dtos.CustomerDto;
import dev.kinman.openapidemo.dtos.CustomerdetailDto;
import dev.kinman.openapidemo.entities.Customer;
import dev.kinman.openapidemo.entities.Customerdetail;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface CustomerMapper {

    //@Mapping(target = "customerNumber", source = "customerNumber")
    CustomerDto toCustomerDto(Customer customer);

    //@Mapping(target = "customerNumber", source = "customerNumber")
    CustomerdetailDto toCustomerdetailDto(Customerdetail customerdetail);

    Customerdetail customerdetailDtoToCustomerdetail1(CustomerdetailDto customerdetailDto);


    @Mapping(source = "customerDto.customerNumber", target = "customer.customerNumber")
    @Mapping(source = "customerDto.customerName", target = "customer.customerName")
    @Mapping(source = "customerDto.contactLastName", target = "customer.contactLastName")
    @Mapping(source = "customerDto.contactFirstName", target = "customer.contactFirstName")
    @Mapping(source = "customerDto.phone", target = "customer.phone")
    @Mapping(source = "customerDto.creditLimit", target = "customer.creditLimit")
    @Mapping(source = "customerdetailDto.customerNumber", target = "customerNumber")
    Customerdetail customerdetailDtoToCustomerdetail(CustomerdetailDto customerdetailDto, CustomerDto customerDto);

}
