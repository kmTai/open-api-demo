package dev.kinman.openapidemo.controllers;

import dev.kinman.openapidemo.dtos.CustomerdetailDto;
import dev.kinman.openapidemo.services.CustomerService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/api/v1/customer_detail")
public class CustomerdetailController {

    private CustomerService customerService;

    //customer address
    @GetMapping("/{customerNumber}")
    public ResponseEntity<CustomerdetailDto> findCustomerAddressByCustomerNumber(@PathVariable String customerNumber) {
        //return ResponseEntity.ok(this.customerService.getCustomerdetailDto(Long.parseLong(customerNumber)));

        return new ResponseEntity<>(
                this.customerService.getCustomerdetailDto(Long.parseLong(customerNumber)),
                HttpStatus.OK
        );
    }

    @PostMapping("/")
    public ResponseEntity<Void> createCustomerdetail(@Valid @RequestBody CustomerdetailDto customerdetailDto){
        this.customerService.createCustomerdetail(customerdetailDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }


    @DeleteMapping("/{customerNumber}")
    public ResponseEntity<Void> deleteCustomerByCustomerNumber(@PathVariable String customerNumber) {
        this.customerService.deleteCustomer(Long.parseLong(customerNumber));
        return new ResponseEntity<>(HttpStatus.OK);
    }

    //patch customer addressLineFirst
    @PatchMapping("/{customerNumber}/addresslinefirst")
    public ResponseEntity<Void> patchCustomerAddressLineFirst(@PathVariable String customerNumber, @RequestParam String addressLineFirst) {
        this.customerService.patchCustomerAddressLineFirst(Long.parseLong(customerNumber), addressLineFirst);
        return new ResponseEntity<>(HttpStatus.OK);
    }


    //put customer address
    @PutMapping("/{customerNumber}")
    public ResponseEntity<Void> putCustomerAddress(@Valid @RequestBody CustomerdetailDto customerdetailDto) {
        this.customerService.putCustomerAddress(customerdetailDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
