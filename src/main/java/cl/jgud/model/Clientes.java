package cl.jgud.model;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;


@Entity //señala que es un modelo real
@Table(name = "clientes")//similar a @Column, señala el nombre de la tabla en la BD. Evita problemas de mapeo
@Getter
@Setter
public class Clientes {
	
	@Id //señala que este atributo es un identificador. Genera persistencia con JPA
	@Column(name="id_cliente", columnDefinition = "char(5)")
	private String idCliente;
	
	//la etiqueta @Column se utiliza cuando la base de datos es construida manualmente,
	//y sirve para especificar el nombre de la columna donde se encontrará ese atributo en la BD
	@Column(name ="nombre_compania")
	private String nombreCompania;
	
	@Column(name ="nombre_contacto")
	private String nombreContacto;
	
	@Column(name ="titulo_contacto")
	private String tituloContacto;
	
	@Column(name ="direccion")
	private String direccion;
	
	@Column(name ="ciudad")
	private String ciudad;
	
	@Column(name ="region")
	private String region;

	@Column(name ="codigo_postal")
	private String codigoPostal;
	
	@Column(name ="pais")
	private String pais;
	
	@Column(name ="telefono")
	private String telefono;
	
	@Column(name ="mail")
	private String email;
	
	@Column(name ="clave")
	private String clave;
	
	
}
