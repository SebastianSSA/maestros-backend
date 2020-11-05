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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Formula;
//import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "mae_empleado")
public class Empleado implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"}, allowSetters = true)
	private TablaAuxiliarDetalle tipoDocumentoIdentidad;

	@NotEmpty
	@Column(unique = true)
	@Size(max = 20)
	private String nroDocumentoIdentidad;

	@NotEmpty
	@Column(name = "apellido_paterno")
	private String apellidoPaterno;

	@NotEmpty
	@Column(name = "apellido_materno")
	private String apellidoMaterno;
	
	@NotEmpty
	private String nombre;

	@Formula("CONCAT(apellido_paterno,' ',apellido_materno,' ',nombre)")
	private String nombreCompleto;

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"}, allowSetters = true)
	private TablaAuxiliarDetalle sexo;

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"}, allowSetters = true)
	private TablaAuxiliarDetalle estadoCivil;

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_nacimiento")
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaNacimiento;

	private String correo;

	@Column(name = "telefono_1")
	private String telefono1;

	@Column(name = "telefono_2")
	private String telefono2;

	@Column(name = "direccion_actual")
	private String direccionActual;

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	private Cargo cargo;

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	private CentroCosto centroCosto;

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	private Local local;

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"}, allowSetters = true)
	private TablaAuxiliarDetalle tipoContrato;

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_inicio_trabajo")
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaInicioTrabajo;

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_fin_trabajo")
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaFinTrabajo;

	private String foto;

	@NotNull
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

	public TablaAuxiliarDetalle getTipoDocumentoIdentidad() {
		return tipoDocumentoIdentidad;
	}

	public void setTipoDocumentoIdentidad(TablaAuxiliarDetalle tipoDocumentoIdentidad) {
		this.tipoDocumentoIdentidad = tipoDocumentoIdentidad;
	}

	public String getNroDocumentoIdentidad() {
		return nroDocumentoIdentidad;
	}

	public void setNroDocumentoIdentidad(String nroDocumentoIdentidad) {
		this.nroDocumentoIdentidad = nroDocumentoIdentidad;
	}

	public String getApellidoPaterno() {
		return apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	public String getApellidoMaterno() {
		return apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNombreCompleto() {
		return nombreCompleto;
	}

//	public void setNombreCompleto(String nombreCompleto) {
//		this.nombreCompleto = nombreCompleto;
//	}

	public TablaAuxiliarDetalle getSexo() {
		return sexo;
	}

	public void setSexo(TablaAuxiliarDetalle sexo) {
		this.sexo = sexo;
	}

	public TablaAuxiliarDetalle getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(TablaAuxiliarDetalle estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
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

	public String getDireccionActual() {
		return direccionActual;
	}

	public void setDireccionActual(String direccionActual) {
		this.direccionActual = direccionActual;
	}

	public Cargo getCargo() {
		return cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}

	public CentroCosto getCentroCosto() {
		return centroCosto;
	}

	public void setCentroCosto(CentroCosto centroCosto) {
		this.centroCosto = centroCosto;
	}

	public Local getLocal() {
		return local;
	}

	public void setLocal(Local local) {
		this.local = local;
	}

	public TablaAuxiliarDetalle getTipoContrato() {
		return tipoContrato;
	}

	public void setTipoContrato(TablaAuxiliarDetalle tipoContrato) {
		this.tipoContrato = tipoContrato;
	}

	public Date getFechaInicioTrabajo() {
		return fechaInicioTrabajo;
	}

	public void setFechaInicioTrabajo(Date fechaInicioTrabajo) {
		this.fechaInicioTrabajo = fechaInicioTrabajo;
	}

	public Date getFechaFinTrabajo() {
		return fechaFinTrabajo;
	}

	public void setFechaFinTrabajo(Date fechaFinTrabajo) {
		this.fechaFinTrabajo = fechaFinTrabajo;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
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

	public void setFechaCrea(Date fechaCrea) {
		this.fechaCrea = fechaCrea;
	}

	private static final long serialVersionUID = 1L;

}
