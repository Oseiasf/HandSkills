create database handskills;
use handskills;

create table MaterialDoProduto (

id int AUTO_INCREMENT,
descricao varchar(50),
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
tipoUsuario varchar(20) not null,
telefone varchar(30) not null,
whatsapp varchar(30),
primary key(id)
);

create table Produto (

id int AUTO_INCREMENT,
#id_usuario int not null,
nomeProduto varchar(50) not null,
localOrigemProduto varchar(50) not null,
coresDisponiveis varchar (20) not null,
materialDoProduto int not null,
precoVenda float not null,
quantidadeDisponivel int not null,
imagem varchar(200) not null,
primary key (id),
#foreign key (id_usuario) references Usuario (id),
foreign key (materialDoProduto) references MaterialDoProduto (id)
);