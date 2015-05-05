package com.tma.gbst.repository;

import com.tma.gbst.model.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserRepository extends MyBaseRepository<User, Integer> {
    User findByEmail(String email);
}
