package com.tevo.ticket.apirest.models.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tevo.ticket.apirest.models.entity.Cargo;

public interface ICargoDao extends JpaRepository<Cargo, Long> {

	@Query("select c from Cargo c where UPPER(c.descripcion) like CONCAT('%',UPPER(?1),'%') order by c.descripcion asc")
	public List<Cargo> autocompleteList(String term);
}
