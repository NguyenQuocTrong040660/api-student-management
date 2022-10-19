package com.system.api.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.system.api.entity.ERole;
import com.system.api.entity.Role;


public interface RoleRepository extends JpaRepository<Role, Integer> {
	//Tim  trong csdl co Role do Khong => optional
     Optional<Role> findByName(ERole name);

}
