package com.tevo.ticket.apirest.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tevo.ticket.apirest.models.dao.ITablaAuxiliarDetalleDao;
import com.tevo.ticket.apirest.models.entity.TablaAuxiliarDetalle;

@Service
public class ConfiguracionServiceImpl implements IConfiguracionService {
	
	@Autowired
	public ITablaAuxiliarDetalleDao tablaAuxiliarDetalleDao;

	@Override
	@Transactional(readOnly=true)
	public TablaAuxiliarDetalle findTablaAuxiliarDetalleById(Long id, String codTablaAuxiliar) {
		return tablaAuxiliarDetalleDao.findById(id, codTablaAuxiliar);
	}

	@Override
	@Transactional(readOnly=true)
	public TablaAuxiliarDetalle findTablaAuxiliarDetalleByNombre(String nombre, String codTablaAuxiliar) {
		return tablaAuxiliarDetalleDao.findByNombre(nombre, codTablaAuxiliar);
	}

	@Override
	@Transactional(readOnly=true)
	public List<String> listTablaAuxiliarDetalleByCodigo(String codTablaAuxiliar) {
		return tablaAuxiliarDetalleDao.listByCodigo(codTablaAuxiliar);
	}

	@Override
	@Transactional(readOnly=true)
	public List<TablaAuxiliarDetalle> autocompleteList(String codTablaAuxiliar, String nombre) {
		return tablaAuxiliarDetalleDao.autocompleteList(codTablaAuxiliar, nombre);
	}

	@Override
	@Transactional(readOnly=true)
	public List<TablaAuxiliarDetalle> listTablaAuxiliarDetalleDropdownByCodigo(String codTablaAuxiliar) {
		return tablaAuxiliarDetalleDao.listDropdownByCodigo(codTablaAuxiliar);
	}
}
