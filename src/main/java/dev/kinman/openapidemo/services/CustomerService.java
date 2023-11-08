package dev.kinman.openapidemo.services;


import dev.kinman.openapidemo.dtos.CustomerDto;
import dev.kinman.openapidemo.dtos.CustomerdetailDto;
import dev.kinman.openapidemo.entities.Customer;
import dev.kinman.openapidemo.entities.Customerdetail;
import dev.kinman.openapidemo.mappers.CustomerMapper;
import dev.kinman.openapidemo.repositories.CustomerRepository;
import dev.kinman.openapidemo.repositories.CustomerdetailRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.Optional;


@Slf4j
@RequiredArgsConstructor
@Service
public class CustomerService {

    private static Logger logger = LoggerFactory.getLogger(CustomerService.class);

    private final CustomerRepository customerRepository;

    private final CustomerdetailRepository customerdetailRepository;
    private final CustomerMapper customerMapper;

    public CustomerDto getCustomerDto(Long customerNumber) {
        Customer customer = getCustomer(customerNumber);
        return this.customerMapper.toCustomerDto(customer);
    }

    private Customer getCustomer(Long customerNumber){
        return this.customerRepository.findById(customerNumber)
                .orElseThrow(()-> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    public CustomerdetailDto getCustomerdetailDto(Long customerNumber) {
        Customerdetail customerdetail = getCustomerdetail(customerNumber);
        return this.customerMapper.toCustomerdetailDto(customerdetail);
    }

    private Customerdetail getCustomerdetail(Long customerNumber){
        return this.customerdetailRepository.findById(customerNumber)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    public void createCustomerdetail(CustomerdetailDto customerdetailDto){

        Optional<Customer> customer = customerRepository.findById(customerdetailDto.getCustomerNumber());
        Optional<Customerdetail> customerdetailFind = customerdetailRepository.findById(customerdetailDto.getCustomerNumber());


        if (customer.isPresent() && customerdetailFind.isEmpty()){

            Customerdetail customerdetail = this.customerMapper.customerdetailDtoToCustomerdetail1(customerdetailDto);

            customerdetail.setCustomer(customer.get());
            customer.get().setCustomerdetail(customerdetail);

            this.customerdetailRepository.save(customerdetail);

        }else{
            new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }

    }

    public void deleteCustomer(Long customerNumber){
        Customerdetail customerdetail = getCustomerdetail(customerNumber);
        this.customerdetailRepository.delete(customerdetail);
    }

}
