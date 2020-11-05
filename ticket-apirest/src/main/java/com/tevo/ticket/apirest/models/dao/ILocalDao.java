package com.tevo.ticket.apirest.models.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tevo.ticket.apirest.models.entity.Local;

public interface ILocalDao extends JpaRepository<Local, Long> {

	@Query("select l from Local l where UPPER(l.nombre) like CONCAT('%',UPPER(?1),'%') order by l.nombre asc")
	public List<Local> autocompleteList(String term);
}
