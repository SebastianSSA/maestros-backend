package com.tevo.ticket.apirest.models.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "mae_local")
public class Local implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	@Column(unique = true)
	private String nombre;

	private String abreviatura;

	@Column(name = "nro_pisos")
	private Integer nroPisos;

	@NotEmpty
	private String direccion;

	@Column(name = "telefono_1")
	private String telefono1;

	@Column(name = "telefono_2")
	private String telefono2;

	private String observacion;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties(value = { "locales", "hibernateLazyInitializer", "handler" }, allowSetters = true)
	private Empresa empresa;

	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"}, allowSetters = true)
	private TablaAuxiliarDetalle estado;

	@Column(name = "id_usuario_crea", updatable = false)
	private int idUsuarioCrea;

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_crea", updatable = false)
	private Date fechaCrea;

	@PrePersist
	public void prePersist() {
		fechaCrea = new Date();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getAbreviatura() {
		return abreviatura;
	}

	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}

	public Integer getNroPisos() {
		return nroPisos;
	}

	public void setNroPisos(Integer nroPisos) {
		this.nroPisos = nroPisos;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono1() {
		return telefono1;
	}

	public void setTelefono1(String telefono1) {
		this.telefono1 = telefono1;
	}

	public String getTelefono2() {
		return telefono2;
	}

	public void setTelefono2(String telefono2) {
		this.telefono2 = telefono2;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public TablaAuxiliarDetalle getEstado() {
		return estado;
	}

	public void setEstado(TablaAuxiliarDetalle estado) {
		this.estado = estado;
	}

	public int getIdUsuarioCrea() {
		return idUsuarioCrea;
	}

	public void setIdUsuarioCrea(int idUsuarioCrea) {
		this.idUsuarioCrea = idUsuarioCrea;
	}

	public Date getFechaCrea() {
		return fechaCrea;
	}

//	public void setFechaCrea(Date fechaCrea) {
//		this.fechaCrea = fechaCrea;
//	}

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

	private static final long serialVersionUID = 1L;
}
