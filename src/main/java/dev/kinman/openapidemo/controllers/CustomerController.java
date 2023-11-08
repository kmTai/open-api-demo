package dev.kinman.openapidemo.controllers;

import dev.kinman.openapidemo.dtos.CustomerDto;
import dev.kinman.openapidemo.dtos.CustomerdetailDto;

import dev.kinman.openapidemo.services.CustomerService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/api/v1/customer")
public class CustomerController {

    private CustomerService customerService;

    @GetMapping("/{customerNumber}")
    public ResponseEntity<CustomerDto> findCustomerByCustomerNumber(@PathVariable String customerNumber){
//        return ResponseEntity.ok(this.customerService.getCustomerDto(Long.parseLong(customerNumber)));
        return new ResponseEntity<>(
                this.customerService.getCustomerDto(Long.parseLong(customerNumber)),
                HttpStatus.OK
        );
    }


    //customer address
    @GetMapping("/address/{customerNumber}")
    public ResponseEntity<CustomerdetailDto> findCustomerAddressByCustomerNumber(@PathVariable String customerNumber) {
        //return ResponseEntity.ok(this.customerService.getCustomerdetailDto(Long.parseLong(customerNumber)));

        return new ResponseEntity<>(
                this.customerService.getCustomerdetailDto(Long.parseLong(customerNumber)),
                HttpStatus.OK
        );
    }

    @PostMapping("/address")
    public ResponseEntity<Void> createCustomerdetail(@Valid @RequestBody CustomerdetailDto customerdetailDto){
        this.customerService.createCustomerdetail(customerdetailDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }


    @DeleteMapping("/address/{customerNumber}")
    public ResponseEntity<Void> deleteCustomerByCustomerNumber(@PathVariable String customerNumber) {
        this.customerService.deleteCustomer(Long.parseLong(customerNumber));
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
