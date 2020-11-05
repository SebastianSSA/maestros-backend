package com.tevo.ticket.apirest.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tevo.ticket.apirest.models.entity.Persona;
import com.tevo.ticket.apirest.models.services.IPersonaService;
import com.tevo.ticket.apirest.models.services.IUploadFileService;

@CrossOrigin(origins = {"http://localhost:4200"})
@RestController
@RequestMapping("/api")
public class PersonaRestController {

	@Autowired
	private IPersonaService personaService;
	
	@Autowired
	private IUploadFileService uploadFileService;
	
	@GetMapping("/persona/page/{columnSort}/{order}/{page}")
	public Page<Persona> index(@PathVariable String columnSort,
			@PathVariable Integer order,
			@PathVariable Integer page){
		
		return personaService.findPageAndSort(columnSort, order, page);
	}
	
	@GetMapping("/persona/{id}")
	public ResponseEntity<?> show(@PathVariable Long id) {
		Persona persona = null;
		Map<String, Object> response = new HashMap<>();
		
		try {
			persona = personaService.findById(id);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar la consulta en la BD");
			response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().toString()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if (persona == null) {
			response.put("mensaje", "El Empleado no existe en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<Persona>(persona, HttpStatus.OK); 
	}
	
	@PostMapping("/persona")
	public ResponseEntity<?> create(@Valid @RequestBody Persona persona,
			BindingResult result) {
		Persona personaNew = null;
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
			personaNew = personaService.save(persona);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar el insert en la BD");
			response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().toString()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("mensaje", "Empleado registrado exitosamente");
		response.put("persona", personaNew);
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}
	
	
	@PutMapping("/persona/{id}")
	public ResponseEntity<?> update(@Valid @RequestBody Persona persona, 
			BindingResult result, 
			@PathVariable Long id) {
		Persona personaActual = personaService.findById(id);
		Persona personaUpdate = null;
		Map<String, Object> response = new HashMap<>();
		
		if (result.hasErrors()) {
			List<String> errors = result.getFieldErrors()
					.stream()
					.map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
					.collect(Collectors.toList());
			
			response.put("errors", errors);
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.BAD_REQUEST);
		}
		
		if (personaActual == null) {
			response.put("mensaje", "Error, no se pudo editar: El empleado no existe en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}
		
		try {
			personaActual.setNombre(persona.getNombre());
			
			if (persona.getFoto() == null || persona.getFoto().length() == 0) {
				uploadFileService.eliminar(personaActual.getFoto());
				personaActual.setFoto("");
			} else  {
				personaActual.setFoto(persona.getFoto());
			}	
			
			personaUpdate = personaService.save(personaActual);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al actualizar en la BD");
			response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().toString()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("mensaje", "Empleado actualizado exitosamente");
		response.put("persona", personaUpdate);
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}
	
	@PostMapping("/persona/upload")
	public ResponseEntity<?> upload(@RequestParam("archivo") MultipartFile archivo, @RequestParam("id") Long id) {
		Map<String, Object> response = new HashMap<>();
		Persona persona = personaService.findById(id);
		
		if (!archivo.isEmpty()) {
			String nombreArchivo = null;
			
			try {
				nombreArchivo = uploadFileService.copiar(archivo);
			} catch (IOException e) {
				response.put("mensaje", "Error al subir la imagen");
				response.put("error", e.getMessage().concat(": ").concat(e.getCause().toString()));
				return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			String nombreFotoAnterior = persona.getFoto();
			uploadFileService.eliminar(nombreFotoAnterior);
			
			persona.setFoto(nombreArchivo);
			personaService.save(persona);
			
			response.put("persona", persona);
			response.put("mensaje", "Imagen " + nombreArchivo + " subida correctamente");
		} else {
			if (persona.getFoto() != null && persona.getFoto().length() > 0) {
				uploadFileService.eliminar(persona.getFoto());			
			}
			persona.setFoto("");
		}
		
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}
}
