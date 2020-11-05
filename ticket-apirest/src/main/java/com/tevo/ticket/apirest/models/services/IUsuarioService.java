package com.tevo.ticket.apirest.models.services;

import com.tevo.ticket.apirest.models.entity.Usuario;

public interface IUsuarioService {

	public Usuario findByUsername(String username);
}
