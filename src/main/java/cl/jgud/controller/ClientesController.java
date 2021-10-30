package cl.jgud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cl.jgud.model.Clientes;
import cl.jgud.service.ClientesService;

@RestController
@RequestMapping("/api/v1")
public class ClientesController {
	
	@Autowired
	private ClientesService clientesService;
	
	@GetMapping("/clientes")
	public ResponseEntity<List<Clientes>> findAll(){
		
		try {
			List<Clientes> listaClientes = clientesService.findAll();
			
			if (listaClientes.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}	
			
			return new ResponseEntity<>(listaClientes, HttpStatus.OK);
			
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/clientes/{id_cliente}")
	
	public ResponseEntity<Clientes> findByIdCliente(@PathVariable ("id_cliente") String idCliente){
		
		try {
			
			Clientes clienteFound = clientesService.findByIdCliente(idCliente);
			
			if (clienteFound == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
			return new ResponseEntity<>(clienteFound,HttpStatus.OK);
			
		} catch (Exception e) {
			
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
		}
		
	}

}
	

