package com.tevo.ticket.apirest.models.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.tevo.ticket.apirest.models.entity.Cliente;
import com.tevo.ticket.apirest.models.entity.Factura;
import com.tevo.ticket.apirest.models.entity.Producto;
import com.tevo.ticket.apirest.models.entity.Region;

public interface IClienteService {
	
	public List<Cliente> findAll();
	
	public Page<Cliente> findAll(Pageable pageable);
	
	public Cliente findById(Long id);
	
	public Cliente save(Cliente cliente);
	
	public void delete(Long id);
	
	public List<Region> findAllRegiones();
	
	public Factura findFacturaById(Long id);
	
	public Factura saveFactura(Factura factura);
	
	public void deleteFactura(Long id);
	
	public List<Producto> findProductoByNombre(String term);
}
