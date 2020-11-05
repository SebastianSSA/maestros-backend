package com.tevo.ticket.apirest.models.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "cfg_tabla_auxiliar_detalle")
public class TablaAuxiliarDetalle implements Serializable {

	@EmbeddedId
	private TablaAuxiliarDetalleId tablaAuxiliarDetalleId;

	private String nombre;

	private String abreviatura;

	private String valor;

	private String observacion;

	@Column(name = "id_usuario_crea")
	private int idUsuarioCrea;

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_crea")
	private Date fechaCrea;

	public TablaAuxiliarDetalleId getTablaAuxiliarDetalleId() {
		return tablaAuxiliarDetalleId;
	}

	public void setTablaAuxiliarDetalleId(TablaAuxiliarDetalleId tablaAuxiliarDetalleId) {
		this.tablaAuxiliarDetalleId = tablaAuxiliarDetalleId;
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

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
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

	public void setFechaCrea(Date fechaCrea) {
		this.fechaCrea = fechaCrea;
	}

	private static final long serialVersionUID = 1L;
}
