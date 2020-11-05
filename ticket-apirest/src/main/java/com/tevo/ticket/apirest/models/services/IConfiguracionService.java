package com.tevo.ticket.apirest.models.services;

import java.util.List;

import com.tevo.ticket.apirest.models.entity.TablaAuxiliarDetalle;

public interface IConfiguracionService {
	//Tabla Auxiliar Detalle
	public TablaAuxiliarDetalle findTablaAuxiliarDetalleById(Long id, String codTablaAuxiliar);

	public TablaAuxiliarDetalle findTablaAuxiliarDetalleByNombre(String nombre, String codTablaAuxiliar);
	
	public List<String> listTablaAuxiliarDetalleByCodigo(String codTablaAuxiliar);
	
	public List<TablaAuxiliarDetalle> autocompleteList(String codTablaAuxiliar, String nombre);
	
	public List<TablaAuxiliarDetalle> listTablaAuxiliarDetalleDropdownByCodigo(String codTablaAuxiliar);
}
