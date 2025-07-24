-- criação de schema globotech
create schema globotech;

-- tabela de plataformas
create table globotech.plataforma (
	id_plataforma int primary key auto_increment,
	nome_plataforma varchar(60) not null unique
);

-- tabela de conteúdos
create table globotech.conteudo (
	id_conteudo int primary key,
    nome_conteudo varchar(60) not null unique
);

-- tabela de usuários
create table globotech.usuario (
	id_usuario int primary key
);

-- tabela com tipos de interação (view_start, like, share e comment)
create table globotech.tipointeracao (
	id_tipo_interacao int primary key auto_increment,
    nome_tipo_interacao varchar(60) not null unique
);

-- tabela principal de interações
create table globotech.interacao (
	id_interacao int primary key auto_increment,
    timestamp_interacao timestamp not null,
    watch_duration time null, -- duração opcional, pois só o 'view_start' tem duração. Mudando o nome para watch_duration, diferente do nome no csv, pois estamos criando um tipo time
    comment_text varchar(130) null, -- duração opcional, pois só 'comment' tem texto de comentário
    id_tipo_interacao int not null,
    id_usuario int not null,
    id_conteudo int not null,
    id_plataforma int not null,
    
    -- chaves estrangeiras
    constraint fk_interacao_tipointeracao
		foreign key (id_tipo_interacao) references globotech.tipointeracao(id_tipo_interacao),
	constraint fk_interacao_usuario
		foreign key (id_usuario) references globotech.usuario(id_usuario),
	constraint fk_interacao_conteudo
		foreign key (id_conteudo) references globotech.conteudo(id_conteudo),
	constraint fk_interacao_plataforma
		foreign key (id_plataforma) references globotech.plataforma(id_plataforma)
);

