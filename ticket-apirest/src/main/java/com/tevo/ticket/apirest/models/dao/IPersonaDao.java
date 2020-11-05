package com.tevo.ticket.apirest.models.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tevo.ticket.apirest.models.entity.Persona;

public interface IPersonaDao extends JpaRepository<Persona, Long> {

	@Query("select e from Empleado e")
	public Page<Persona> findAllPageAndSort(Pageable pageable);
}
