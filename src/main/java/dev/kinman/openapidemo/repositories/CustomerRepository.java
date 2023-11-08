package dev.kinman.openapidemo.repositories;

import dev.kinman.openapidemo.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional(readOnly = true)
public interface CustomerRepository extends JpaRepository<Customer, Long> {

    @Query(value = "SELECT nextval('customer_seq')", nativeQuery = true)
    Long getNextId();
}
