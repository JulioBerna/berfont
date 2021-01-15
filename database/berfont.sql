CREATE DATABASE berfont;
USE berfont;

CREATE TABLE usuarios(
    id          INT(255) auto_increment NOT NULL, 
    nombre      VARCHAR(100) NOT NULL,
    apellidos   VARCHAR(100) NOT NULL,
    direccion   VARCHAR(255) NOT NULL,
    localidad   VARCHAR(255) NOT NULL,
    email       VARCHAR(255) NOT NULL,
    password    VARCHAR(255) NOT NULL,
    rol         VARCHAR(25),
    CONSTRAINT pk_usuarios PRIMARY KEY(id),
    CONSTRAINT uq_email UNIQUE(email)
) ENGINE=InnoDb;

INSERT INTO usuarios VALUES (NULL, 'Julio', 'Berna Sánchez', 'Horno', 'Épila', 'jbernas@uoc.edu', '246','administrador');



CREATE TABLE secciones(
    id      INT(255) auto_increment NOT NULL,
    nombre  VARCHAR(100) NOT NULL,
    CONSTRAINT pk_secciones PRIMARY KEY(id)
) ENGINE=InnoDb;

INSERT INTO secciones VALUES (NULL, 'tour');
INSERT INTO secciones VALUES (NULL, 'multiaventura');
INSERT INTO secciones VALUES (NULL, 'tiro_arco');
INSERT INTO secciones VALUES (NULL, 'observación');



CREATE TABLE servicios(
    id          INT(255) auto_increment NOT NULL,
    seccion_id  INT(255) NOT NULL,
    nombre      VARCHAR(100) NOT NULL,
    descripcion text,
    precio      FLOAT(100,2) NOT NULL,
    oferta      VARCHAR(2),
    stock       INT(255) NOT NULL,
    fecha       DATE NOT NULL,
    imagen      VARCHAR(255),
    CONSTRAINT pk_servicios PRIMARY KEY(id),
    CONSTRAINT fk_servicio_seccion FOREIGN KEY (seccion_id) REFERENCES secciones(id)
)ENGINE=InnoDb;



CREATE TABLE reservas(
    id             INT(255) auto_increment NOT NULL,
    usuario_id     INT(255) NOT NULL,
    direccion      VARCHAR(255) NOT NULL,
    localidad      VARCHAR(100) NOT NULL,
    provincia      VARCHAR(100) NOT NULL,
    coste          FLOAT(200,2) NOT NULL,
    estado         VARCHAR(20) NOT NULL,
    fecha          DATE,
    hora           TIME,
    CONSTRAINT pk_reservas PRIMARY KEY(id),
    CONSTRAINT fk_reserva_usuario FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
)ENGINE=InnoDb;



CREATE TABLE detalles_reservas(
    id            INT(255) AUTO_INCREMENT NOT NULL,
    reserva_id    INT(255) NOT NULL,
    servicio_id   INT(255) NOT NULL,
    cantidad      INT(100) NOT NULL,
    CONSTRAINT pk_detalles_reservas PRIMARY KEY(id),
    CONSTRAINT fk_detalle_reserva FOREIGN KEY(reserva_id) REFERENCES reservas(id),
    CONSTRAINT fk_detalle_servicio FOREIGN KEY (servicio_id) REFERENCES servicios(id)
) ENGINE=InnoDb;
