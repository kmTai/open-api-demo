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

}
