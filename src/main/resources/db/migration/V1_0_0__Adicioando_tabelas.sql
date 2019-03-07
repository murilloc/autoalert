
create table  tipo_vulnerabilidade (
    id int(11) auto_increment,
    nome varchar(80) not null,
    modelo_mensagem text not null,
    constraint tipo_vulnerabilidade_pk primary key (id)
);

create unique index tipo_vulnerabilidade_nome_uindex	on tipo_vulnerabilidade (nome);

create table vulnerabilidade
(
	id int (11) auto_increment,
	ip varchar(15) not null,
	asn varchar(10) not null,
	status varchar(20) not null,
	data_hora datetime not null,
	resultado varchar(50),
	constraint vulnerabilidade_pk
		primary key (id)
);


create table cliente (
    id int(11) auto_increment,
    nome varchar(150),
    email varchar(50),
    ip varchar(15),
    constraint cliente_pk primary key (id)
);

create unique index cliente_ip_uindex	on cliente (ip);

create table aviso
(
	id int(11) auto_increment,
	data_hora datetime not null,
	status varchar(15) not null,
	constraint aviso_pk
		primary key (id)
);