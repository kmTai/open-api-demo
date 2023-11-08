package dev.kinman.openapidemo.repositories;

import dev.kinman.openapidemo.entities.Customerdetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerdetailRepository extends JpaRepository<Customerdetail, Long> {
}
