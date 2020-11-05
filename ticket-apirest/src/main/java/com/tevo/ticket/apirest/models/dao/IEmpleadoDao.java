package com.tevo.ticket.apirest.models.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tevo.ticket.apirest.models.entity.Empleado;

public interface IEmpleadoDao extends JpaRepository<Empleado, Long> {

	@Query("select e from Empleado e where e.nroDocumentoIdentidad like ?1% and (e.nombreCompleto) like %?2%")
	public Page<Empleado> findAllPageAndSort(String nroDocumentoIdentidad, String nombreCompleto,Pageable pageable);
}
