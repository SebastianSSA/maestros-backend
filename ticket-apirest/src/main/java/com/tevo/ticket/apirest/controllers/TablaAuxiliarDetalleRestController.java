package com.tevo.ticket.apirest.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tevo.ticket.apirest.models.entity.TablaAuxiliarDetalle;
import com.tevo.ticket.apirest.models.services.IConfiguracionService;

@CrossOrigin(origins = {"http://localhost:4200"})
@RestController
@RequestMapping("/api")
public class TablaAuxiliarDetalleRestController {

	@Autowired
	private IConfiguracionService configuracionService;
	
	@GetMapping("/tabla_auxiliar_detalle/autocomplete/{codTablaAuxiliar}/{nombre}")
	public List<TablaAuxiliarDetalle> autocompletado(@PathVariable String codTablaAuxiliar, @PathVariable String nombre) {
		if (nombre.equals("inexistente")) {
			nombre = "";
		}
		
		return configuracionService.autocompleteList(codTablaAuxiliar, nombre);
	}
	
	@GetMapping("/tabla_auxiliar_detalle/{codTablaAuxiliar}/{nombre}")
	public ResponseEntity<?> show(@PathVariable String codTablaAuxiliar, @PathVariable String nombre) {
		TablaAuxiliarDetalle estado = null;
		Map<String, Object> response = new HashMap<>();
		
		try {
			estado = configuracionService.findTablaAuxiliarDetalleByNombre(nombre, codTablaAuxiliar);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar la consulta en la BD");
			response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().toString()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if (estado == null) {
			response.put("mensaje", "El estado no existe en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<TablaAuxiliarDetalle>(estado, HttpStatus.OK); 
	}
	
	@GetMapping("/tabla_auxiliar_detalle/combo_box/{codTablaAuxiliar}")
	public List<TablaAuxiliarDetalle> comboBox(@PathVariable String codTablaAuxiliar) {
		return configuracionService.listTablaAuxiliarDetalleDropdownByCodigo(codTablaAuxiliar);
	}
}
