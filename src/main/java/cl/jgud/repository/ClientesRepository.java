package cl.jgud.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cl.jgud.model.Clientes;

@Repository
public interface ClientesRepository extends JpaRepository<Clientes, Long>{
	Clientes findByIdCliente(String idCliente);
}
