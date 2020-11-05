package com.tevo.ticket.apirest.models.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.tevo.ticket.apirest.models.entity.TablaAuxiliarDetalle;
import com.tevo.ticket.apirest.models.entity.TablaAuxiliarDetalleId;

public interface ITablaAuxiliarDetalleDao extends CrudRepository<TablaAuxiliarDetalle, TablaAuxiliarDetalleId> {
	
	@Query("select d from TablaAuxiliarDetalle d where d.tablaAuxiliarDetalleId.id = ?1 and d.tablaAuxiliarDetalleId.tablaAuxiliar.codTablaAuxiliar = ?2")
	public TablaAuxiliarDetalle findById(Long id, String codTablaAuxiliar);
	
	@Query("select d from TablaAuxiliarDetalle d where d.nombre = ?1 and d.tablaAuxiliarDetalleId.tablaAuxiliar.codTablaAuxiliar = ?2")
	public TablaAuxiliarDetalle findByNombre(String nombre, String codTablaAuxiliar);
	
	@Query("select d.nombre from TablaAuxiliarDetalle d where d.tablaAuxiliarDetalleId.tablaAuxiliar.codTablaAuxiliar = ?1")
	public List<String> listByCodigo(String codTablaAuxiliar);
	
	@Query("select d from TablaAuxiliarDetalle d where d.tablaAuxiliarDetalleId.tablaAuxiliar.codTablaAuxiliar = ?1 and d.nombre like ?2%")
	public List<TablaAuxiliarDetalle> autocompleteList(String codTablaAuxiliar, String nombre);
	
	@Query("select d from TablaAuxiliarDetalle d where d.tablaAuxiliarDetalleId.tablaAuxiliar.codTablaAuxiliar = ?1")
	public List<TablaAuxiliarDetalle> listDropdownByCodigo(String codTablaAuxiliar);
}
