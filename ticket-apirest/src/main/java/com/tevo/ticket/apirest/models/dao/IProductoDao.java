package com.tevo.ticket.apirest.models.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.tevo.ticket.apirest.models.entity.Producto;

public interface IProductoDao extends CrudRepository<Producto, Long> {

	@Query("select p from Producto p where UPPER(p.nombre) like CONCAT('%',UPPER(?1),'%')")
	public List<Producto> findByNombre(String term);
}
