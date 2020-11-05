package com.tevo.ticket.apirest.models.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "mae_empresa")
public class Empresa implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	@Column(unique = true)
	@Size(max = 11)
	private String ruc;

	@NotEmpty
	@Column(name = "razon_social", unique = true)
	private String razonSocial;

	@NotEmpty
	@Column(name = "nombre_comercial")
	private String nombreComercial;

	private String abreviatura;

	@Column(name = "direccion_fiscal")
	private String direccionFiscal;

	@Column(name = "telefono_1")
	private String telefono1;

	@Column(name = "telefono_2")
	private String telefono2;

	private String correo;

	@Column(name = "url_web")
	private String urlWeb;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "empresa", cascade = CascadeType.ALL, orphanRemoval = true)
	@JsonIgnoreProperties({ "empresa", "hibernateLazyInitializer", "handler" })
	private List<Local> locales;

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
	
	public Empresa() {
		locales = new ArrayList<Local>();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}

	public String getNombreComercial() {
		return nombreComercial;
	}

	public void setNombreComercial(String nombreComercial) {
		this.nombreComercial = nombreComercial;
	}

	public String getAbreviatura() {
		return abreviatura;
	}

	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}

	public String getDireccionFiscal() {
		return direccionFiscal;
	}

	public void setDireccionFiscal(String direccionFiscal) {
		this.direccionFiscal = direccionFiscal;
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

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getUrlWeb() {
		return urlWeb;
	}

	public void setUrlWeb(String urlWeb) {
		this.urlWeb = urlWeb;
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

	public List<Local> getLocales() {
		return locales;
	}

	public void setLocales(List<Local> locales) {
		this.locales = locales;
	}

	private static final long serialVersionUID = 1L;

}
