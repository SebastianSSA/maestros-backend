package com.tevo.ticket.apirest.controllers;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
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

import com.tevo.ticket.apirest.models.entity.Empleado;
import com.tevo.ticket.apirest.models.services.IMaestroService;
import com.tevo.ticket.apirest.models.services.IUploadFileService;

@CrossOrigin(origins = {"http://localhost:4200"})
@RestController
@RequestMapping("/api")
public class EmpleadoRestController {
	
	protected final Log logger = LogFactory.getLog(this.getClass());

	@Autowired
	private IMaestroService maestroService;
	
	@Autowired
	private IUploadFileService uploadFileService;
	
	@GetMapping("/empleado/page/{nroDocumentoIdentidad}/{nombreCompleto}/{columnSort}/{order}/{page}")
	public Page<Empleado> index(@PathVariable String nroDocumentoIdentidad,
			@PathVariable String nombreCompleto,
			@PathVariable String columnSort,
			@PathVariable Integer order,
			@PathVariable Integer page) {
		
		if (nroDocumentoIdentidad.equals("nroDocumentoIdentidad")) {
			nroDocumentoIdentidad = "";
		}
		
		if (nombreCompleto.equals("nombreCompleto")) {
			nombreCompleto = "";
		}
		
		return maestroService.findEmpleadoPageAndSort(nroDocumentoIdentidad, nombreCompleto, columnSort, order, page);
	}
	
	@GetMapping("/empleado/{id}")
	public ResponseEntity<?> show(@PathVariable Long id) {
		Empleado empleado = null;
		Map<String, Object> response = new HashMap<>();
		
		try {
			empleado = maestroService.findEmpleadoById(id);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar la consulta en la BD");
			response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().toString()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if (empleado == null) {
			response.put("mensaje", "El Empleado no existe en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<Empleado>(empleado, HttpStatus.OK); 
	}
	
	@PostMapping("/empleado")
	public ResponseEntity<?> create(@Valid @RequestBody Empleado empleado,
			BindingResult result) {
		Empleado empleadoNew = null;
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
			empleadoNew = maestroService.saveEmpleado(empleado);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar el insert en la BD");
			response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().toString()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("mensaje", "Empleado registrado exitosamente");
		response.put("empleado", empleadoNew);
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}
	
	@PutMapping("/empleado/{id}")
	public ResponseEntity<?> update(@Valid @RequestBody Empleado empleado,
			BindingResult result, 
			@PathVariable Long id) {
		Empleado empleadoActual = maestroService.findEmpleadoById(id);
		Empleado empleadoUpdate = null;
		Map<String, Object> response = new HashMap<>();
		
		if (result.hasErrors()) {
			List<String> errors = result.getFieldErrors()
					.stream()
					.map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
					.collect(Collectors.toList());
			
			response.put("errors", errors);
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.BAD_REQUEST);
		}
		
		if (empleadoActual == null) {
			response.put("mensaje", "Error, no se pudo editar: El empleado no existe en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}
		
		try {
			empleadoActual.setTipoDocumentoIdentidad(empleado.getTipoDocumentoIdentidad());
			empleadoActual.setNroDocumentoIdentidad(empleado.getNroDocumentoIdentidad());
			empleadoActual.setApellidoPaterno(empleado.getApellidoPaterno());
			empleadoActual.setApellidoMaterno(empleado.getApellidoMaterno());
			empleadoActual.setNombre(empleado.getNombre());
			empleadoActual.setSexo(empleado.getSexo());
			empleadoActual.setEstadoCivil(empleado.getEstadoCivil());
			empleadoActual.setFechaNacimiento(empleado.getFechaNacimiento());
			empleadoActual.setTelefono1(empleado.getTelefono1());
			empleadoActual.setTelefono2(empleado.getTelefono2());
			empleadoActual.setDireccionActual(empleado.getDireccionActual());
			empleadoActual.setCargo(empleado.getCargo());
			empleadoActual.setCentroCosto(empleado.getCentroCosto());
			empleadoActual.setLocal(empleado.getLocal());
			empleadoActual.setTipoContrato(empleado.getTipoContrato());
			empleadoActual.setFechaInicioTrabajo(empleado.getFechaInicioTrabajo());
			empleadoActual.setFechaFinTrabajo(empleado.getFechaFinTrabajo());
			
			if (empleado.getFoto() == null || empleado.getFoto().length() == 0) {
				uploadFileService.eliminar(empleadoActual.getFoto());
				empleadoActual.setFoto("");
			} else  {
				empleadoActual.setFoto(empleado.getFoto());
			}			
			
			empleadoActual.setEstado(empleado.getEstado());
			
			empleadoUpdate = maestroService.saveEmpleado(empleadoActual);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al actualizar en la BD");
			response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().toString()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("mensaje", "Empleado actualizado exitosamente");
		response.put("empleado", empleadoUpdate);
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}
	
	@PostMapping("/empleado/upload")
	public ResponseEntity<?> upload(@RequestParam("archivo") MultipartFile archivo, @RequestParam("id") Long id) {
		Map<String, Object> response = new HashMap<>();
		Empleado empleado = maestroService.findEmpleadoById(id);
		
		if (!archivo.isEmpty()) {
			String nombreArchivo = null;
			
			try {
				nombreArchivo = uploadFileService.copiar(archivo);
			} catch (IOException e) {
				response.put("mensaje", "Error al subir la imagen");
				response.put("error", e.getMessage().concat(": ").concat(e.getCause().toString()));
				return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			String nombreFotoAnterior = empleado.getFoto();
			uploadFileService.eliminar(nombreFotoAnterior);
			
			empleado.setFoto(nombreArchivo);
			maestroService.saveEmpleado(empleado);
			
			response.put("empleado", empleado);
			response.put("mensaje", "Imagen " + nombreArchivo + " subida correctamente");
		} else {
			if (empleado.getFoto() != null && empleado.getFoto().length() > 0) {
				uploadFileService.eliminar(empleado.getFoto());			
			}
			empleado.setFoto("");
		}
		
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}
	
	@GetMapping("uploads/img/empleado/{nombreFoto:.+}")
	public ResponseEntity<Resource> verFoto(@PathVariable String nombreFoto){
		Resource recurso = null;
		try {
			recurso = uploadFileService.cargar(nombreFoto);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		HttpHeaders cabecera = new HttpHeaders();
		cabecera.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + recurso.getFilename() + "\"");
		
		return new ResponseEntity<Resource>(recurso, cabecera, HttpStatus.OK);
	}
}
