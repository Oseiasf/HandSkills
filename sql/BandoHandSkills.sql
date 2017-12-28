create database HandSkills;
use HandSkills

create table Produto (

id int AUTO_INCREMENT,
codigo varchar(20) not null,
nomeProduto varchar(50) not null,
localOrigemProduto varchar(50) not null,
coresDisponiveis varchar (20) not null,
materialFeito varchar (30) not null,
precoVenda float not null,
quantidadeDisponivel int not null,
imagem varchar(20) not null,
primary key (id)

);