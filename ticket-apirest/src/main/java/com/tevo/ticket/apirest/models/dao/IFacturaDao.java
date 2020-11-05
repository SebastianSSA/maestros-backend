package com.tevo.ticket.apirest.models.dao;

import org.springframework.data.repository.CrudRepository;

import com.tevo.ticket.apirest.models.entity.Factura;

public interface IFacturaDao extends CrudRepository<Factura, Long> {

}
