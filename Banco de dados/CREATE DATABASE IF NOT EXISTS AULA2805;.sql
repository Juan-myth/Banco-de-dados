CREATE DATABASE IF NOT EXISTS AULA2805;

USE AULA2805;

CREATE TABLE PESSOA(
    idPessoa int NOT NULL AUTO_INCREMENT,
    nomeCompleto VARCHAR(50) NOT NULL,

    CONSTRAINT PESSOA_PK PRIMARY KEY (idPessoa)
)ENGINE = INNODB;

CREATE TABLE MEDICO(
    numeroCrm BIGINT NOT NULL, 
    estado CHAR(2) NOT NULL,
    idPessoa INT NOT NULL,

        CONSTRAINT MEDICO_PK PRIMARY KEY (numeroCrm, estado),
        CONSTRAINT MEDICO_PESSOA_FK  FOREIGN KEY (idPessoa) REFERENCES PESSOA (idPessoa) ON DELETE CASCADE,
        CONSTRAINT MEDICO_UK UNIQUE (numeroCrm, estado)
) ENGINE = INNODB;

CREATE TABLE ESPECIALIDADE(
idEspecialidade INT NOT NULL auto_increment,
nomeEspecialidade varchar(20) NOT NULL,

constraint ESPECIALIDADE_PK primary key (idEspecialidade)

)ENGINE = INNODB;

CREATE TABLE EspecialidadesClinicas(
numeroCrm BIGINT not null,
estado CHAR(2) NOT NULL,
idEspecialidade INT NOT NULL auto_increment,

constraint ESPECIALIDADE_MEDICO_FK foreign key(numeroCrm, estado) REFERENCES MEDICO(numeroCrm, estado) on DELETE CASCADE,
constraint ESPECIALIDADE_FK foreign key (idEspecialidade) references ESPECIALIDADE(idEspecialidade) on DELETE CASCADE
)ENGINE = INNODB;