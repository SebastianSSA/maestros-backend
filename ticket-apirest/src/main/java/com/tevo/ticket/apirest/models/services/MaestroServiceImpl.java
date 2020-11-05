package com.tevo.ticket.apirest.models.services;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tevo.ticket.apirest.models.dao.ICargoDao;
import com.tevo.ticket.apirest.models.dao.ICentroCostoDao;
import com.tevo.ticket.apirest.models.dao.IEmpleadoDao;
import com.tevo.ticket.apirest.models.dao.ILocalDao;
import com.tevo.ticket.apirest.models.entity.Cargo;
import com.tevo.ticket.apirest.models.entity.CentroCosto;
import com.tevo.ticket.apirest.models.entity.Empleado;
import com.tevo.ticket.apirest.models.entity.Local;

@Service
public class MaestroServiceImpl implements IMaestroService {
	protected final Log logger = LogFactory.getLog(this.getClass());
	
	private static final Integer ITEMS_PER_PAGE = 10;
	
	@Autowired
	private ILocalDao localDao;
	
	@Autowired
	private ICargoDao cargoDao;
	
	@Autowired
	private ICentroCostoDao centroCostoDao;
	
	@Autowired
	private IEmpleadoDao empleadoDao;
	
	//Local
	@Override
	@Transactional(readOnly=true)
	public Local findLocalById(Long id) {
		return localDao.findById(id).orElse(null);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<Local> autocompleteLocal(String term) {
		return localDao.autocompleteList(term);
	}
	//
	
	//Cargo
	@Override
	@Transactional(readOnly=true)
	public Cargo findCargoById(Long id) {
		return cargoDao.findById(id).orElse(null);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<Cargo> autocompleteCargo(String term) {
		return cargoDao.autocompleteList(term);
	}
	//
	
	//Centro de Costo
	@Override
	@Transactional(readOnly=true)
	public CentroCosto findCentroCostoById(Long id) {
		return centroCostoDao.findById(id).orElse(null);
	}
	
	@Override
	@Transactional(readOnly=true)
	public CentroCosto findCentroCostoByDescripcion(String descripcion) {
		return centroCostoDao.findByDescripcion(descripcion);
	}

	@Override
	@Transactional(readOnly=true)
	public List<CentroCosto> findCentroCostoAll(String codigo, String descripcion, String columnSort, int order) {
		if (order == 0) {
			return (List<CentroCosto>) centroCostoDao.findAllOrdered(codigo, descripcion, Sort.by((String) columnSort).ascending());
		} else {
			return (List<CentroCosto>) centroCostoDao.findAllOrdered(codigo, descripcion, Sort.by((String) columnSort).descending());
		}	
	}
	
	@Override
	@Transactional(readOnly = true)
	public Page<CentroCosto> findCentroCostoPageAndSort(String codigo, String descripcion, String columnSort, int order, int page) {
		Pageable sorted = null;
		if (order == 0) {
			sorted = PageRequest.of(page, ITEMS_PER_PAGE, Sort.by(columnSort).ascending());
		} else {
			sorted = PageRequest.of(page, ITEMS_PER_PAGE, Sort.by(columnSort).descending());
		}
		
		return centroCostoDao.findAllPageAndSort(codigo, descripcion, sorted);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<CentroCosto> autocompleteCentroCosto(String term) {
		return centroCostoDao.autocompleteList(term);
	}
	
	@Override
	@Transactional
	public CentroCosto saveCentroCosto(CentroCosto centroCosto) {
		return centroCostoDao.save(centroCosto);
	}
	//
	
	//Empleado
	@Override
	@Transactional(readOnly=true)
	public Empleado findEmpleadoById(Long id) {
		return empleadoDao.findById(id).orElse(null);
	}
	
	@Override
	@Transactional(readOnly=true)
	public Page<Empleado> findEmpleadoPageAndSort(String nroDocumentoIdentidad, String nombreCompleto, String columnSort, int order, int page) {
		Pageable sorted = null;
		if (order == 0) {
			sorted = PageRequest.of(page, ITEMS_PER_PAGE, Sort.by(columnSort).ascending());
		} else {
			sorted = PageRequest.of(page, ITEMS_PER_PAGE, Sort.by(columnSort).descending());
		}
		
		return empleadoDao.findAllPageAndSort(nroDocumentoIdentidad, nombreCompleto, sorted);
	}
	
	@Override
	@Transactional
	public Empleado saveEmpleado(Empleado empleado) {
		return empleadoDao.save(empleado);
	}
	//
}
