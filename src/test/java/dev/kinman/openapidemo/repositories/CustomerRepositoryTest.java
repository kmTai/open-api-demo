package dev.kinman.openapidemo.repositories;

import dev.kinman.openapidemo.TestOpenapiDemoApplication;
import dev.kinman.openapidemo.entities.Customer;
import dev.kinman.openapidemo.entities.Customerdetail;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.Import;
import org.springframework.data.domain.Example;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertAll;
import static org.junit.jupiter.api.Assertions.assertEquals;

//@Testcontainers(disabledWithoutDocker = true)
//@Sql("/src/test/resources/test-data.sql")
@Slf4j
@Import(TestOpenapiDemoApplication.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class CustomerRepositoryTest {

    private static Logger logger = LoggerFactory.getLogger(CustomerRepositoryTest.class);

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    CustomerdetailRepository customerdetailRepository;


    @Test
    void shouldFindAllCustomers() {
        List<Customer> customers = customerRepository.findAll();

        assertAll(
                ()->assertThat(customers).isNotEmpty(),
                ()->assertThat(customers).hasSize(3)
        );
    }

    @Test
    void shouldFindCustomerByCustomerNumber() {
        Optional<Customer> customer = customerRepository.findById(Long.parseLong("99"));
        Customer expectedCustomer = Customer.builder().customerNumber(99L).customerName("Australian Home")
                .contactLastName("Paoule").contactFirstName("Sart ").phone("40.11.2555").creditLimit(21000F).build();

        assertAll(
                ()->assertThat(customer).isNotEmpty(),
                ()->assertEquals(expectedCustomer, customer.get())
        );
    }

    @Test
    void shouldCreateCustomer(){

        Long nextId = customerRepository.getNextId();
        Customer customer = Customer.builder().customerNumber(nextId).customerName("test")
                .contactLastName("test").contactFirstName("test").phone("12345678").creditLimit(48000F).build();

        customerRepository.save(customer);
        Example<Customer> example = Example.of(customer);
        assertAll(
                ()-> assertEquals(customer, customerRepository.findOne(example).get()),
                ()-> assertEquals(customer, customerRepository.findById(nextId).get())
                );

    }

    @Test
    void shouldUpdateCustomer(){

        Optional<Customer> customer = customerRepository.findById(101L);
        customer.get().setCustomerName("Alex");

        customerRepository.save(customer.get());
        assertEquals("Alex", customerRepository.findById(101L).get().getCustomerName());

    }

//    @Test
//    void shouldDeleteCustomer(){
//        Customer customer = customerRepository.findById(101L).get();
//
//        customerRepository.delete(customer);
//
//        assertAll(
//                ()->assertThat(customerRepository.findAll()).hasSize(2),
//                ()->assertThat(customerdetailRepository.findAll()).hasSize(2)
//        );
//
//    }
}