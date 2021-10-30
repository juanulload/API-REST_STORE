package cl.jgud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cl.jgud.model.Clientes;
import cl.jgud.repository.ClientesRepository;

@Service
public class ClientesServiceImpl implements ClientesService {
	
	@Autowired
	private ClientesRepository clientesRepository;
	
	@Override
	@Transactional(readOnly = true)
	public List<Clientes> findAll() {
		return clientesRepository.findAll();
	}
	
	@Override
	public Clientes findByIdCliente(String idCliente) {
		return clientesRepository.findByIdCliente(idCliente);
	}
	
}	
