ALTER TABLE vulnerabilidade
ADD COLUMN id_tipo INT(11) NULL AFTER resultado;

alter table vulnerabilidade add constraint fk_tipo_vulnerabilidade
foreign key(id_tipo)
references tipo_vulnerabilidade(id);



ALTER TABLE aviso
ADD COLUMN id_cliente INT(11) NULL AFTER status;

alter table aviso add constraint fk_aviso_cliente
foreign key(id_cliente)
references cliente(id);


ALTER TABLE aviso
ADD COLUMN id_vulnerabilidade INT(11) NULL AFTER id_cliente;

alter table aviso add constraint fk_aviso_vulnerabilidade
foreign key(id_vulnerabilidade)
references vulnerabilidade(id);