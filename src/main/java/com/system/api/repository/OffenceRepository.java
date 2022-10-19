package com.system.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.system.api.entity.Offence;

public interface OffenceRepository extends JpaRepository<Offence, Integer> {

}
