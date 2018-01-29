create database handskills;
use handskills

create table Produto (

id int AUTO_INCREMENT,
nomeProduto varchar(50) not null,
localOrigemProduto varchar(50) not null,
coresDisponiveis varchar (20) not null,
materialFeito varchar (30) not null,
precoVenda float not null,
quantidadeDisponivel int not null,
imagem varchar(200) not null,
primary key (id)

);


create table Usuario (
id int AUTO_INCREMENT not null,
nomeCompleto varchar(50) not null,
cpf varchar(15) not null,
rg varchar(15) not null,
email varchar(50) not null,
senha varchar(200) not null,
endereco varchar(100) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
estado varchar(100) not null,
cep varchar(20) not null,
sexo varchar(10),
tipoUsuario varchar(10) not null,
telefone varchar(30) not null,
whatapp varchar(30),
primary key(id)

);
