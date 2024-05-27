-- Criação da tabela alunos
create table alunos(
	id_aluno int primary key not null,
	nome varchar(100) not null,
	data_nascimento date not null,
	sexo varchar(1) not null,
	data_cadastro date not null,
	login_cadastro varchar(15)
);

-- Criação da tabela cursos
create table cursos(
	id_curso int primary key not null,
	nome_curso varchar(100) not null,
	data_cadastro date not null,
	login_cadastro varchar(15)
);

-- Criação da tabela situação
create table situacao(
	id_situacao int primary key not null,
	situacao varchar(100) not null,
	data_cadastro date not null,
	login_cadastro varchar(15)
);

-- Criação da tabela turmas
create table turmas(
	id_turma int primary key not null,
	id_aluno int not null,
	id_curso int not null,
	valor_turma numeric(15, 2) not null,
	desconto numeric(3, 2) not null,
	data_inicio date not null,
	data_termino date not null,
	data_cadastro date not null,
	login_cadastro varchar(15)
);

-- Criação da tabela Registro de Presença
create table registro_presenca(
	id_turma int primary key not null,
	id_aluno int not null,
	id_situacao int not null,
	data_presenca date not null,
	data_cadastro date not null,
	login_cadastro varchar(15)
);

-- Criação das Foreign Key
alter table turmas
	add constraint fk_alunos foreign key (id_aluno) references alunos (id_aluno);

alter table turmas
	add constraint fk_cursos foreign key (id_curso) references cursos (id_curso);

alter table registro_presenca
	add constraint fk_turma foreign key (id_turma) references turmas (id_turma);

alter table registro_presenca
	add constraint fk_aluno foreign key (id_aluno) references alunos (id_aluno);

alter table registro_presenca
	add constraint fk_situacao foreign key (id_situacao) references situacao (id_situacao);