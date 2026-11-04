create database clinica_petvida;
USE clinica_petvida;

create table clientes (
  id_cliente int auto_increment primary key,
  nome varchar(100) not null,
  cpf char(14) not null unique,
  telefone varchar(20) not null,
  email  varchar(100),
  cidade varchar(60) not null
);

create table especies (
  id_especie int auto_increment primary key,
  nome varchar(40) not null unique
) ;

create table animais (
  id_animal int auto_increment primary key,
  id_cliente int not null,
  id_especie int not null,
  nome varchar(60) not null,
  raca varchar(60),
  data_nascimento datetime,
  peso_kg decimal(5,2),
  constraint fk_animal_cliente foreign key (id_cliente) references clientes(id_cliente),
  constraint fk_animal_especie foreign key (id_especie) references especies(id_especie)
);


create table microchips (
  id_animal int primary key,
  numero char(15) not null unique,
  data_implante date not null,
 constraint fk_chip_animal foreign key (id_animal) references animais(id_animal)
);

create table veterinarios (
  id_veterinario int auto_increment primary key,
  nome varchar(100) not null,
  telefone varchar(20)
) ;

create table especialidades (
  id_especialidade int auto_increment primary key,
  nome varchar(60) not null unique
);


create table veterinario_especialidade (
  id_veterinario int not null,
  id_especialidade int not null,
 primary key (id_veterinario, id_especialidade),
  constraint fk_ve_vet foreign key (id_veterinario) references veterinarios(id_veterinario),
  constraint fk_ve_esp FOREIGN KEY (id_especialidade) references especialidades(id_especialidade)
);

create table servicos (
  id_servico int auto_increment primary key,
  descricao varchar(80) not null unique,
  preco decimal(8,2) not null
);

create table atendimentos (
  id_atendimento int auto_increment primary key,
  id_animal int not null,
  id_veterinario int not null,
  data_hora datetime not null,
  observacoes varchar(255),
  constraint fk_at_animal foreign key (id_animal) references animais(id_animal),
  constraint fk_at_vet    foreign key (id_veterinario) references veterinarios(id_veterinario)
) ;


create table atendimento_servico (
  id_atendimento int not null,
  id_servico int not null,
  quantidade int not null default 1,
  preco_cobrado  decimal(8,2) not null,
  primary key  (id_atendimento, id_servico),
  constraint fk_as_at  foreign key (id_atendimento) references atendimentos(id_atendimento),
  constraint fk_as_srv foreign key (id_servico) references servicos(id_servico)
);

insert into clientes (id_cliente, nome, cpf, telefone, email, cidade) values
(1,'Ana Paula Souza','111.111.111-11','(11) 91111-1111','ana@email.com','São Paulo'),
(2,'Bruno Lima','222.222.222-22','(11) 92222-2222','bruno@email.com','Guarulhos'),
(3,'Carla Mendes','333.333.333-33','(11) 93333-3333','carla@email.com','São Paulo'),
(4,'Diego Ferreira','444.444.444-44','(11) 94444-4444',null,'Osasco'),
(5,'Elaine Costa','555.555.555-55','(11) 95555-5555','elaine@email.com','São Paulo'),
(6,'Fábio Nunes','666.666.666-66','(11) 96666-6666','fabio@email.com','Santo André');

insert into especies (id_especie, nome) values
(1,'Cão'),(2,'Gato'),(3,'Coelho'),(4,'Ave'),(5,'Hamster');

insert into animais (id_animal, id_cliente, id_especie, nome, raca, data_nascimento, peso_kg) values
(1,1,1,'Rex','Labrador','2019-03-10',30.50),
(2,1,2,'Mimi','Siamês','2020-07-21',4.20),
(3,2,1,'Thor','Bulldog','2018-11-05',24.00),
(4,3,2,'Luna','SRD','2021-01-15',3.80),
(5,4,3,'Bolinha','Mini Lop','2022-05-30',1.90),
(6,5,4,'Piu','Calopsita','2023-02-12',0.09),
(7,6,1,'Nina','Poodle','2017-09-09',6.30),
(8,3,1,'Mel','Golden Retriever','2020-12-01',28.00);

insert into microchips (id_animal, numero, data_implante) values
(1,'985112000000001','2019-05-01'),
(3,'985112000000002','2019-01-10'),
(4,'985112000000003','2021-03-20'),
(7,'985112000000004','2017-11-15'),
(8,'985112000000005','2021-02-02');

insert into verinarios (id_veterinario, nome, crmv, telefone) values
(1,'Dra. Helena Ribeiro','CRMV-SP 11111','(11) 98111-0001'),
(2,'Dr. Marcos Tavares','CRMV-SP 22222','(11) 98111-0002'),
(3,'Dra. Patrícia Gomes','CRMV-SP 33333','(11) 98111-0003'),
(4,'Dr. Ricardo Alves','CRMV-SP 44444','(11) 98111-0004'),
(5,'Dra. Juliana Prado','CRMV-SP 55555','(11) 98111-0005');

insert into especialidades (id_especialidade, nome) values
(1,'Clínica Geral'),(2,'Cirurgia'),(3,'Dermatologia'),(4,'Animais Exóticos'),(5,'Cardiologia');

insert into veterinario_especialidade (id_veterinario, id_especialidade) values
(1,1),(2,2),(2,1),(3,3),(4,4),(5,5),(5,1);

insert into servicos (id_servico, descricao, preco) values
(1,'Consulta',120.00),
(2,'Vacina V10',90.00),
(3,'Vacina Antirrábica',60.00),
(4,'Exame de sangue',150.00),
(5,'Banho e tosa',80.00),
(6,'Cirurgia de castração',450.00);

insert into atendimentos (id_atendimento, id_animal, id_veterinario, data_hora, observacoes) values
(1,1,1,'2026-09-02 09:00:00','Check-up anual'),
(2,2,1,'2026-09-05 10:30:00','Perda de apetite'),
(3,3,3,'2026-09-10 14:00:00','Alergia de pele'),
(4,4,2,'2026-09-15 11:00:00','Castração'),
(5,5,4,'2026-09-20 16:00:00','Avaliação dentária'),
(6,6,4,'2026-10-01 09:30:00','Queda de penas'),
(7,7,5,'2026-10-05 15:00:00','Sopro cardíaco'),
(8,8,2,'2026-10-10 10:00:00','Castração'),
(9,1,1,'2026-10-20 08:30:00','Banho e tosa'),
(10,3,3,'2026-10-25 13:00:00','Reforço de vacinas');

insert into atendimento_servico (id_atendimento, id_servico, quantidade, preco_cobrado) values
(1,1,1,120.00),(1,2,1,90.00),
(2,1,1,120.00),(2,4,1,150.00),
(3,1,1,120.00),(3,3,1,60.00),
(4,6,1,450.00),
(5,1,1,120.00),
(6,1,1,120.00),(6,4,1,150.00),
(7,1,1,120.00),(7,2,1,90.00),
(8,6,1,450.00),
(9,5,2,80.00),
(10,2,1,90.00),(10,3,1,60.00);

SELECT nome, telefone FROM clientes WHERE cidade = 'São Paulo' ORDER BY nome;
SELECT nome, raca FROM animais WHERE nome LIKE 'M%';
SELECT a.nome AS animal, e.nome AS especie, c.nome AS tutor FROM animais a INNER JOIN clientes c ON c.id_cliente = a.id_cliente INNER JOIN especies e ON e.id_especie = a.id_especie ORDER BY a.nome;
SELECT e.nome AS especie, COUNT(*) AS total FROM animais a INNER JOIN especies e ON e.id_especie = a.id_especie GROUP BY e.nome ORDER BY total DESC, e.nome;
SELECT at.id_atendimento, an.nome AS animal, at.data_hora FROM atendimentos at INNER JOIN animais an ON an.id_animal = at.id_animal WHERE at.data_hora BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59' ORDER BY at.data_hora;
SELECT SUM(quantidade * preco_cobrado) AS faturamento_total FROM atendimento_servico;
SELECT id_atendimento, SUM(quantidade * preco_cobrado) AS total FROM atendimento_servico GROUP BY id_atendimento ORDER BY total DESC, id_atendimento;
SELECT v.nome, COUNT(*) AS atendimentos FROM atendimentos at INNER JOIN veterinarios v ON v.id_veterinario = at.id_veterinario GROUP BY v.nome ORDER BY atendimentos DESC, v.nome;
SELECT s.descricao, SUM(x.quantidade) AS vezes FROM atendimento_servico x INNER JOIN servicos s ON s.id_servico = x.id_servico GROUP BY s.descricao ORDER BY vezes DESC, s.descricao;
SELECT c.nome, SUM(x.quantidade * x.preco_cobrado) AS gasto FROM clientes c INNER JOIN animais an ON an.id_cliente = c.id_cliente INNER JOIN atendimentos at ON at.id_animal = an.id_animal INNER JOIN atendimento_servico x ON x.id_atendimento = at.id_atendimento GROUP BY c.nome HAVING SUM(x.quantidade * x.preco_cobrado) > 300 ORDER BY gasto DESC;
SELECT v.nome AS veterinario, e.nome AS especialidade FROM veterinarios v INNER JOIN veterinario_especialidade ve ON ve.id_veterinario = v.id_veterinario INNER JOIN especialidades e ON e.id_especialidade = ve.id_especialidade ORDER BY v.nome, e.nome;
SELECT a.nome FROM animais a LEFT JOIN microchips m ON m.id_animal = a.id_animal WHERE m.id_animal IS NULL ORDER BY a.nome;
SELECT ROUND(AVG(a.peso_kg), 2) AS peso_medio_caes FROM animais a INNER JOIN especies e ON e.id_especie = a.id_especie WHERE e.nome = 'Cão';
SELECT ROUND(AVG(preco),2) AS media, MIN(preco) AS menor, MAX(preco) AS maior FROM servicos;
SELECT at.id_atendimento, an.nome AS animal, c.nome AS tutor, v.nome AS veterinario, at.data_hora FROM atendimentos at INNER JOIN animais an ON an.id_animal = at.id_animal INNER JOIN clientes c ON c.id_cliente = an.id_cliente INNER JOIN veterinarios v ON v.id_veterinario = at.id_veterinario INNER JOIN atendimento_servico x ON x.id_atendimento = at.id_atendimento INNER JOIN servicos s ON s.id_servico = x.id_servico WHERE s.descricao LIKE '%Cirurgia%' ORDER BY at.data_hora;
