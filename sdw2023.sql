create database viagens;
use viagens;

create table usuarios (
	id int,
    nome varchar(70) not null comment 'Nome do Usuário',
    email varchar(50) not null unique comment 'E-mail do usuário',
    endereco varchar(100) not null comment 'Endereço do usuário',
    data_nascimento date not null comment 'Data de nascimento do usuário',
    primary key(id)
);

create table destino (
	id int,
    nome varchar(70) not null unique comment 'Nome do Usuário',
    descricao varchar(255) not null comment 'Descrição do destino',
    primary key(id)
    );
    
create table reserva (
	id int comment 'Identificador único da reserva',
    id_usuario int comment 'Referência ao ID do usuário que fez a reserva',
    id_destino int comment 'Referência ao ID do destino da reserva',
    data date comment 'Data da reserva',
    status varchar(50) default 'pendente' comment 'Status da reserva (confirmada, pendente, cancelada, etc.)'
);
    
insert into usuarios (id, nome, email, endereco, data_nascimento) values (1, "Paulo Demetrio", "paulodemetrio@outlook.com", "Rua Manuel Ribeiro, 216, vila vitória, SP", "1982-11-26");
insert into usuarios (id, nome, email, endereco, data_nascimento) values (2, "Ricardo Luis", "ricardorocky@gmail.com", "Rua do Amaro, 199, jardim europa, SP", "1981-01-27");
insert into usuarios (id, nome, email, endereco, data_nascimento) values (3, "Meire Dantas", "meireoliv1986@gmail.com", "Rua gabriel beson dias, vila lucrecia, SP", "1986-01-19");

insert into destino (id, nome, descricao) values (1, "Praia da enseada", "Praia bonita e com mulheres gostosas");
insert into destino (id, nome, descricao) values (2, "Miami beach", "beach with a lot of stones");
insert into destino (id, nome, descricao) values (3, "vale do sol", "lugar bonito para a familia");

insert into reserva (id, id_usuario, id_destino, data, status) values (1, 1, 1, "2023-11-26", "pendente");
insert into reserva (id, id_usuario, id_destino, data, status) values (2, 2, 2, "2023-12-27", "confirmada");
insert into reserva (id, id_usuario, id_destino, data, status) values (3, 3, 3, "2024-01-28", "cancelada");

select * from usuarios where id = 1;
select * from usuarios where id = 1 or nome like "%Ricardo%";
select * from usuarios where id = 1 and nome like "%Paulo%";



