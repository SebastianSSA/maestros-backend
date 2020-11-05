package com.tevo.ticket.apirest.models.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tevo.ticket.apirest.models.dao.IPersonaDao;
import com.tevo.ticket.apirest.models.entity.Persona;

@Service
public class PersonaServiceImpl implements IPersonaService {
	
	private static final Integer ITEMS_PER_PAGE = 10;

	@Autowired
	private IPersonaDao personaDao;
	
	@Override
	@Transactional(readOnly = true)
	public Persona findById(Long id) {
		return personaDao.findById(id).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Page<Persona> findPageAndSort(String columnSort, int order, int page) {
		Pageable sorted = null;
		if (order == 0) {
			sorted = PageRequest.of(page, ITEMS_PER_PAGE, Sort.by(columnSort).ascending());
		} else {
			sorted = PageRequest.of(page, ITEMS_PER_PAGE, Sort.by(columnSort).descending());
		}
		
		return personaDao.findAllPageAndSort(sorted);
	}

	@Override
	@Transactional
	public Persona save(Persona persona) {
		return personaDao.save(persona);
	}

}
