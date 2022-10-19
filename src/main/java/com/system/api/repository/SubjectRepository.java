package com.system.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.system.api.entity.Subject;

public interface SubjectRepository extends JpaRepository<Subject, Integer>  {

}
