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


create table Estado (
Id int not null AUTO_INCREMENT,
CodigoUf int not null,
Nome varchar(50) NOT NULL,
Uf char(2) not null,
Regiao int not null,
primary key(Id)
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
estado varchar(50) not null,
cep varchar(20) not null,
sexo varchar(10),
tipo_usuario varchar(20) not null,
telefone varchar(30) not null,
whatsapp varchar(30),
primary key(id)
);

create table Produto (

id int AUTO_INCREMENT,
id_usu_artesao int,
nome_produto varchar(50) not null,
local_origem_produto varchar(50) not null,
cores_disponiveis varchar (20) not null,
material_produto int,
preco_venda float not null,
quantidade_disponivel int not null,
imagem varchar(200) not null,
primary key (id),
foreign key (id_usu_artesao) references Usuario (id),
foreign key (material_produto) references MaterialDoProduto (id)
);

create table Venda ( 
id int AUTO_INCREMENT,
id_usuario int,
dt_venda timestamp default current_timestamp,
valor_total float not null,
primary key (id),
foreign key(id_usuario) references Usuario (id)
);

create table ItemVenda (
id int AUTO_INCREMENT,
id_produto int,
id_venda int,
quantidade int not null,
valor float not null, 
primary key (id),
foreign key (id_produto) references Produto (id),
foreign key (id_venda) references Venda (id)
);



-- Insert Data --

Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (12, 'Acre', 'AC', 1);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (27, 'Alagoas', 'AL', 2);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (16, 'Amapá', 'AP', 1);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (13, 'Amazonas', 'AM', 1);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (29, 'Bahia', 'BA', 2);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (23, 'Ceará', 'CE', 2);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (53, 'Distrito Federal', 'DF', 5);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (32, 'Espírito Santo', 'ES', 3);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (52, 'Goiás', 'GO', 5);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (21, 'Maranhão', 'MA', 2);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (51, 'Mato Grosso', 'MT', 5);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (50, 'Mato Grosso do Sul', 'MS', 5);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (31, 'Minas Gerais', 'MG', 3);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (15, 'Pará', 'PA', 1);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (25, 'Paraíba', 'PB', 2);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (41, 'Paraná', 'PR', 4);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (26, 'Pernambuco', 'PE', 2);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (22, 'Piauí', 'PI', 2);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (33, 'Rio de Janeiro', 'RJ', 3);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (24, 'Rio Grande do Norte', 'RN', 2);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (43, 'Rio Grande do Sul', 'RS', 4);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (11, 'Rondônia', 'RO', 1);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (14, 'Roraima', 'RR', 1);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (42, 'Santa Catarina', 'SC', 4);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (35, 'São Paulo', 'SP', 3);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (28, 'Sergipe', 'SE', 2);
Insert into Estado (CodigoUf, Nome, Uf, Regiao) values (17, 'Tocantins', 'TO', 1);

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