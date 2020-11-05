package com.tevo.ticket.apirest.models.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tevo.ticket.apirest.models.entity.CentroCosto;

public interface ICentroCostoDao extends JpaRepository<CentroCosto, Long> {
	
	public CentroCosto findByDescripcion(String descripcion);
	
	@Query("select c from CentroCosto c where c.codigo like ?1% and c.descripcion like ?2%")
	public List<CentroCosto> findAllOrdered(String codigo, String descripcion,Sort sort);
	
	@Query("select c from CentroCosto c where c.codigo like ?1% and c.descripcion like ?2%")
	public Page<CentroCosto> findAllPageAndSort(String codigo, String descripcion,Pageable pageable);
	
	@Query("select c from CentroCosto c where UPPER(c.descripcion) like CONCAT('%',UPPER(?1),'%') order by c.descripcion asc")
	public List<CentroCosto> autocompleteList(String term);
}
