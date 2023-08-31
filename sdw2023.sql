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
insert into usuarios (id, nome, email, endereco, data_nascimento) values (4, "Maria das Graças", "gracadoavon@gmail.com", "Rua Acrópole, 122, Jardim do Estádio, SP", "1959-05-02");
insert into usuarios (id, nome, email, endereco, data_nascimento) values (5, "Ikki de Fênix", "avefenix@gmail.com", "Rua Rainha da morte, 666, Vila Hell, SP", "1966-06-06");

insert into destino (id, nome, descricao) values (1, "Praia da enseada", "Praia bonita e com mulheres gostosas");
insert into destino (id, nome, descricao) values (2, "Miami beach", "beach with a lot of stones");
insert into destino (id, nome, descricao) values (3, "vale do sol", "lugar bonito para a familia");
insert into destino (id, nome, descricao) values (4, "Ilha da Rainha da Morte", "The Hell");

insert into reserva (id, id_usuario, id_destino, data, status) values (1, 1, 1, "2023-11-26", "pendente");
insert into reserva (id, id_usuario, id_destino, data, status) values (2, 2, 2, "2023-12-27", "confirmada");
insert into reserva (id, id_usuario, id_destino, data, status) values (3, 3, 3, "2024-01-28", "cancelada");

# Algumas consultas como exemplo.

select * from usuarios;
select * from usuarios where id = 1;
select * from usuarios where id = 1 or nome like "%Ricardo%";
select * from usuarios where id = 1 and nome like "%Paulo%";

# Comando update para atualizar registros e delete para deletar registros

update usuarios
set email = 'josecaralhada@gmail.com'
where email = 'josebonifacil@gmail.com';

update usuarios
set data_nascimento = '1981-01-17'
where data_nascimento = '1981-01-27';

UPDATE usuarios
SET cidade = 'Santo Andre'
WHERE cidade = 'jardim europa';

UPDATE usuarios
SET cidade = 'Santo Andre'
WHERE cidade = 'vila vitória';

delete from usuarios
where nome = "José Bonifácio";

# comando para alterar a estrutura de uma tabela

alter table usuarios modify column endereco varchar(150);
alter table reserva modify column id INT auto_increment, add primary key (id);
alter table usuarios modify column id int auto_increment;
alter table destino modify column id int auto_increment;

# Adcionando chave estrangeira

alter table reserva
add constraint fk_reservas_usuarios
foreign key(id_usuario) references usuarios (id);

alter table reserva
add constraint fk_reservas_destino
foreign key(id_destino) references destino (id);

alter table reserva
add constraint fk_usuarios
foreign key (id_usuario) references usuarios (id)
on delete cascade;

# Normalização de dados. Separar campo endereço em rua, numero, cidade, estado etc.

alter table usuarios
add rua varchar(100),
add numero varchar(10),
add cidade varchar(50),
add estado varchar(20);

# Copia os dados da tabela original para a nova tabela

UPDATE usuarios
SET rua = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 1), ',', -1),
    numero = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 2), ',', -1),
    cidade = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 3), ',', -1),
    estado = SUBSTRING_INDEX(endereco, ',', -1);
    
alter table usuarios
drop column endereco;
select * from reserva;


UPDATE usuarios
SET cidade = "Atenas"
WHERE cidade = " Vila Hell";

UPDATE usuarios
SET cidade = 'Santo Andre'
WHERE cidade = ' vila vitória';

# Consultas avançadas e consultas com junções

select * from usuarios us 
inner join reserva rs on us.id = rs.id_usuario
inner join destino ds on rs.id_destino = ds.id;

select * from usuarios us 
left join reserva rs on us.id = rs.id_usuario;

select * from reserva rs
right join destino ds on rs.id_destino = ds.id;

select * from destino
where id not in (select id_destino from reserva);

select * from usuarios
where id not in (select id_usuario from reserva);

select nome, (select count(*) from reserva where id_usuario = usuarios.id) as total_reservas from usuarios;

# Funções agregadas

## Contar o numero de usuarios cadastrados
select count(*) from usuarios;
select count(*) as total_usuarios from usuarios;
select count(*) as total_usuarios from usuarios us inner join reserva rs on us.id = rs.id_usuario;

## descobrir quem tem a maior idade
select max(timestampdiff(year, data_nascimento, current_date())) as maior_idade from usuarios;
select count(*) id_destino from reserva group by id_destino;

## Ordenar resultados
select count(*) as qtd_reservas, id_destino from reserva group by id_destino
order by qtd_reservas;

# indice (Análise do plano de execução)

INSERT INTO usuarios (nome, email, data_nascimento, rua) VALUES
('João Silva', 'joao.silva@example.com', '1990-01-01', 'Rua A'),
('Maria Santos', 'maria.santos@example.com', '1992-03-15', 'Rua B'),
('Pedro Almeida', 'pedro.almeida@example.com', '1985-07-10', 'Rua C'),
('Ana Oliveira', 'ana.oliveira@example.com', '1998-12-25', 'Rua D'),
('Carlos Pereira', 'carlos.pereira@example.com', '1991-06-05', 'Rua E'),
('Laura Mendes', 'laura.mendes@example.com', '1994-09-12', 'Rua F'),
('Fernando Santos', 'fernando.santos@example.com', '1988-02-20', 'Rua G'),
('Mariana Costa', 'mariana.costa@example.com', '1997-11-30', 'Rua H'),
('Ricardo Rodrigues', 'ricardo.rodrigues@example.com', '1993-04-18', 'Rua I'),
('Camila Alves', 'camila.alves@example.com', '1989-08-08', 'Rua J'),
('Bruno Carvalho', 'bruno.carvalho@example.com', '1995-03-25', 'Rua K'),
('Amanda Silva', 'amanda.silva@example.com', '1996-12-02', 'Rua L'),
('Paulo Mendonça', 'paulo.mendonca@example.com', '1999-07-20', 'Rua M'),
('Larissa Oliveira', 'larissa.oliveira@example.com', '1987-10-15', 'Rua N'),
('Fernanda Sousa', 'fernanda.sousa@example.com', '1992-05-08', 'Rua O'),
('Gustavo Santos', 'gustavo.santos@example.com', '1993-09-18', 'Rua P'),
('Helena Costa', 'helena.costa@example.com', '1998-02-22', 'Rua Q'),
('Diego Almeida', 'diego.almeida@example.com', '1991-11-27', 'Rua R'),
('Juliana Lima', 'juliana.lima@example.com', '1997-04-05', 'Rua S'),
('Rafaela Silva', 'rafaela.silva@example.com', '1996-01-10', 'Rua T'),
('Lucas Pereira', 'lucas.pereira@example.com', '1986-08-30', 'Rua U'),
('Fábio Rodrigues', 'fabio.rodrigues@example.com', '1989-03-12', 'Rua V'),
('Isabela Santos', 'isabela.santos@example.com', '1994-12-07', 'Rua W'),
('André Alves', 'andre.alves@example.com', '1995-09-28', 'Rua X'),
('Clara Carvalho', 'clara.carvalho@example.com', '1990-02-15', 'Rua Y'),
('Roberto Mendes', 'roberto.mendes@example.com', '1992-07-21', 'Rua Z'),
('Mariana Oliveira', 'mariana.oliveira@example.com', '1997-05-03', 'Av. A'),
('Gustavo Costa', 'gustavo.costa@example.com', '1998-11-16', 'Av. B'),
('Lara Sousa', 'lara.sousa@example.com', '1993-06-09', 'Av. C'),
('Pedro Lima', 'pedro.lima@example.com', '1996-09-27', 'Av. D');




EXPLAIN SELECT * FROM usuarios WHERE nome = "Maria";

EXPLAIN SELECT * FROM usuarios us
INNER JOIN reserva rs
ON us.id = rs.id_usuario
WHERE nome = "Maria";


CREATE INDEX idx_nome ON usuarios (nome);

EXPLAIN SELECT * FROM usuarios WHERE nome = "Maria";





