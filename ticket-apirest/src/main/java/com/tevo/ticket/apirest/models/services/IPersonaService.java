package com.tevo.ticket.apirest.models.services;

import org.springframework.data.domain.Page;

import com.tevo.ticket.apirest.models.entity.Persona;

public interface IPersonaService {

	public Persona findById(Long id);
	
	public Page<Persona> findPageAndSort(String columnSort, int order, int page);
	
	public Persona save(Persona persona);
}
