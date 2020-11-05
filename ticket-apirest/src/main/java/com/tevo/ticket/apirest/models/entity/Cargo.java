package com.tevo.ticket.apirest.models.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
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
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "mae_cargo")
public class Cargo implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	@Column(unique = true)
	private String descripcion;

	@Size(max = 30)
	private String abreviatura;

	private String observacion;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
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

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getAbreviatura() {
		return abreviatura;
	}

	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
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

	private static final long serialVersionUID = 1L;

}
