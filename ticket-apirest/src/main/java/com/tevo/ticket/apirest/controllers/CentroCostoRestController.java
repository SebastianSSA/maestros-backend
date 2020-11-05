package com.tevo.ticket.apirest.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tevo.ticket.apirest.models.entity.CentroCosto;
import com.tevo.ticket.apirest.models.services.IMaestroService;

@CrossOrigin(origins = {"http://localhost:4200"})
@RestController
@RequestMapping("/api")
public class CentroCostoRestController {
	
	protected final Log logger = LogFactory.getLog(this.getClass());

	@Autowired
	private IMaestroService maestroService;
	
//	@GetMapping("/centro_costo")
//	public List<CentroCosto> index() {
//		return maestroService.findCentroCostoAll("", "", "id", 0);
//	}
	
	@GetMapping("/centro_costo/autocomplete/{term}")
	public List<CentroCosto> autocompletado(@PathVariable String term) {
		if (term.equals("inexistente")) {
			term = "";
		}
		
		return maestroService.autocompleteCentroCosto(term);
	}
	
	@GetMapping("/centro_costo/page/{codigo}/{descripcion}/{columnSort}/{order}/{page}")
	public Page<CentroCosto> index(@PathVariable String codigo,
			@PathVariable String descripcion,
			@PathVariable String columnSort,
			@PathVariable Integer order,
			@PathVariable Integer page) {
		
		if (codigo.equals("codigo")) {
			codigo = "";
		}
		
		if (descripcion.equals("descripcion")) {
			descripcion = "";
		}
		
		return maestroService.findCentroCostoPageAndSort(codigo, descripcion, columnSort, order, page);
	}
	
	@GetMapping("/centro_costo/{id}")
	public ResponseEntity<?> show(@PathVariable Long id) {
		CentroCosto centroCosto = null;
		Map<String, Object> response = new HashMap<>();
		
		try {
			centroCosto = maestroService.findCentroCostoById(id);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar la consulta en la BD");
			response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().toString()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if (centroCosto == null) {
			response.put("mensaje", "El Centro de Costo no existe en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<CentroCosto>(centroCosto, HttpStatus.OK); 
	}
	
	@PostMapping("/centro_costo")
	public ResponseEntity<?> create(@Valid @RequestBody CentroCosto centroCosto, BindingResult result) {
		CentroCosto centroCostoNew = null;
		Map<String, Object> response = new HashMap<>();
		
		if (result.hasErrors()) {
			List<String> errors = result.getFieldErrors()
					.stream()
					.map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
					.collect(Collectors.toList());
			
			response.put("errors", errors);
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.BAD_REQUEST);
		}
		
		try {
			centroCostoNew = maestroService.saveCentroCosto(centroCosto);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar el insert en la BD");
			response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().toString()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("mensaje", "Centro de Costo registrado exitosamente");
		response.put("centroCosto", centroCostoNew);
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}
	
	@PutMapping("/centro_costo/{id}")
	public ResponseEntity<?> update(@Valid @RequestBody CentroCosto centroCosto, BindingResult result, @PathVariable Long id) {
		CentroCosto centroCostoActual = maestroService.findCentroCostoById(id);
		CentroCosto centroCostoUpdate = null;
		Map<String, Object> response = new HashMap<>();
		
		if (result.hasErrors()) {
			List<String> errors = result.getFieldErrors()
					.stream()
					.map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
					.collect(Collectors.toList());
			
			response.put("errors", errors);
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.BAD_REQUEST);
		}
		
		if (centroCostoActual == null) {
			response.put("mensaje", "Error, no se pudo editar: El centro de costo no existe en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}
		
		try {
			centroCostoActual.setCodigo(centroCosto.getCodigo());
			centroCostoActual.setDescripcion(centroCosto.getDescripcion());
			centroCostoActual.setAbreviatura(centroCosto.getAbreviatura());
			centroCostoActual.setObservacion(centroCosto.getObservacion());
			centroCostoActual.setEstado(centroCosto.getEstado());
			
			centroCostoUpdate = maestroService.saveCentroCosto(centroCostoActual);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al actualizar en la BD");
			response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().toString()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("mensaje", "Centro de Costo actualizado exitosamente");
		response.put("centroCosto", centroCostoUpdate);
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}
	
}
