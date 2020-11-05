package com.tevo.ticket.apirest.models.services;

import java.util.List;

import org.springframework.data.domain.Page;

import com.tevo.ticket.apirest.models.entity.Cargo;
import com.tevo.ticket.apirest.models.entity.CentroCosto;
import com.tevo.ticket.apirest.models.entity.Empleado;
import com.tevo.ticket.apirest.models.entity.Local;

public interface IMaestroService {
	
	//Local
	public Local findLocalById(Long id);
	
	public List<Local> autocompleteLocal(String term);
	//
	
	//Cargo
	public Cargo findCargoById(Long id);
	
	public List<Cargo> autocompleteCargo(String term);
	//
	
	//Centro de Costo
	public CentroCosto findCentroCostoById(Long id);
	
	public CentroCosto findCentroCostoByDescripcion(String descripcion);
	
	public List<CentroCosto> findCentroCostoAll(String codigo, String descripcion, String columnSort, int order);
	
	public Page<CentroCosto> findCentroCostoPageAndSort(String codigo, String descripcion, String columnSort, int order, int page);
	
	public List<CentroCosto> autocompleteCentroCosto(String term);
	
	public CentroCosto saveCentroCosto (CentroCosto centroCosto);
	
	//
	
	//Empleado
	public Empleado findEmpleadoById(Long id);
	
	public Page<Empleado> findEmpleadoPageAndSort(String nroDocumentoIdentidad, String nombreCompleto, String columnSort, int order, int page);
	
	public Empleado saveEmpleado(Empleado empleado);
	//
}
