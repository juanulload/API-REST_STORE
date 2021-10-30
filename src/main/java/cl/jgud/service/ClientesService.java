package cl.jgud.service;

import java.util.List;

import cl.jgud.model.Clientes;

public interface ClientesService {
	
	public List<Clientes> findAll();
	public Clientes findByIdCliente(String idCliente);
}
