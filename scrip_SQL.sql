create table clientes(
	id_cliente char(5),
    nombre_compania varchar(200) unique,
    nombre_contacto varchar(50),
    titulo_contacto varchar(100),
    direccion varchar(150),
    ciudad varchar(50),
    region varchar(50),
    codigo_postal varchar(15),
    pais varchar(50),
    telefono varchar(15),
    mail varchar(50),
    clave varchar(50),
    constraint pk_cliente primary key (id_cliente)
);

create table empleados(
	id_empleado int,
    primer_nombre varchar(20),
    segundo_nombre varchar(20),
    titulo varchar(30),
    fecha_nacimiento date,
    fecha_contratacion date,
    direccion varchar(50),
    ciudad varchar(50),
    region varchar(50),
    codigo_postal varchar(15),
    pais varchar(50),
    telefono varchar(15),
    mail varchar(50),
    constraint pk_empleados primary key (id_empleado)
);

create table transporte(
	id_transporte int,
    nombre_compania varchar(200) unique,
    telefono varchar(15),
    mail varchar(50),
    constraint pk_transporte primary key (id_transporte)
);

create table ordenes(
	id_orden int,
    id_cliente char(5),
    id_empleado int,
    id_transporte int,
    fecha_orden date,
    fecha_requerida date,
    fecha_envio date,
    carga decimal,
    envio_nombre varchar(100),
    envio_direccion varchar(100),
    envio_ciudad varchar(50),
    envio_region varchar(50),
    envio_pais varchar(50),
    envio_codigo_postal varchar(50),
    constraint pk_ordenes primary key (id_orden),
    constraint fk_clientes foreign key (id_cliente) references clientes(id_cliente),
    constraint fk_empleados foreign key (id_empleado) references empleados(id_empleado),
    constraint fk_transporte foreign key (id_transporte) references transporte(id_transporte)
);

create table categorias(
	id_categoria int,
    nombre_categoria varchar(30),
    descripcion varchar(200),
	constraint pk_categorias primary key (id_categoria)
);

create table proveedores(
	id_proveedor int,
    nombre_compania varchar(200) unique,
    nombre_contacto varchar(100),
    titulo_contacto varchar(50),
    direccion varchar(100),
    ciudad varchar(50),
    region varchar(50),
    codigo_postal varchar(15),
    pais varchar(50),
    telefono varchar(15),
    mail varchar(50),
    constraint pk_proveedores primary key (id_proveedor)
);

create table productos(
	id_producto int,
    nombre_producto varchar(50),
    id_proveedor int,
    id_categoria int,
    cantidad_por_unidad varchar(200),
    precio_unitario decimal,
    unidades_en_stock smallint,
    discontinuado number(1),
    constraint pk_productos primary key (id_producto),
    constraint fk_proveedores foreign key (id_proveedor) references proveedores(id_proveedor),
    constraint fk_categorias foreign key (id_categoria) references categorias(id_categoria)
);

create table detalle_orden(
	id_orden int,
    id_producto int,
    precio_unitario decimal,
    cantidad int,
    descuento decimal(18,2),
    constraint pk_detalle_orden primary key (id_orden, id_producto),
    constraint fk_ordenes foreign key (id_orden) references ordenes(id_orden),
    constraint fk_productos foreign key (id_producto) references productos(id_producto)
);

create table regiones(
	id_region int,
    descripcion_region varchar(20),
    constraint pk_regiones primary key (id_region)
);

create table territorios(
	id_territorio int,
    descripcion_territorio varchar(20),
    id_region int,
    constraint pk_territorios primary key (id_territorio),
    constraint fk_regiones foreign key (id_region) references regiones(id_region)
);

create table empleados_territorios(
	id_empleado int,
    id_territorio int,
    constraint pk_empleados_territorios primary key (id_empleado, id_territorio),
    constraint fk_empleados_territorios foreign key (id_empleado) references empleados(id_empleado),
    constraint fk_territorios_empleados foreign key (id_territorio) references territorios(id_territorio)
);

insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('ALFKI','Alfreds Futterkiste','Maria Anders','Sales Representative','Obere Str. 57','Berlin',NULL,'12209','Germany','030-0074321','ALFKI@mail.com', 'ALFKIqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('ANATR','Ana Trujillo Emparedados y helados','Ana Trujillo','Owner','Avda. de la Constitución 2222','México D.F.',NULL,'05021','Mexico','(5) 555-4729','ANATR@mail.com', 'ANATRqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('ANTON','Antonio Moreno Taquería','Antonio Moreno','Owner','Mataderos  2312','México D.F.',NULL,'05023','Mexico','(5) 555-3932','ANTON@mail.com', 'ANTONqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('AROUT','Around the Horn','Thomas Hardy','Sales Representative','120 Hanover Sq.','London',NULL,'WA1 1DP','UK','(171) 555-7788','AROUT@mail.com', 'AROUTqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('BERGS','Berglunds snabbköp','Christina Berglund','Order Administrator','Berguvsvägen  8','Luleå',NULL,'S-958 22','Sweden','0921-12 34 65','BERGS@mail.com', 'BERGSqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('BLAUS','Blauer See Delikatessen','Hanna Moos','Sales Representative','Forsterstr. 57','Mannheim',NULL,'68306','Germany','0621-08460','BLAUS@mail.com', 'BLAUSqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('BLONP','Blondesddsl père et fils','Frédérique Citeaux','Marketing Manager','24, place Kléber','Strasbourg',NULL,'67000','France','88.60.15.31','BLONP@mail.com', 'BLONPqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('BOLID','Bólido Comidas preparadas','Martín Sommer','Owner','C/ Araquil, 67','Madrid',NULL,'28023','Spain','(91) 555 22 82','BOLID@mail.com', 'BOLIDqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('BONAP','Bon app''','Laurence Lebihan','Owner','12, rue des Bouchers','Marseille',NULL,'13008','France','91.24.45.40','BONAP@mail.com', 'BONAPqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('BOTTM','Bottom-Dollar Markets','Elizabeth Lincoln','Accounting Manager','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada','(604) 555-4729','BOTTM@mail.com', 'BOTTMqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('BSBEV','B''s Beverages','Victoria Ashworth','Sales Representative','Fauntleroy Circus','London',NULL,'EC2 5NT','UK','(171) 555-1212','BSBEV@mail.com', 'BSBEVqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('CACTU','Cactus Comidas para llevar','Patricio Simpson','Sales Agent','Cerrito 333','Buenos Aires',NULL,'1010','Argentina','(1) 135-5555','CACTU@mail.com', 'CACTUqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('CENTC','Centro comercial Moctezuma','Francisco Chang','Marketing Manager','Sierras de Granada 9993','México D.F.',NULL,'05022','Mexico','(5) 555-3392','CENTC@mail.com', 'CENTCqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('CHOPS','Chop-suey Chinese','Yang Wang','Owner','Hauptstr. 29','Bern',NULL,'3012','Switzerland','0452-076545','CHOPS@mail.com', 'CHOPSqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('COMMI','Comércio Mineiro','Pedro Afonso','Sales Associate','Av. dos Lusíadas, 23','Sao Paulo','SP','05432-043','Brazil','(11) 555-7647','COMMI@mail.com', 'COMMIqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('CONSH','Consolidated Holdings','Elizabeth Brown','Sales Representative','Berkeley Gardens 12  Brewery','London',NULL,'WX1 6LT','UK','(171) 555-2282','CONSH@mail.com', 'CONSHqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('DRACD','Drachenblut Delikatessen','Sven Ottlieb','Order Administrator','Walserweg 21','Aachen',NULL,'52066','Germany','0241-039123','DRACD@mail.com', 'DRACDqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('DUMON','Du monde entier','Janine Labrune','Owner','67, rue des Cinquante Otages','Nantes',NULL,'44000','France','40.67.88.88','DUMON@mail.com', 'DUMONqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('EASTC','Eastern Connection','Ann Devon','Sales Agent','35 King George','London',NULL,'WX3 6FW','UK','(171) 555-0297','EASTC@mail.com', 'EASTCqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('ERNSH','Ernst Handel','Roland Mendel','Sales Manager','Kirchgasse 6','Graz',NULL,'8010','Austria','7675-3425','ERNSH@mail.com', 'ERNSHqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('FAMIA','Familia Arquibaldo','Aria Cruz','Marketing Assistant','Rua Orós, 92','Sao Paulo','SP','05442-030','Brazil','(11) 555-9857','FAMIA@mail.com', 'FAMIAqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('FISSA','FISSA Fabrica Inter. Salchichas S.A.','Diego Roel','Accounting Manager','C/ Moralzarzal, 86','Madrid',NULL,'28034','Spain','(91) 555 94 44','FISSA@mail.com', 'FISSAqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('FOLIG','Folies gourmandes','Martine Rancé','Assistant Sales Agent','184, chaussée de Tournai','Lille',NULL,'59000','France','20.16.10.16','FOLIG@mail.com', 'FOLIGqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('FOLKO','Folk och fä HB','Maria Larsson','Owner','Åkergatan 24','Bräcke',NULL,'S-844 67','Sweden','0695-34 67 21','FOLKO@mail.com', 'FOLKOqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('FRANK','Frankenversand','Peter Franken','Marketing Manager','Berliner Platz 43','München',NULL,'80805','Germany','089-0877310','FRANK@mail.com', 'FRANKqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('FRANR','France restauration','Carine Schmitt','Marketing Manager','54, rue Royale','Nantes',NULL,'44000','France','40.32.21.21','FRANR@mail.com', 'FRANRqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('FRANS','Franchi S.p.A.','Paolo Accorti','Sales Representative','Via Monte Bianco 34','Torino',NULL,'10100','Italy','011-4988260','FRANS@mail.com', 'FRANSqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('FURIB','Furia Bacalhau e Frutos do Mar','Lino Rodriguez','Sales Manager','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal','(1) 354-2534','FURIB@mail.com', 'FURIBqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('GALED','Galería del gastrónomo','Eduardo Saavedra','Marketing Manager','Rambla de Cataluña, 23','Barcelona',NULL,'08022','Spain','(93) 203 4560','GALED@mail.com', 'GALEDqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('GODOS','Godos Cocina Típica','José Pedro Freyre','Sales Manager','C/ Romero, 33','Sevilla',NULL,'41101','Spain','(95) 555 82 82','GODOS@mail.com', 'GODOSqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('GOURL','Gourmet Lanchonetes','André Fonseca','Sales Associate','Av. Brasil, 442','Campinas','SP','04876-786','Brazil','(11) 555-9482','GOURL@mail.com', 'GOURLqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('GREAL','Great Lakes Food Market','Howard Snyder','Marketing Manager','2732 Baker Blvd.','Eugene','OR','97403','USA','(503) 555-7555','GREAL@mail.com', 'GREALqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('GROSR','GROSELLA-Restaurante','Manuel Pereira','Owner','5ª Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela','(2) 283-2951','GROSR@mail.com', 'GROSRqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('HANAR','Hanari Carnes','Mario Pontes','Accounting Manager','Rua do Paço, 67','Rio de Janeiro','RJ','05454-876','Brazil','(21) 555-0091','HANAR@mail.com', 'HANARqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('HILAA','HILARION-Abastos','Carlos Hernández','Sales Representative','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','Táchira','5022','Venezuela','(5) 555-1340','HILAA@mail.com', 'HILAAqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('HUNGC','Hungry Coyote Import Store','Yoshi Latimer','Sales Representative','City Center Plaza 516 Main St.','Elgin','OR','97827','USA','(503) 555-6874','HUNGC@mail.com', 'HUNGCqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('HUNGO','Hungry Owl All-Night Grocers','Patricia McKenna','Sales Associate','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland','2967 542','HUNGO@mail.com', 'HUNGOqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('ISLAT','Island Trading','Helen Bennett','Marketing Manager','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK','(198) 555-8888','ISLAT@mail.com', 'ISLATqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('KOENE','Königlich Essen','Philip Cramer','Sales Associate','Maubelstr. 90','Brandenburg',NULL,'14776','Germany','0555-09876','KOENE@mail.com', 'KOENEqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('LACOR','La corne d''abondance','Daniel Tonini','Sales Representative','67, avenue de l''Europe','Versailles',NULL,'78000','France','30.59.84.10','LACOR@mail.com', 'LACORqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('LAMAI','La maison d''Asie','Annette Roulet','Sales Manager','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France','61.77.61.10','LAMAI@mail.com', 'LAMAIqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('LAUGB','Laughing Bacchus Wine Cellars','Yoshi Tannamuri','Marketing Assistant','1900 Oak St.','Vancouver','BC','V3F 2K1','Canada','(604) 555-3392','LAUGB@mail.com', 'LAUGBqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('LAZYK','Lazy K Kountry Store','John Steel','Marketing Manager','12 Orchestra Terrace','Walla Walla','WA','99362','USA','(509) 555-7969','LAZYK@mail.com', 'LAZYKqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('LEHMS','Lehmanns Marktstand','Renate Messner','Sales Representative','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany','069-0245984','LEHMS@mail.com', 'LEHMSqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('LETSS','Let''s Stop N Shop','Jaime Yorres','Owner','87 Polk St. Suite 5','San Francisco','CA','94117','USA','(415) 555-5938','LETSS@mail.com', 'LETSSqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('LILAS','LILA-Supermercado','Carlos González','Accounting Manager','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela','(9) 331-6954','LILAS@mail.com', 'LILASqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('LINOD','LINO-Delicateses','Felipe Izquierdo','Owner','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela','(8) 34-56-12','LINOD@mail.com', 'LINODqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('LONEP','Lonesome Pine Restaurant','Fran Wilson','Sales Manager','89 Chiaroscuro Rd.','Portland','OR','97219','USA','(503) 555-9573','LONEP@mail.com', 'LONEPqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('MAGAA','Magazzini Alimentari Riuniti','Giovanni Rovelli','Marketing Manager','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy','035-640230','MAGAA@mail.com', 'MAGAAqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('MAISD','Maison Dewey','Catherine Dewey','Sales Agent','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium','(02) 201 24 67','MAISD@mail.com', 'MAISDqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('MEREP','Mère Paillarde','Jean Fresnière','Marketing Assistant','43 rue St. Laurent','Montréal','Québec','H1J 1C3','Canada','(514) 555-8054','MEREP@mail.com', 'MEREPqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('MORGK','Morgenstern Gesundkost','Alexander Feuer','Marketing Assistant','Heerstr. 22','Leipzig',NULL,'04179','Germany','0342-023176','MORGK@mail.com', 'MORGKqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('NORTS','North/South','Simon Crowther','Sales Associate','South House 300 Queensbridge','London',NULL,'SW7 1RZ','UK','(171) 555-7733','NORTS@mail.com', 'NORTSqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('OCEAN','Océano Atlántico Ltda.','Yvonne Moncada','Sales Agent','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires',NULL,'1010','Argentina','(1) 135-5333','OCEAN@mail.com', 'OCEANqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('OLDWO','Old World Delicatessen','Rene Phillips','Sales Representative','2743 Bering St.','Anchorage','AK','99508','USA','(907) 555-7584','OLDWO@mail.com', 'OLDWOqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('OTTIK','Ottilies Käseladen','Henriette Pfalzheim','Owner','Mehrheimerstr. 369','Köln',NULL,'50739','Germany','0221-0644327','OTTIK@mail.com', 'OTTIKqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('PARIS','Paris spécialités','Marie Bertrand','Owner','265, boulevard Charonne','Paris',NULL,'75012','France','(1) 42.34.22.66','PARIS@mail.com', 'PARISqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('PERIC','Pericles Comidas clásicas','Guillermo Fernández','Sales Representative','Calle Dr. Jorge Cash 321','México D.F.',NULL,'05033','Mexico','(5) 552-3745','PERIC@mail.com', 'PERICqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('POCCO','Piccolo und mehr','Georg Pipps','Sales Manager','Geislweg 14','Salzburg',NULL,'5020','Austria','6562-9722','POCCO@mail.com', 'POCCOqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('PRINI','Princesa Isabel Vinhos','Isabel de Castro','Sales Representative','Estrada da saúde n. 58','Lisboa',NULL,'1756','Portugal','(1) 356-5634','PRINI@mail.com', 'PRINIqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('QUEDE','Que Delícia','Bernardo Batista','Accounting Manager','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil','(21) 555-4252','QUEDE@mail.com', 'QUEDEqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('QUEEN','Queen Cozinha','Lúcia Carvalho','Marketing Assistant','Alameda dos Canàrios, 891','Sao Paulo','SP','05487-020','Brazil','(11) 555-1189','QUEEN@mail.com', 'QUEENqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('QUICK','QUICK-Stop','Horst Kloss','Accounting Manager','Taucherstraße 10','Cunewalde',NULL,'01307','Germany','0372-035188','QUICK@mail.com', 'QUICKqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('RANCH','Rancho grande','Sergio Gutiérrez','Sales Representative','Av. del Libertador 900','Buenos Aires',NULL,'1010','Argentina','(1) 123-5555','RANCH@mail.com', 'RANCHqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('RATTC','Rattlesnake Canyon Grocery','Paula Wilson','Assistant Sales Representative','2817 Milton Dr.','Albuquerque','NM','87110','USA','(505) 555-5939','RATTC@mail.com', 'RATTCqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('REGGC','Reggiani Caseifici','Maurizio Moroni','Sales Associate','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy','0522-556721','REGGC@mail.com', 'REGGCqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('RICAR','Ricardo Adocicados','Janete Limeira','Assistant Sales Agent','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil','(21) 555-3412','RICAR@mail.com', 'RICARqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('RICSU','Richter Supermarkt','Michael Holz','Sales Manager','Grenzacherweg 237','Genève',NULL,'1203','Switzerland','0897-034214','RICSU@mail.com', 'RICSUqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('ROMEY','Romero y tomillo','Alejandra Camino','Accounting Manager','Gran Vía, 1','Madrid',NULL,'28001','Spain','(91) 745 6200','ROMEY@mail.com', 'ROMEYqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('SANTG','Santé Gourmet','Jonas Bergulfsen','Owner','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway','07-98 92 35','SANTG@mail.com', 'SANTGqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('SAVEA','Save-a-lot Markets','Jose Pavarotti','Sales Representative','187 Suffolk Ln.','Boise','ID','83720','USA','(208) 555-8097','SAVEA@mail.com', 'SAVEAqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('SEVES','Seven Seas Imports','Hari Kumar','Sales Manager','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK','(171) 555-1717','SEVES@mail.com', 'SEVESqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('SIMOB','Simons bistro','Jytte Petersen','Owner','Vinbæltet 34','Kobenhavn',NULL,'1734','Denmark','31 12 34 56','SIMOB@mail.com', 'SIMOBqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('SPECD','Spécialités du monde','Dominique Perrier','Marketing Manager','25, rue Lauriston','Paris',NULL,'75016','France','(1) 47.55.60.10','SPECD@mail.com', 'SPECDqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('SPLIR','Split Rail Beer and Ale','Art Braunschweiger','Sales Manager','P.O. Box 555','Lander','WY','82520','USA','(307) 555-4680','SPLIR@mail.com', 'SPLIRqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('SUPRD','Suprêmes délices','Pascale Cartrain','Accounting Manager','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium','(071)23672220','SUPRD@mail.com', 'SUPRDqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('THEBI','The Big Cheese','Liz Nixon','Marketing Manager','89 Jefferson Way Suite 2','Portland','OR','97201','USA','(503) 555-3612','THEBI@mail.com', 'THEBIqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('THECR','The Cracker Box','Liu Wong','Marketing Assistant','55 Grizzly Peak Rd.','Butte','MT','59801','USA','(406) 555-5834','THECR@mail.com', 'THECRqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('TOMSP','Toms Spezialitäten','Karin Josephs','Marketing Manager','Luisenstr. 48','Münster',NULL,'44087','Germany','0251-031259','TOMSP@mail.com', 'TOMSPqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('TORTU','Tortuga Restaurante','Miguel Angel Paolino','Owner','Avda. Azteca 123','México D.F.',NULL,'05033','Mexico','(5) 555-2933','TORTU@mail.com', 'TORTUqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('TRADH','Tradição Hipermercados','Anabela Domingues','Sales Representative','Av. Inês de Castro, 414','Sao Paulo','SP','05634-030','Brazil','(11) 555-2167','TRADH@mail.com', 'TRADHqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('TRAIH','Trail''s Head Gourmet Provisioners','Helvetius Nagy','Sales Associate','722 DaVinci Blvd.','Kirkland','WA','98034','USA','(206) 555-8257','TRAIH@mail.com', 'TRAIHqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('VAFFE','Vaffeljernet','Palle Ibsen','Sales Manager','Smagsloget 45','Århus',NULL,'8200','Denmark','86 21 32 43','VAFFE@mail.com', 'VAFFEqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('VICTE','Victuailles en stock','Mary Saveley','Sales Agent','2, rue du Commerce','Lyon',NULL,'69004','France','78.32.54.86','VICTE@mail.com', 'VICTEqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('VINET','Vins et alcools Chevalier','Paul Henriot','Accounting Manager','59 rue de l''Abbaye','Reims',NULL,'51100','France','26.47.15.10','VINET@mail.com', 'VINETqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('WANDK','Die Wandernde Kuh','Rita Müller','Sales Representative','Adenauerallee 900','Stuttgart',NULL,'70563','Germany','0711-020361','WANDK@mail.com', 'WANDKqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('WARTH','Wartian Herkku','Pirkko Koskitalo','Accounting Manager','Torikatu 38','Oulu',NULL,'90110','Finland','981-443655','WARTH@mail.com', 'WARTHqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('WELLI','Wellington Importadora','Paula Parente','Sales Manager','Rua do Mercado, 12','Resende','SP','08737-363','Brazil','(14) 555-8122','WELLI@mail.com', 'WELLIqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('WHITC','White Clover Markets','Karl Jablonski','Owner','305 - 14th Ave. S. Suite 3B','Seattle','WA','98128','USA','(206) 555-4112','WHITC@mail.com', 'WHITCqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('WILMK','Wilman Kala','Matti Karttunen','Owner/Marketing Assistant','Keskuskatu 45','Helsinki',NULL,'21240','Finland','90-224 8858','WILMK@mail.com', 'WILMKqwe123');
insert into Clientes(id_cliente, nombre_compania, nombre_contacto, titulo_contacto, direccion, ciudad, region, codigo_postal, pais, telefono, mail, clave)
values('WOLZA','Wolski  Zajazd','Zbyszek Piestrzeniewicz','Owner','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland','(26) 642-7012','WOLZA@mail.com', 'WOLZAqwe123');

insert into Empleados(id_empleado, primer_nombre, segundo_nombre, titulo, fecha_nacimiento, fecha_contratacion, direccion, ciudad, region, codigo_postal, pais, telefono, mail)
values(1,'Davolio','Nancy','Sales Representative','1948-08-12','1992-01-15','507 - 20th Ave. E.Apt. 2A','Seattle','WA','98122','USA','(206) 555-9857', '1Davolio@mail.com');
insert into Empleados(id_empleado, primer_nombre, segundo_nombre, titulo, fecha_nacimiento, fecha_contratacion, direccion, ciudad, region, codigo_postal, pais, telefono, mail)
values(2,'Fuller','Andrew','Vice President, Sales','1952-02-19','1992-08-14','908 W. Capital Way','Tacoma','WA','98401','USA','(206) 555-9482', '2Fuller@mail.com');
insert into Empleados(id_empleado, primer_nombre, segundo_nombre, titulo, fecha_nacimiento, fecha_contratacion, direccion, ciudad, region, codigo_postal, pais, telefono, mail)
values(3,'Leverling','Janet','Sales Representative','1963-08-30','1992-04-01','722 Moss Bay Blvd.','Kirkland','WA','98033','USA','(206) 555-3412', '3Leverling@mail.com');
insert into Empleados(id_empleado, primer_nombre, segundo_nombre, titulo, fecha_nacimiento, fecha_contratacion, direccion, ciudad, region, codigo_postal, pais, telefono, mail)
values(4,'Peacock','Margaret','Sales Representative','1937-09-19','1993-05-03','4110 Old Redmond Rd.','Redmond','WA','98052','USA','(206) 555-8122', '4Peacock@mail.com');
insert into Empleados(id_empleado, primer_nombre, segundo_nombre, titulo, fecha_nacimiento, fecha_contratacion, direccion, ciudad, region, codigo_postal, pais, telefono, mail)
values(5,'Buchanan','Steven','Sales Manager','1955-03-04','1993-10-17','14 Garrett Hill','London',NULL,'SW1 8JR','UK','(71) 555-4848', '5Buchanan@mail.com');
insert into Empleados(id_empleado, primer_nombre, segundo_nombre, titulo, fecha_nacimiento, fecha_contratacion, direccion, ciudad, region, codigo_postal, pais, telefono, mail)
values(6,'Suyama','Michael','Sales Representative','1963-02-07','1993-10-17','Coventry HouseMiner Rd.','London',NULL,'EC2 7JR','UK','(71) 555-7773', '6Suyama@mail.com');
insert into Empleados(id_empleado, primer_nombre, segundo_nombre, titulo, fecha_nacimiento, fecha_contratacion, direccion, ciudad, region, codigo_postal, pais, telefono, mail)
values(7,'King','Robert','Sales Representative','1960-05-29','1994-01-02','Edgeham HollowWinchester Way','London',NULL,'RG1 9SP','UK','(71) 555-5598', '7King@mail.com');
insert into Empleados(id_empleado, primer_nombre, segundo_nombre, titulo, fecha_nacimiento, fecha_contratacion, direccion, ciudad, region, codigo_postal, pais, telefono, mail)
values(8,'Callahan','Laura','Inside Sales Coordinator','1958-01-09','1994-03-05','4726 - 11th Ave. N.E.','Seattle','WA','98105','USA','(206) 555-1189', '8Callahan@mail.com');
insert into Empleados(id_empleado, primer_nombre, segundo_nombre, titulo, fecha_nacimiento, fecha_contratacion, direccion, ciudad, region, codigo_postal, pais, telefono, mail)
values(9,'Dodsworth','Anne','Sales Representative','1966-01-27','1994-11-15','7 Houndstooth Rd.','London',NULL,'WG2 7LT','UK','(71) 555-4444', '9Dodsworth@mail.com');

insert into transporte(id_transporte, nombre_compania, telefono, mail) 
values(1,'Speedy Express','(503) 555-9831', '1Speedy@mail.com');
insert into transporte(id_transporte, nombre_compania, telefono, mail)
values(2,'United Package','(503) 555-3199', '2United@mail.com');
insert into transporte(id_transporte, nombre_compania, telefono, mail)
values(3,'Federal Shipping','(503) 555-9931', '3Federal@mail.com');

insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10248,'VINET',5,'1996-4-7','1996-8-1','1996-7-16',3,32, 'Vins et alcools','59 rue de l''Abbaye','Reims',NULL,'51100','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10249,'TOMSP',6,'1996-7-5','1996-8-16','1996-7-10',1,11,'Toms Spezialitäten','Luisenstr. 48','Münster',NULL,'44087','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10250,'HANAR',4,'1996-7-8','1996-8-5','1996-7-12',2,65,'Hanari Carnes','Rua do Paço, 67','Rio de Janeiro','RJ','05454-876','Brazil');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10251,'VICTE',3,'1996-7-8','1996-8-7','1996-7-15',1,41,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10252,'SUPRD',4,'1996-7-9','1996-8-11','1996-7-11',2,51,'Suprêmes délices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10253,'HANAR',3,'1996-7-10','1996-7-24','1996-7-16',2,58,'Hanari Carnes','Rua do Paço, 67','Rio de Janeiro','RJ','05454-876','Brazil');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10254,'CHOPS',5,'1996-7-11','1996-8-8','1996-7-23',2,22,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10255,'RICSU',9,'1996-7-12','1996-8-9','1996-7-15',3,148,'Richter Supermarkt','Starenweg 5','Genève',NULL,'1204','Switzerland');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10256,'WELLI',3,'1996-7-15','1996-8-12','1996-7-17',2,13,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10257,'HILAA',4,'1996-7-17','1996-8-13','1996-7-22',3,81,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','Táchira','5022','Venezuela');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10258,'ERNSH',1,'1996-7-17','1996-8-14','1996-7-27',1,140,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10259,'CENTC',4,'1996-7-18','1996-8-15','1996-7-25',3,3,'Centro comercial Moctezuma','Sierras de Granada 9993','México D.F.',NULL,'05022','Mexico');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10260,'OTTIK',4,'1996-7-19','1996-8-16','1996-7-29',1,55,'Ottilies Käseladen','Mehrheimerstr. 369','Köln',NULL,'50739','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10261,'QUEDE',4,'1996-7-19','1996-8-30','1996-7-30',2,3,'Que Delícia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10262,'RATTC',8,'1996-7-22','1996-8-19','1996-7-25',3,48,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10263,'ERNSH',9,'1996-7-23','1996-8-20','1996-7-31',3,146,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10264,'FOLKO',6,'1996-7-24','1996-8-21','1996-8-23',3,3,'Folk och fä HB','Åkergatan 24','Bräcke',NULL,'S-844 67','Sweden');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10265,'BLONP',2,'1996-7-25','1996-8-22','1996-8-12',1,55,'Blondel père et fils','24, place Kléber','Strasbourg',NULL,'67000','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10266,'WARTH',3,'1996-7-26','1996-9-6','1996-7-31',3,25,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10267,'FRANK',4,'1996-7-29','1996-8-26','1996-8-6',1,208,'Frankenversand','Berliner Platz 43','München',NULL,'80805','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10268,'GROSR',8,'1996-7-30','1996-8-27','1996-8-2',3,66,'GROSELLA-Restaurante','5ª Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10269,'WHITC',5,'1996-7-31','1996-8-14','1996-8-9',1,4,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10270,'WARTH',1,'1996-8-1','1996-8-29','1996-8-2',1,136,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10271,'SPLIR',6,'1996-8-1','1996-8-29','1996-8-30',2,4,'Split Rail Beer and Ale','P.O. Box 555','Lander','WY','82520','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10272,'RATTC',6,'1996-8-6','1996-8-30','1996-8-6',2,98,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10273,'QUICK',3,'1996-8-5','1996-9-2','1996-8-12',3,76,'QUICK-Stop','Taucherstraße 10','Cunewalde',NULL,'01307','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10274,'VINET',6,'1996-8-6','1996-9-3','1996-8-16',1,6,'Vins et alcools Chevalier','59 rue de l''Abbaye','Reims',NULL,'51100','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10275,'MAGAA',1,'1996-8-7','1996-9-4','1996-8-9',1,26,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10276,'TORTU',8,'1996-8-8','1996-8-22','1996-8-14',3,13,'Tortuga Restaurante','Avda. Azteca 123','México D.F.',NULL,'05033','Mexico');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10277,'MORGK',2,'1996-8-9','1996-9-6','1996-8-13',3,125,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'04179','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10278,'BERGS',8,'1996-8-12','1996-9-9','1996-8-16',2,92,'Berglunds snabbköp','Berguvsvägen  8','Luleå',NULL,'S-958 22','Sweden');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10279,'LEHMS',8,'1996-8-13','1996-9-10','1996-8-16',2,25,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10280,'BERGS',2,'1996-8-14','1996-9-11','1996-9-12',1,8,'Berglunds snabbköp','Berguvsvägen 8','Luleå',NULL,'S-958 22','Sweden');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10281,'ROMEY',4,'1996-8-14','1996-8-28','1996-8-21',1,2,'Romero y tomillo','Gran Vía, 1','Madrid',NULL,'28001','Spain');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10282,'ROMEY',4,'1996-8-15','1996-9-22','1996-8-21',1,12,'Romero y tomillo','Gran Vía, 1','Madrid',NULL,'28001','Spain');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10283,'LILAS',3,'1996-8-16','1996-9-13','1996-8-23',3,84,'LILA-Supermercado','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10284,'LEHMS',4,'1996-8-19','1996-9-16','1996-8-27',1,76,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10285,'QUICK',1,'1996-8-22','1996-9-17','1996-8-26',2,76,'QUICK-Stop','Taucherstraße 10','Cunewalde',NULL,'01307','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10286,'QUICK',8,'1996-8-21','1996-9-18','1996-8-30',3,229,'QUICK-Stop','Taucherstraße 10','Cunewalde',NULL,'01307','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10287,'RICAR',8,'1996-8-22','1996-9-19','1996-8-28',3,12,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10288,'REGGC',4,'1996-8-23','1996-9-20','1996-9-3',1,7,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10289,'BSBEV',7,'1996-8-26','1996-9-23','1996-8-28',3,22,'B s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10290,'COMMI',8,'1996-8-27','1996-9-24','1996-9-3',1,79,'Comércio Mineiro','Av. dos Lusíadas, 23','Sao Paulo','SP','05432-043','Brazil');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10291,'QUEDE',6,'1996-8-27','1996-9-24','1996-9-4',2,6,'Que Delícia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10292,'TRADH',1,'1996-8-28','1996-9-25','1996-9-2',2,1,'Tradiçao Hipermercados','Av. Inês de Castro, 414','Sao Paulo','SP','05634-030','Brazil');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10293,'TORTU',1,'1996-8-29','1996-9-26','1996-9-11',3,21,'Tortuga Restaurante','Avda. Azteca 123','México D.F.',NULL,'05033','Mexico');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10294,'RATTC',4,'1996-8-30','1996-9-27','1996-9-5',2,147,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10295,'VINET',2,'1996-9-2','1996-9-30','1996-9-10',2,1,'Vins et alcools Chevalier','59 rue de l''Abbaye','Reims',NULL,'51100','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10296,'LILAS',6,'1996-9-3','1996-10-1','1996-9-11',1,0,'LILA-Supermercado','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10297,'BLONP',5,'1996-9-4','1996-10-16','1996-9-10',2,5,'Blondel père et fils','24, place Kléber','Strasbourg',NULL,'67000','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10298,'HUNGO',6,'1996-9-5','1996-10-3','1996-9-11',2,168,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10299,'RICAR',4,'1996-9-6','1996-10-4','1996-9-13',2,29,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10300,'MAGAA',2,'1996-9-9','1996-10-17','1996-9-18',2,17,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10301,'WANDK',8,'1996-9-9','1996-10-7','1996-9-17',2,45,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10302,'SUPRD',4,'1996-9-10','1996-10-8','1996-10-9',2,6,'Suprêmes délices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10303,'GODOS',7,'1996-9-11','1996-10-9','1996-9-18',2,107,'Godos Cocina Típica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10304,'TORTU',1,'1996-9-12','1996-10-10','1996-9-17',2,63,'Tortuga Restaurante','Avda. Azteca 123','México D.F.',NULL,'05033','Mexico');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10305,'OLDWO',8,'1996-9-13','1996-10-11','1996-10-9',3,257,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10306,'ROMEY',1,'1996-9-16','1996-10-14','1996-9-23',3,7,'Romero y tomillo','Gran Vía, 1','Madrid',NULL,'28001','Spain');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10307,'LONEP',2,'1996-9-17','1996-10-15','1996-9-25',2,0,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10308,'ANATR',7,'1996-9-18','1996-10-16','1996-9-24',3,1,'Ana Trujillo Emparedados y helados','Avda. de la Constitución 2222','México D.F.',NULL,'05021','Mexico');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10309,'HUNGO',3,'1996-9-19','1996-10-17','1996-10-23',1,47,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10310,'THEBI',8,'1996-9-27','1996-10-18','1996-9-27',2,17,'The Big Cheese','89 Jefferson Way Suite 2','Portland',N'OR',N'97201',N'USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10311,'DUMON',1,'1996-9-20','1996-10-4','1996-9-26',3,24,'Du monde entier','67, rue des Cinquante Otages','Nantes',NULL,'44000','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10312,'WANDK',2,'1996-9-23','1996-10-21','1996-10-3',2,40,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10313,'QUICK',2,'1996-9-24','1996-10-22','1996-10-4',2,1,'QUICK-Stop','Taucherstraße 10','Cunewalde',NULL,'01307','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10314,'RATTC',1,'1996-9-25','1996-10-23','1996-10-4',2,74,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10315,'ISLAT',4,'1996-9-26','1996-10-24','1996-10-3',2,41,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10316,'RATTC',1,'1996-9-27','1996-10-25','1996-10-8',3,150,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10317,'LONEP',6,'1996-9-30','1996-10-28','1996-10-10',1,12,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10318,'ISLAT',8,'1996-10-1','1996-10-29','1996-10-4',2,4,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10319,'TORTU',7,'1996-10-2','1996-10-30','1996-10-11',3,64,'Tortuga Restaurante','Avda. Azteca 123','México D.F.',NULL,'05033','Mexico');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10320,'WARTH',5,'1996-10-3','1996-10-17','1996-10-18',3,34,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10321,'ISLAT',3,'1996-10-3','1996-10-31','1996-10-11',2,3,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10322,'PERIC',7,'1996-10-4','1996-11-1','1996-10-23',3,0,'Pericles Comidas clásicas','Calle Dr. Jorge Cash 321','México D.F.',NULL,'05033','Mexico');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10323,'KOENE',4,'1996-10-7','1996-11-4','1996-10-14',1,4,'Königlich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10324,'SAVEA',9,'1996-10-8','1996-11-5','1996-10-10',1,214,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10325,'KOENE',1,'1996-10-9','1996-10-23','1996-10-14',3,64,'Königlich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10326,'BOLID',4,'1996-10-10','1996-11-7','1996-10-14',2,77,'Bólido Comidas preparadas','C/ Araquil, 67','Madrid',NULL,'28023','Spain');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10327,'FOLKO',2,'1996-10-11','1996-11-8','1996-10-14',1,63,'Folk och fä HB','Åkergatan 24','Bräcke',NULL,'S-844 67','Sweden');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10328,'FURIB',4,'1996-10-14','1996-11-11','1996-10-17',3,87,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10329,'SPLIR',4,'1996-10-15','1996-11-26','1996-10-23',2,191,'Split Rail Beer and Ale','P.O. Box 555','Lander','WY','82520','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10330,'LILAS',3,'1996-10-16','1996-11-13','1996-10-28',1,12,'LILA-Supermercado','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10331,'BONAP',9,'1996-10-16','1996-11-27','1996-10-21',1,10,'Bon app','12, rue des Bouchers','Marseille',NULL,'13008','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10332,'MEREP',3,'1996-10-17','1996-11-28','1996-10-28',2,52,'Mère Paillarde','43 rue St. Laurent','Montréal','Québec','H1J 1C3','Canada');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10333,'WARTH',5,'1996-10-18','1996-11-25','1996-10-25',3,0,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10334,'VICTE',8,'1996-10-21','1996-11-18','1996-10-28',2,8,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10335,'HUNGO',7,'1996-10-22','1996-11-19','1996-10-24',2,42,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10336,'PRINI',7,'1996-10-23','1996-11-20','1996-10-25',2,15,'Princesa Isabel Vinhos','Estrada da saúde n. 58','Lisboa',NULL,'1756','Portugal');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10337,'FRANK',4,'1996-10-24','1996-11-21','1996-10-29',3,108,'Frankenversand','Berliner Platz 43','München',NULL,'80805','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10338,'OLDWO',4,'1996-10-25','1996-11-22','1996-10-29',3,84,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10339,'MEREP',2,'1996-10-28','1996-11-25','1996-11-4',2,15,'Mère Paillarde','43 rue St. Laurent','Montréal','Québec','H1J 1C3','Canada');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10340,'BONAP',1,'1996-10-29','1996-11-26','1996-11-8',3,166,'Bon app','12, rue des Bouchers','Marseille',NULL,'13008','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10341,'SIMOB',7,'1996-10-29','1996-11-26','1996-11-5',3,26,'Simons bistro','Vinbæltet 34','Kobenhavn',NULL,'1734','Denmark');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10342,'FRANK',4,'1996-10-30','1996-11-13','1996-11-4',2,54,'Frankenversand','Berliner Platz 43','München',NULL,'80805','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10343,'LEHMS',4,'1996-10-31','1996-11-28','1996-11-3',1,110,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10344,'WHITC',4,'1996-11-1','1996-11-29','1996-11-5',2,23,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10345,'QUICK',2,'1996-11-4','1996-12-2','1996-11-11',2,249,'QUICK-Stop','Taucherstraße 10','Cunewalde',NULL,'01307','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10346,'RATTC',3,'1996-11-5','1996-12-17','1996-11-8',3,142,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10347,'FAMIA',4,'1996-11-6','1996-12-4','1996-11-8',3,3,'Familia Arquibaldo','Rua Orós, 92','Sao Paulo','SP','05442-030','Brazil');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10348,'WANDK',4,'1996-11-7','1996-12-5','1996-11-15',2,0,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10349,'SPLIR',7,'1996-11-8','1996-12-6','1996-11-15',1,8,'Split Rail Beer and Ale','P.O. Box 555','Lander','WY','82520','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10350,'LAMAI',6,'1996-11-11','1996-12-9','1996-12-3',2,64,'La maison d''Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10351,'ERNSH',1,'1996-11-11','1996-12-9','1996-11-20',1,162,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10352,'FURIB',3,'1996-11-12','1996-11-26','1996-11-18',3,1,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10353,'POCCO',7,'1996-11-13','1996-12-11','1996-11-25',3,360,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10354,'PERIC',8,'1996-11-14','1996-12-12','1996-11-20',3,53,'Pericles Comidas clásicas','Calle Dr. Jorge Cash 321','México D.F.',NULL,'05033','Mexico');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10355,'AROUT',6,'1996-11-15','1996-12-13','1996-11-20',1,41,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10356,'WANDK',6,'1996-11-18','1996-12-16','1996-11-27',2,36,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10357,'LILAS',1,'1996-11-19','1996-12-17','1996-12-2',3,34,'LILA-Supermercado','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10358,'LAMAI',5,'1996-11-20','1996-12-18','1996-11-27',1,19,'La maison d''Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10359,'SEVES',5,'1996-11-21','1996-12-19','1996-11-26',3,288,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10360,'BLONP',4,'1996-11-22','1996-12-20','1996-12-2',3,131,'Blondel père et fils','24, place Kléber','Strasbourg',NULL,'67000','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10361,'QUICK',1,'1996-11-20','1996-12-20','1996-12-3',2,183,'QUICK-Stop','Taucherstraße 10','Cunewalde',NULL,'01307','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10362,'BONAP',3,'1996-11-25','1996-12-23','1996-11-28',1,96,'Bon app','12, rue des Bouchers','Marseille',NULL,'13008','France');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10363,'DRACD',4,'1996-11-26','1996-12-24','1996-12-4',3,30,'Drachenblut Delikatessen','Walserweg 21','Aachen',NULL,'52066','Germany');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10364,'EASTC',1,'1996-11-26','1997-1-7','1996-12-4',1,71,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10365,'ANTON',3,'1996-11-27','1996-12-05','1996-12-2',2,22,'Antonio Moreno Taquería','Mataderos  2312','México D.F.',NULL,'05023','Mexico');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10366,'GALED',8,'1996-11-28','1997-1-9','1996-12-30',2,10,'Galería del gastronómo','Rambla de Cataluña, 23','Barcelona',NULL,'8022','Spain');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10367,'VAFFE',7,'1996-11-28','1996-12-26','1996-12-2',3,13,'Vaffeljernet','Smagsloget 45','Århus',NULL,'8200','Denmark');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10368,'ERNSH',2,'1996-11-29','1996-12-27','1996-12-2',2,101,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10369,'SPLIR',8,'1996-12-2','1996-12-30','1996-12-9',2,195,'Split Rail Beer and Ale','P.O. Box 555','Lander','WY','82520','USA');
insert into ordenes(id_orden, id_cliente, id_empleado, fecha_orden, fecha_requerida, fecha_envio, id_transporte, carga, envio_nombre, envio_direccion, envio_ciudad, envio_region, envio_codigo_postal, envio_pais)
values (10370,'CHOPS',6,'1996-12-3','1996-12-31','1996-12-27',2,1,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');

insert into categorias(id_categoria,nombre_categoria,descripcion)
values(1,'Beverages','Soft drinks, coffees, teas, beers, and ales');
insert into categorias(id_categoria,nombre_categoria,descripcion)
values(2,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings');
insert into categorias(id_categoria,nombre_categoria,descripcion)
values(3,'Confections','Desserts, candies, and sweet breads');
insert into categorias(id_categoria,nombre_categoria,descripcion)
values(4,'Dairy Products','Cheeses');
insert into categorias(id_categoria,nombre_categoria,descripcion)
values(5,'Grains/Cereals','Breads, crackers, pasta, and cereal');
insert into categorias(id_categoria,nombre_categoria,descripcion)
values(6,'Meat/Poultry','Prepared meats');
insert into categorias(id_categoria,nombre_categoria,descripcion)
values(7,'Produce','Dried fruit and bean curd');
insert into categorias(id_categoria,nombre_categoria,descripcion)
values(8,'Seafood','Seaweed and fish');

insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(1,'Exotic Liquids','Charlotte Cooper','Purchasing Manager','49 Gilbert St.','London',NULL,'EC1 4SD','UK','(171) 555-2222','1Exotic@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(2,'New Orleans Cajun Delights','Shelley Burke','Order Administrator','P.O. Box 78934','New Orleans','LA','70117','USA','(100) 555-4822','2New@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(3,'Grandma Kelly''s Homestead','Regina Murphy','Sales Representative','707 Oxford Rd.','Ann Arbor','MI','48104','USA','(313) 555-5735','3Grandma@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(4,'Tokyo Traders','Yoshi Nagase','Marketing Manager','9-8 Sekimai Musashino-shi','Tokyo',NULL,'100','Japan','(03) 3555-5011','4Tokyo@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra','Export Administrator','Calle del Rosal 4','Oviedo','Asturias','33007','Spain','(98) 598 76 54','5Cooperativa@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(6,'Mayumi''s','Mayumi Ohno','Marketing Representative','92 Setsuko Chuo-ku','Osaka',NULL,'545','Japan','(06) 431-7877','6Mayumi@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(7,'Pavlova, Ltd.','Ian Devling','Marketing Manager','74 Rose St. Moonie Ponds','Melbourne','Victoria','3058','Australia','(03) 444-2343','7Pavlova@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(8,'Specialty Biscuits, Ltd.','Peter Wilson','Sales Representative','29 King''s Way','Manchester',NULL,'M14 GSD','UK','(161) 555-4448','8Specialty@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(9,'PB Knäckebröd AB','Lars Peterson','Sales Agent','Kaloadagatan 13','Göteborg',NULL,'S-345 67','Sweden','031-9876543','9PB@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(10,'Refrescos Americanas LTDA','Carlos Diaz','Marketing Manager','Av. das Americanas 12.890','Sao Paulo',NULL,'5442','Brazil','(11) 555 4640','10Refrescos@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(11,'Heli Süßwaren GmbH and Co. KG','Petra Winkler','Sales Manager','Tiergartenstraße 5','Berlin',NULL,'10785','Germany','(010) 9984510','11Heli@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(12,'Plutzer Lebensmittelgroßmärkte AG','Martin Bein','International Marketing Mgr.','Bogenallee 51','Frankfurt',NULL,'60439','Germany','(069) 992755','12Plutzer@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Coordinator Foreign Markets','Frahmredder 112a','Cuxhaven',NULL,'27478','Germany','(04721) 8713','13Nord@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(14,'Formaggi Fortini s.r.l.','Elio Rossi','Sales Representative','Viale Dante, 75','Ravenna',NULL,'48100','Italy','(0544) 60323','14Formaggi@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(15,'Norske Meierier','Beate Vileid','Marketing Manager','Hatlevegen 5','Sandvika',NULL,'1320','Norway','(0)2-953010','15Norske@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(16,'Bigfoot Breweries','Cheryl Saylor','Regional Account Rep.','3400 - 8th Avenue Suite 210','Bend','OR','97101','USA','(503) 555-9931','16Bigfoot@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(17,'Svensk Sjöföda AB','Michael Björn','Sales Representative','Brovallavägen 231','Stockholm',NULL,'S-123 45','Sweden','08-123 45 67','17Svensk@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(18,'Aux joyeux ecclésiastiques','Guylène Nodier','Sales Manager','203, Rue des Francs-Bourgeois','Paris',NULL,'75004','France','(1) 03.83.00.68','18Aux@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(19,'New England Seafood Cannery','Robb Merchant','Wholesale Account Agent','Order Processing Dept. 2100 Paul Revere Blvd.','Boston','MA','02134','USA','(617) 555-3267','19New@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(20,'Leka Trading','Chandra Leka','Owner','471 Serangoon Loop, Suite #402','Singapore',NULL,'0512','Singapore','555-8787','20Leka@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(21,'Lyngbysild','Niels Petersen','Sales Manager','Lyngbysild Fiskebakken 10','Lyngby',NULL,'2800','Denmark','43844108','21Lyngbysild@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(22,'Zaanse Snoepfabriek','Dirk Luchte','Accounting Manager','Verkoop Rijnweg 22','Zaandam',NULL,'9999 ZZ','Netherlands','(12345) 1212','22Zaanse@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(23,'Karkki Oy','Anne Heikkonen','Product Manager','Valtakatu 12','Lappeenranta',NULL,'53120','Finland','(953) 10956','23Karkki@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(24,'G''day, Mate','Wendy Mackenzie','Sales Representative','170 Prince Edward Parade Hunter''s Hill','Sydney','NSW','2042','Australia','(02) 555-5914','24G@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(25,'Ma Maison','Jean-Guy Lauzon','Marketing Manager','2960 Rue St. Laurent','Montréal','Québec','H1J 1C3','Canada','(514) 555-9022','25Ma@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Order Administrator','Via dei Gelsomini, 153','Salerno',NULL,'84100','Italy','(089) 6547665','26Pasta@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(27,'Escargots Nouveaux','Marie Delamare','Sales Manager','22, rue H. Voiron','Montceau',NULL,'71300','France','85.57.00.07','27Escargots@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(28,'Gai pâturage','Eliane Noz','Sales Representative','Bat. B 3, rue des Alpes','Annecy',NULL,'74000','France','38.76.98.06','28Gai@mail.com');
insert into proveedores(id_proveedor,nombre_compania,nombre_contacto,titulo_contacto,direccion,ciudad,region,codigo_postal,pais,telefono,mail)
values(29,'Forêts d''érables','Chantal Goulet','Accounting Manager','148 rue Chasseur','Ste-Hyacinthe','Québec','J2S 7S8','Canada','(514) 555-2955','29Forêts@mail.com');

insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(1,'Chai',1,1,'10 boxes x 20 bags',18,50,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(2,'Chang',1,1,'24 - 12 oz bottles',19,17,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10,13,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(4,'Chef Anton''s Cajun Seasoning',2,2,'48 - 6 oz jars',22,53,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(5,'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21,0,1);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(6,'Grandma''s Boysenberry Spread',3,2,'12 - 8 oz jars',25,120,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(7,'Uncle Bob''s Organic Dried Pears',3,7,'12 - 1 lb pkgs.',30,15,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(8,'Northwoods Cranberry Sauce',3,2,'12 - 12 oz jars',40,6,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(9,'Mishi Kobe Niku',4,6,'18 - 500 g pkgs.',97,29,1);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(10,'Ikura',4,8,'12 - 200 ml jars',31,31,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(11,'Queso Cabrales',5,4,'1 kg pkg.',21,22,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(12,'Queso Manchego La Pastora',5,4,'10 - 500 g pkgs.',38,86,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(13,'Konbu',6,8,'2 kg box',6,24,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(14,'Tofu',6,7,'40 - 100 g pkgs.',23,35,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(15,'Genen Shouyu',6,2,'24 - 250 ml bottles',15,39,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(16,'Pavlova',7,3,'32 - 500 g boxes',17,29,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(17,'Alice Mutton',7,6,'20 - 1 kg tins',39,0,1);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(18,'Carnarvon Tigers',7,8,'16 kg pkg.',62,42,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(19,'Teatime Chocolate Biscuits',8,3,'10 boxes x 12 pieces',9,25,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(20,'Sir Rodney''s Marmalade',8,3,'30 gift boxes',81,40,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(21,'Sir Rodney''s Scones',8,3,'24 pkgs. x 4 pieces',10,3,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(22,'Gustaf''s Knäckebröd',9,5,'24 - 500 g pkgs.',21,104,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(23,'Tunnbröd',9,5,'12 - 250 g pkgs.',9,61,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(24,'Guaraná Fantástica',10,1,'12 - 355 ml cans',4,20,1);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(25,'NuNuCa Nuß-Nougat-Creme',11,3,'20 - 450 g glasses',14,76,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(26,'Gumbär Gummibärchen',11,3,'100 - 250 g bags',31,15,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(27,'Schoggi Schokolade',11,3,'100 - 100 g pieces',43,49,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(28,'Rössle Sauerkraut',12,7,'25 - 825 g cans',45,26,1);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(29,'Thüringer Rostbratwurst',12,6,'50 bags x 30 sausgs.',123,0,1);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(30,'Nord-Ost Matjeshering',13,8,'10 - 200 g glasses',25,10,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(31,'Gorgonzola Telino',14,4,'12 - 100 g pkgs',12,0,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(32,'Mascarpone Fabioli',14,4,'24 - 200 g pkgs.',32,9,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(33,'Geitost',15,4,'500 g',2,112,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(34,'Sasquatch Ale',16,1,'24 - 12 oz bottles',14,111,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(35,'Steeleye Stout',16,1,'24 - 12 oz bottles',18,20,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(36,'Inlagd Sill',17,8,'24 - 250 g  jars',19,112,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(37,'Gravad lax',17,8,'12 - 500 g pkgs.',26,11,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(38,'Côte de Blaye',18,1,'12 - 75 cl bottles',263,17,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(39,'Chartreuse verte',18,1,'750 cc per bottle',18,69,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(40,'Boston Crab Meat',19,8,'24 - 4 oz tins',18,123,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(41,'Jack''s New England Clam Chowder',19,8,'12 - 12 oz cans',9,85,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(42,'Singaporean Hokkien Fried Mee',20,5,'32 - 1 kg pkgs.',14,26,1);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(43,'Ipoh Coffee',20,1,'16 - 500 g tins',46,17,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(44,'Gula Malacca',20,2,'20 - 2 kg bags',19,27,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(45,'Rogede sild',21,8,'1k pkg.',9,5,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(46,'Spegesild',21,8,'4 - 450 g glasses',12,95,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(47,'Zaanse koeken',22,3,'10 - 4 oz boxes',9,36,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(48,'Chocolade',22,3,'10 pkgs.',12,15,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(49,'Maxilaku',23,3,'24 - 50 g pkgs.',20,10,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(50,'Valkoinen suklaa',23,3,'12 - 100 g bars',16,65,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(51,'Manjimup Dried Apples',24,7,'50 - 300 g pkgs.',53,20,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(52,'Filo Mix',24,5,'16 - 2 kg boxes',7,38,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(53,'Perth Pasties',24,6,'48 pieces',32,0,1);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(54,'Tourtière',25,6,'16 pies',7,21,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(55,'Pâté chinois',25,6,'24 boxes x 2 pies',24,115,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(56,'Gnocchi di nonna Alice',26,5,'24 - 250 g pkgs.',38,21,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(57,'Ravioli Angelo',26,5,'24 - 250 g pkgs.',19,36,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(58,'Escargots de Bourgogne',27,8,'24 pieces',13,62,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(59,'Raclette Courdavault',28,4,'5 kg pkg.',55,79,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(60,'Camembert Pierrot',28,4,'15 - 300 g rounds',34,19,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(61,'Sirop d''érable',29,2,'24 - 500 ml bottles',28,113,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(62,'Tarte au sucre',29,3,'48 pies',49,17,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(63,'Vegie-spread',7,2,'15 - 625 g jars',43,24,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(64,'Wimmers gute Semmelknödel',12,5,'20 bags x 4 pieces',33,22,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(65,'Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles',21,76,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(66,'Louisiana Hot Spiced Okra',2,2,'24 - 8 oz jars',17,4,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(67,'Laughing Lumberjack Lager',16,1,'24 - 12 oz bottles',14,52,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(68,'Scottish Longbreads',8,3,'10 boxes x 8 pieces',12,6,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(69,'Gudbrandsdalsost',15,4,'10 kg pkg.',36,26,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(70,'Outback Lager',7,1,'24 - 355 ml bottles',15,15,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(71,'Flotemysost',15,4,'10 - 500 g pkgs.',21,26,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(72,'Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',34,14,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(73,'Röd Kaviar',17,8,'24 - 150 g jars',15,101,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(74,'Longlife Tofu',4,7,'5 kg pkg.',10,4,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(75,'Rhönbräu Klosterbier',12,1,'24 - 0.5 l bottles',7,125,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(76,'Lakkalikööri',23,1,'500 ml',18,57,0);
insert into productos(id_producto, nombre_producto, id_proveedor, id_categoria, cantidad_por_unidad, precio_unitario, unidades_en_stock, discontinuado)
VALUES(77,'Original Frankfurter grüne Soße',12,2,'12 boxes',13,32,0);

insert into detalle_orden values(10248,11,14,12,0);
insert into detalle_orden values(10248,42,9,10,0);
insert into detalle_orden values(10248,72,34,5,0);
insert into detalle_orden values(10249,14,18,9,0);
insert into detalle_orden values(10249,51,42,40,0);
insert into detalle_orden values(10250,41,7,10,0);
insert into detalle_orden values(10250,51,42,35,0.15);
insert into detalle_orden values(10250,65,16,15,0.15);
insert into detalle_orden values(10251,22,16,6,0.05);
insert into detalle_orden values(10251,57,15,15,0.05);
insert into detalle_orden values(10251,65,16,20,0);
insert into detalle_orden values(10252,20,64,40,0.05);
insert into detalle_orden values(10252,33,2,25,0.05);
insert into detalle_orden values(10252,60,27,40,0);
insert into detalle_orden values(10253,31,10,20,0);
insert into detalle_orden values(10253,39,14,42,0);
insert into detalle_orden values(10253,49,16,40,0);
insert into detalle_orden values(10254,24,3,15,0.15);
insert into detalle_orden values(10254,55,19,21,0.15);
insert into detalle_orden values(10254,74,8,21,0);
insert into detalle_orden values(10255,2,15,20,0);
insert into detalle_orden values(10255,16,13,35,0);
insert into detalle_orden values(10255,36,15,25,0);
insert into detalle_orden values(10255,59,44,30,0);
insert into detalle_orden values(10256,53,26,15,0);
insert into detalle_orden values(10256,77,10,12,0);
insert into detalle_orden values(10257,27,35,25,0);
insert into detalle_orden values(10257,39,14,6,0);
insert into detalle_orden values(10257,77,10,15,0);
insert into detalle_orden values(10258,2,15,50,0.2);
insert into detalle_orden values(10258,5,17,65,0.2);
insert into detalle_orden values(10258,32,25,6,0.2);
insert into detalle_orden values(10259,21,8,10,0);
insert into detalle_orden values(10259,37,20,1,0);
insert into detalle_orden values(10260,41,7,16,0.25);
insert into detalle_orden values(10260,57,15,50,0);
insert into detalle_orden values(10260,62,39,15,0.25);
insert into detalle_orden values(10260,70,12,21,0.25);
insert into detalle_orden values(10261,21,8,20,0);
insert into detalle_orden values(10261,35,14,20,0);
insert into detalle_orden values(10262,5,17,12,0.2);
insert into detalle_orden values(10262,7,24,15,0);
insert into detalle_orden values(10262,56,30,2,0);
insert into detalle_orden values(10263,16,13,60,0.25);
insert into detalle_orden values(10263,24,3,28,0);
insert into detalle_orden values(10263,30,20,60,0.25);
insert into detalle_orden values(10263,74,8,36,0.25);
insert into detalle_orden values(10264,2,15,35,0);
insert into detalle_orden values(10264,41,7,25,0.15);
insert into detalle_orden values(10265,17,31,30,0);
insert into detalle_orden values(10265,70,12,20,0);
insert into detalle_orden values(10266,12,30,12,0.05);
insert into detalle_orden values(10267,40,14,50,0);
insert into detalle_orden values(10267,59,44,70,0.15);
insert into detalle_orden values(10267,76,14,15,0.15);
insert into detalle_orden values(10268,29,99,10,0);
insert into detalle_orden values(10268,72,27,4,0);
insert into detalle_orden values(10269,33,2,60,0.05);
insert into detalle_orden values(10269,72,27,20,0.05);
insert into detalle_orden values(10270,36,15,30,0);
insert into detalle_orden values(10270,43,36,25,0);
insert into detalle_orden values(10271,33,2,24,0);
insert into detalle_orden values(10272,20,64,6,0);
insert into detalle_orden values(10272,31,10,40,0);
insert into detalle_orden values(10272,72,27,24,0);
insert into detalle_orden values(10273,10,24,24,0.05);
insert into detalle_orden values(10273,31,10,15,0.05);
insert into detalle_orden values(10273,33,2,20,0);
insert into detalle_orden values(10273,40,14,60,0.05);
insert into detalle_orden values(10273,76,14,33,0.05);
insert into detalle_orden values(10274,71,17,20,0);
insert into detalle_orden values(10274,72,27,7,0);
insert into detalle_orden values(10275,24,3,12,0.05);
insert into detalle_orden values(10275,59,44,6,0.05);
insert into detalle_orden values(10276,10,24,15,0);
insert into detalle_orden values(10276,13,4,10,0);
insert into detalle_orden values(10277,28,36,20,0);
insert into detalle_orden values(10277,62,39,12,0);
insert into detalle_orden values(10278,44,15,16,0);
insert into detalle_orden values(10278,59,44,15,0);
insert into detalle_orden values(10278,63,35,8,0);
insert into detalle_orden values(10278,73,12,25,0);
insert into detalle_orden values(10279,17,31,15,0.25);
insert into detalle_orden values(10280,24,3,12,0);
insert into detalle_orden values(10280,55,19,20,0);
insert into detalle_orden values(10280,75,6,30,0);
insert into detalle_orden values(10281,19,7,1,0);
insert into detalle_orden values(10281,24,3,6,0);
insert into detalle_orden values(10281,35,14,4,0);
insert into detalle_orden values(10282,30,20,6,0);
insert into detalle_orden values(10282,57,15,2,0);
insert into detalle_orden values(10283,15,12,20,0);
insert into detalle_orden values(10283,19,7,18,0);
insert into detalle_orden values(10283,60,27,35,0);
insert into detalle_orden values(10283,72,27,3,0);
insert into detalle_orden values(10284,27,35,15,0.25);
insert into detalle_orden values(10284,44,15,21,0);
insert into detalle_orden values(10284,60,27,20,0.25);
insert into detalle_orden values(10284,67,11,5,0.25);
insert into detalle_orden values(10285,1,14,45,0.2);
insert into detalle_orden values(10285,40,14,40,0.2);
insert into detalle_orden values(10285,53,26,36,0.2);
insert into detalle_orden values(10286,35,14,100,0);
insert into detalle_orden values(10286,62,39,40,0);
insert into detalle_orden values(10287,16,13,40,0.15);
insert into detalle_orden values(10287,34,11,20,0);
insert into detalle_orden values(10287,46,9,15,0.15);
insert into detalle_orden values(10288,54,5,10,0.1);
insert into detalle_orden values(10288,68,10,3,0.1);
insert into detalle_orden values(10289,3,8,30,0);
insert into detalle_orden values(10289,64,26,9,0);
insert into detalle_orden values(10290,5,17,20,0);
insert into detalle_orden values(10290,29,99,15,0);
insert into detalle_orden values(10290,49,16,15,0);
insert into detalle_orden values(10290,77,10,10,0);
insert into detalle_orden values(10291,13,4,20,0.1);
insert into detalle_orden values(10291,44,15,24,0.1);
insert into detalle_orden values(10291,51,42,2,0.1);
insert into detalle_orden values(10292,20,64,20,0);
insert into detalle_orden values(10293,18,50,12,0);
insert into detalle_orden values(10293,24,3,10,0);
insert into detalle_orden values(10293,63,35,5,0);
insert into detalle_orden values(10293,75,6,6,0);
insert into detalle_orden values(10294,1,14,18,0);
insert into detalle_orden values(10294,17,31,15,0);
insert into detalle_orden values(10294,43,36,15,0);
insert into detalle_orden values(10294,60,27,21,0);
insert into detalle_orden values(10294,75,6,6,0);
insert into detalle_orden values(10295,56,30,4,0);
insert into detalle_orden values(10296,11,16,12,0);
insert into detalle_orden values(10296,16,13,30,0);
insert into detalle_orden values(10296,69,28,15,0);
insert into detalle_orden values(10297,39,14,60,0);
insert into detalle_orden values(10297,72,27,20,0);
insert into detalle_orden values(10298,2,15,40,0);
insert into detalle_orden values(10298,36,15,40,0.25);
insert into detalle_orden values(10298,59,44,30,0.25);
insert into detalle_orden values(10298,62,39,15,0);
insert into detalle_orden values(10299,19,7,15,0);
insert into detalle_orden values(10299,70,12,20,0);
insert into detalle_orden values(10300,66,13,30,0);
insert into detalle_orden values(10300,68,10,20,0);
insert into detalle_orden values(10301,40,14,10,0);
insert into detalle_orden values(10301,56,30,20,0);
insert into detalle_orden values(10302,17,31,40,0);
insert into detalle_orden values(10302,28,36,28,0);
insert into detalle_orden values(10302,43,36,12,0);
insert into detalle_orden values(10303,40,14,40,0.1);
insert into detalle_orden values(10303,65,16,30,0.1);
insert into detalle_orden values(10303,68,10,15,0.1);
insert into detalle_orden values(10304,49,16,30,0);
insert into detalle_orden values(10304,59,44,10,0);
insert into detalle_orden values(10304,71,17,2,0);
insert into detalle_orden values(10305,18,50,25,0.1);
insert into detalle_orden values(10305,29,99,25,0.1);
insert into detalle_orden values(10305,39,14,30,0.1);
insert into detalle_orden values(10306,30,20,10,0);
insert into detalle_orden values(10306,53,26,10,0);
insert into detalle_orden values(10306,54,5,5,0);
insert into detalle_orden values(10307,62,39,10,0);
insert into detalle_orden values(10307,68,10,3,0);
insert into detalle_orden values(10308,69,28,1,0);
insert into detalle_orden values(10308,70,12,5,0);
insert into detalle_orden values(10309,4,17,20,0);
insert into detalle_orden values(10309,6,20,30,0);
insert into detalle_orden values(10309,42,11,2,0);
insert into detalle_orden values(10309,43,36,20,0);
insert into detalle_orden values(10309,71,17,3,0);
insert into detalle_orden values(10310,16,13,10,0);
insert into detalle_orden values(10310,62,39,5,0);
insert into detalle_orden values(10311,42,11,6,0);
insert into detalle_orden values(10311,69,28,7,0);
insert into detalle_orden values(10312,28,36,4,0);
insert into detalle_orden values(10312,43,36,24,0);
insert into detalle_orden values(10312,53,26,20,0);
insert into detalle_orden values(10312,75,6,10,0);
insert into detalle_orden values(10313,36,15,12,0);
insert into detalle_orden values(10314,32,25,40,0.1);
insert into detalle_orden values(10314,58,10,30,0.1);
insert into detalle_orden values(10314,62,39,25,0.1);
insert into detalle_orden values(10315,34,11,14,0);
insert into detalle_orden values(10315,70,12,30,0);
insert into detalle_orden values(10316,41,7,10,0);
insert into detalle_orden values(10316,62,39,70,0);
insert into detalle_orden values(10317,1,14,20,0);
insert into detalle_orden values(10318,41,7,20,0);
insert into detalle_orden values(10318,76,14,6,0);
insert into detalle_orden values(10319,17,31,8,0);
insert into detalle_orden values(10319,28,36,14,0);
insert into detalle_orden values(10319,76,14,30,0);
insert into detalle_orden values(10320,71,17,30,0);
insert into detalle_orden values(10321,35,14,10,0);
insert into detalle_orden values(10322,52,5,20,0);
insert into detalle_orden values(10323,15,12,5,0);
insert into detalle_orden values(10323,25,11,4,0);
insert into detalle_orden values(10323,39,14,4,0);
insert into detalle_orden values(10324,16,13,21,0.15);
insert into detalle_orden values(10324,35,14,70,0.15);
insert into detalle_orden values(10324,46,9,30,0);
insert into detalle_orden values(10324,59,44,40,0.15);
insert into detalle_orden values(10324,63,35,80,0.15);
insert into detalle_orden values(10325,6,20,6,0);
insert into detalle_orden values(10325,13,4,12,0);
insert into detalle_orden values(10325,14,18,9,0);
insert into detalle_orden values(10325,31,10,4,0);
insert into detalle_orden values(10325,72,27,40,0);
insert into detalle_orden values(10326,4,17,24,0);
insert into detalle_orden values(10326,57,15,16,0);
insert into detalle_orden values(10326,75,6,50,0);
insert into detalle_orden values(10327,2,15,25,0.2);
insert into detalle_orden values(10327,11,16,50,0.2);
insert into detalle_orden values(10327,30,20,35,0.2);
insert into detalle_orden values(10327,58,10,30,0.2);
insert into detalle_orden values(10328,59,44,9,0);
insert into detalle_orden values(10328,65,16,40,0);
insert into detalle_orden values(10328,68,10,10,0);
insert into detalle_orden values(10329,19,7,10,0.05);
insert into detalle_orden values(10329,30,20,8,0.05);
insert into detalle_orden values(10329,38,210,20,0.05);
insert into detalle_orden values(10329,56,30,12,0.05);
insert into detalle_orden values(10330,26,24,50,0.15);
insert into detalle_orden values(10330,72,27,25,0.15);
insert into detalle_orden values(10331,54,5,15,0);
insert into detalle_orden values(10332,18,50,40,0.2);
insert into detalle_orden values(10332,42,11,10,0.2);
insert into detalle_orden values(10332,47,7,16,0.2);
insert into detalle_orden values(10333,14,18,10,0);
insert into detalle_orden values(10333,21,8,10,0.1);
insert into detalle_orden values(10333,71,17,40,0.1);
insert into detalle_orden values(10334,52,5,8,0);
insert into detalle_orden values(10334,68,10,10,0);
insert into detalle_orden values(10335,2,15,7,0.2);
insert into detalle_orden values(10335,31,10,25,0.2);
insert into detalle_orden values(10335,32,25,6,0.2);
insert into detalle_orden values(10335,51,42,48,0.2);
insert into detalle_orden values(10336,4,17,18,0.1);
insert into detalle_orden values(10337,23,7,40,0);
insert into detalle_orden values(10337,26,24,24,0);
insert into detalle_orden values(10337,36,15,20,0);
insert into detalle_orden values(10337,37,20,28,0);
insert into detalle_orden values(10337,72,27,25,0);
insert into detalle_orden values(10338,17,31,20,0);
insert into detalle_orden values(10338,30,20,15,0);
insert into detalle_orden values(10339,4,17,10,0);
insert into detalle_orden values(10339,17,31,70,0.05);
insert into detalle_orden values(10339,62,39,28,0);
insert into detalle_orden values(10340,18,50,20,0.05);
insert into detalle_orden values(10340,41,7,12,0.05);
insert into detalle_orden values(10340,43,36,40,0.05);
insert into detalle_orden values(10341,33,2,8,0);
insert into detalle_orden values(10341,59,44,9,0.15);
insert into detalle_orden values(10342,2,15,24,0.2);
insert into detalle_orden values(10342,31,10,56,0.2);
insert into detalle_orden values(10342,36,15,40,0.2);
insert into detalle_orden values(10342,55,19,40,0.2);
insert into detalle_orden values(10343,64,26,50,0);
insert into detalle_orden values(10343,68,10,4,0.05);
insert into detalle_orden values(10343,76,14,15,0);
insert into detalle_orden values(10344,4,17,35,0);
insert into detalle_orden values(10344,8,32,70,0.25);
insert into detalle_orden values(10345,8,32,70,0);
insert into detalle_orden values(10345,19,7,80,0);
insert into detalle_orden values(10345,42,11,9,0);
insert into detalle_orden values(10346,17,31,36,0.1);
insert into detalle_orden values(10346,56,30,20,0);
insert into detalle_orden values(10347,25,11,10,0);
insert into detalle_orden values(10347,39,14,50,0.15);
insert into detalle_orden values(10347,40,14,4,0);
insert into detalle_orden values(10347,75,6,6,0.15);
insert into detalle_orden values(10348,1,14,15,0.15);
insert into detalle_orden values(10348,23,7,25,0);
insert into detalle_orden values(10349,54,5,24,0);
insert into detalle_orden values(10350,50,13,15,0.1);
insert into detalle_orden values(10350,69,28,18,0.1);
insert into detalle_orden values(10351,38,210,20,0.05);
insert into detalle_orden values(10351,41,7,13,0);
insert into detalle_orden values(10351,44,15,77,0.05);
insert into detalle_orden values(10351,65,16,10,0.05);
insert into detalle_orden values(10352,24,3,10,0);
insert into detalle_orden values(10352,54,5,20,0.15);
insert into detalle_orden values(10353,11,16,12,0.2);
insert into detalle_orden values(10353,38,210,50,0.2);
insert into detalle_orden values(10354,1,14,12,0);
insert into detalle_orden values(10354,29,99,4,0);
insert into detalle_orden values(10355,24,3,25,0);
insert into detalle_orden values(10355,57,15,25,0);
insert into detalle_orden values(10356,31,10,30,0);
insert into detalle_orden values(10356,55,19,12,0);
insert into detalle_orden values(10356,69,28,20,0);
insert into detalle_orden values(10357,10,24,30,0.2);
insert into detalle_orden values(10357,26,24,16,0);
insert into detalle_orden values(10357,60,27,8,0.2);
insert into detalle_orden values(10358,24,3,10,0.05);
insert into detalle_orden values(10358,34,11,10,0.05);
insert into detalle_orden values(10358,36,15,20,0.05);
insert into detalle_orden values(10359,16,13,56,0.05);
insert into detalle_orden values(10359,31,10,70,0.05);
insert into detalle_orden values(10359,60,27,80,0.05);
insert into detalle_orden values(10360,28,36,30,0);
insert into detalle_orden values(10360,29,99,35,0);
insert into detalle_orden values(10360,38,210,10,0);
insert into detalle_orden values(10360,49,16,35,0);
insert into detalle_orden values(10360,54,5,28,0);
insert into detalle_orden values(10361,39,14,54,0.1);
insert into detalle_orden values(10361,60,27,55,0.1);
insert into detalle_orden values(10362,25,11,50,0);
insert into detalle_orden values(10362,51,42,20,0);
insert into detalle_orden values(10362,54,5,24,0);
insert into detalle_orden values(10363,31,10,20,0);
insert into detalle_orden values(10363,75,6,12,0);
insert into detalle_orden values(10363,76,14,12,0);
insert into detalle_orden values(10364,69,28,30,0);
insert into detalle_orden values(10364,71,17,5,0);
insert into detalle_orden values(10365,11,16,24,0);
insert into detalle_orden values(10366,65,16,5,0);
insert into detalle_orden values(10366,77,10,5,0);
insert into detalle_orden values(10367,34,11,36,0);
insert into detalle_orden values(10367,54,5,18,0);
insert into detalle_orden values(10367,65,16,15,0);
insert into detalle_orden values(10367,77,10,7,0);
insert into detalle_orden values(10368,21,8,5,0.1);
insert into detalle_orden values(10368,28,36,13,0.1);
insert into detalle_orden values(10368,57,15,25,0);
insert into detalle_orden values(10368,64,26,35,0.1);
insert into detalle_orden values(10369,29,99,20,0);
insert into detalle_orden values(10369,56,30,18,0.25);
insert into detalle_orden values(10370,1,14,15,0.15);
insert into detalle_orden values(10370,64,26,30,0);
insert into detalle_orden values(10370,74,8,20,0.15);