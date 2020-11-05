package com.tevo.ticket.apirest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tevo.ticket.apirest.models.entity.Local;
import com.tevo.ticket.apirest.models.services.IMaestroService;

@CrossOrigin(origins = {"http://localhost:4200"})
@RestController
@RequestMapping("/api")
public class LocalRestController {

	@Autowired
	private IMaestroService maestroService;
	
	@GetMapping("/local/autocomplete/{term}")
	public List<Local> autocomplete(@PathVariable String term) {
		if (term.equals("inexistente")) {
			term = "";
		}
		
		return maestroService.autocompleteLocal(term);
	}
}
