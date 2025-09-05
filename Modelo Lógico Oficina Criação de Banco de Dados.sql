-- Criação de banco de dado para o cenário de Ordem de serviço
drop database OrdemDeServiço;
create database OrdemDeServiço;
use OrdemDeServiço;

-- criar tabela clients
create table clients(
idCliente int primary key not null auto_increment,
Nome varchar (45) not null,
CPF char (11) not null,
Contato varchar (45) not null,
constraint unico_cpf_cliente unique (CPF)
);
desc clients;
alter table clients auto_increment=1;
desc clients;
-- criar tabela pedido
create table pedido(
idPedido int primary key not null auto_increment,
idCliente int not null,
AnálisedoPedido int,
Serviço varchar (45) not null,
Descrição varchar (255) not null,
Datapedido date,
liberado tinyint
);
desc pedido;

-- criar tabela análiseDopedido
create table análiseDoPedido(
idAnáliseDoPedido int primary key not null auto_increment,
PEDIDO_idPedido int not null,
RESPONSÁVEL_idResponsável int not null,
StatusAnálise enum ("Aguardando Análise", "Em Análise")
);
desc análiseDoPedido;

-- criar tabela responsável
create table responsável(
idResponsável int primary key not null auto_increment,
NOME varchar (45) not null,
NÍVEL int not null,
DEPARTAMENTO varchar (45)
);
desc responsável;

-- criar tabela ORDEM_DE_SERVIÇO 
create table ORDEM_DE_SERVIÇO(
idOrdemdeServiço int primary key not null auto_increment,
RESPONSÁVEL_idResponsável int,
STATUSdaOS enum ("Em Análise", "Serviço em Execução", "Serviço Finalizado")
);

desc ORDEM_DE_SERVIÇO;

-- criar tabela PEDIDO_E_ORDEM_DE_SERVIÇO
create table PEDIDO_E_ORDEM_DE_SERVIÇO(
PEDIDO_idPedido int not null,
PEDIDO_CLIENTE_idpedido int not null,
PEDIDO_ANÁLISE_DE_PEDIDO_RESPONSÁVEL_idResponsável int not null,
ORDEM_DE_SERVIÇO_idOrdem_de_serviço int not null
);
desc PEDIDO_E_ORDEM_DE_SERVIÇO;

show databases;
show tables;