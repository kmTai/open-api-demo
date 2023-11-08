package dev.kinman.openapidemo.repositories;

import dev.kinman.openapidemo.TestOpenapiDemoApplication;
import dev.kinman.openapidemo.entities.Customer;
import dev.kinman.openapidemo.entities.Customerdetail;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.Import;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

@Slf4j
@Import(TestOpenapiDemoApplication.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class CustomerdetailRepositoryTest {

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    CustomerdetailRepository customerdetailRepository;

    private static Logger logger = LoggerFactory.getLogger(CustomerdetailRepositoryTest.class);

    @BeforeEach
    void beforeEach(){
        Customerdetail customerdetail = Customerdetail.builder().customerNumber(99L).addressLineFirst("43 Rue 2")
                .addressLineSecond(null).city("Paris").state(null).postalCode("25017").country("France").build();

        customerdetailRepository.delete(customerdetail);
    }

    @Test
    void shouldRunBeforeEach(){
        assertAll(
                ()->assertThat(customerRepository.findAll()).hasSize(3),
                ()->assertThat(customerdetailRepository.findAll()).hasSize(2)
        );

    }


    @Test
    void shouldCreateCustomerdetailWhenCustomerIsPresent(){
        Customerdetail customerdetail = Customerdetail.builder().customerNumber(99L).addressLineFirst("43 Rue 2")
                .addressLineSecond(null).city("Paris").state(null).postalCode("25017").country("France").build();

        Optional<Customer> customer = customerRepository.findById(99L);

        if (customer.isPresent()){

            customerdetail.setCustomer(customer.get());
            customer.get().setCustomerdetail(customerdetail);
//            logger.info("log customer:"+customer);
//            logger.info("log customerdetail:"+customerdetail);

            customerdetailRepository.save(customerdetail);

        }


        assertAll(
                ()->assertThat(customerRepository.findAll()).hasSize(3),
                ()->assertThat(customerdetailRepository.findAll()).hasSize(3)
        );

    }

    @Test
    void shouldUpdateCustomerdetail(){

        Optional<Customerdetail> customerdetail = customerdetailRepository.findById(101L);
        customerdetail.get().setAddressLineFirst("Update to 52");

        customerdetailRepository.save(customerdetail.get());
        assertEquals("Update to 52", customerdetailRepository.findById(101L).get().getAddressLineFirst());

    }

    @Test
    void shouldDeleteCustomerdetail(){
        Optional<Customerdetail> customerdetail = customerdetailRepository.findById(101L);
        //customerdetail.get().setCustomer(null);
        customerdetailRepository.delete(customerdetail.get());

        assertAll(
                ()->assertThat(customerRepository.findAll()).hasSize(3),
                ()->assertThat(customerdetailRepository.findAll()).hasSize(1)
        );

    }

}