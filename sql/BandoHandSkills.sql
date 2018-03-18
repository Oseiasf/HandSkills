#ALTER TABLE `suatabela` CHANGE `suacoluna` `suacoluna` INT(11) NOT NULL;
#ALTER TABLE dbo.doc_exa ADD column_b VARCHAR(20) NULL, column_c INT NULL ;
#drop database handskills;
#ALTER TABLE ItemVenda ADD CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES Produto(id);
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

create table Venda ( 
id int AUTO_INCREMENT,
id_usuario int not null,
dt_venda date not null,
valor_total float not null,
primary key (id),
foreign key(id_usuario) references Usuario (id)
);

create table ItemVenda (
id int AUTO_INCREMENT,
id_produto int not null,
id_venda int not null,
quantidade int not null,
valor float not null, 
primary key (id),
foreign key (id_produto) references Produto (id),
foreign key (id_venda) references Venda (id)
);

INSERT INTO Usuario VALUES (1,'Oseias Ferreira','000.000.000-00',
'0.000.000','admin','admin','Rua 11','Ponte dos Carvalhos','Cabo',
'Pernambuco','00.000-000','Masculino','ADM','(81) 98484-8484','(81)
 98484-8484'),
 
(2,'Cliente','222.222.222-22','2.222.222','cliente@gmail.com','123',
'Rua do Cliente','Bairro do Cliente','Cidade do Cliente','PE',
'22222-222','Masculino','CLIENTE','(22) 22222-2222','(22) 
22222-2222'),

(3,'Artesão','333.333.333-33','3.333.333','artesao@gmail.com',
'123','Rua do Artesão','Bairro do Artesão','Cidade do Artesão',
'PE','33333-333','Feminino','ARTESAO','(33) 33333-3333','(33) 
33333-3333');

insert into MaterialDoProduto (descricao) values ("Madeira")
,("Argila"),("Pano"),("Papelão"),("Gesso"),("PET");