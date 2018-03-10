#ALTER TABLE `suatabela` CHANGE `suacoluna` `suacoluna` INT(11) NOT NULL;
#ALTER TABLE dbo.doc_exa ADD column_b VARCHAR(20) NULL, column_c INT NULL ;
#drop database handskills;
create database handskills;
use handskills;

create table MaterialDoProduto (

id int AUTO_INCREMENT,
descricao varchar(50),
primary key (id)
);

create table Usuario (
id int AUTO_INCREMENT not null,
nome_completo varchar(50) not null,
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
tipo_usuario varchar(20) not null,
telefone varchar(30) not null,
whatsapp varchar(30),
primary key(id)
);

create table Produto (

id int AUTO_INCREMENT,
id_usu_artesao int not null,
nome_produto varchar(50) not null,
local_origem_produto varchar(50) not null,
cores_disponiveis varchar (20) not null,
material_produto int not null,
preco_venda float not null,
quantidade_disponivel int not null,
imagem varchar(200) not null,
primary key (id),
foreign key (id_usu_artesao) references Usuario (id),
foreign key (material_produto) references MaterialDoProduto (id)
);

create table PedidosRealizados (
id int AUTO_INCREMENT,
id_usu int,
id_prod int,
situacao tinyint(1),
data_pedido date,
primary key (id),
foreign key (id_usu) references Usuario (id),
foreign key (id_prod) references Produto (id)
);