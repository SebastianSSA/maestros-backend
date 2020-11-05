package com.tevo.ticket.apirest.models.dao;

import org.springframework.data.repository.CrudRepository;

import com.tevo.ticket.apirest.models.entity.Usuario;

public interface IUsuarioDao extends CrudRepository<Usuario, Long> {
	
	public Usuario findByUsername(String username);

}
