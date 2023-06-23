CREATE TABLE cargo (
                cargo_id                NUMERIC(10) NOT NULL,
                area_de_atuacao         VARCHAR(100) NOT NULL,
                CONSTRAINT pk_cargo   PRIMARY KEY (cargo_id)-- Criação da pk da tabela
);
COMMENT ON TABLE cargo IS 'Tabela de cargos da empresa'
COMMENT ON COLUMN cargo.cargo_id IS 'Pk da tabela que identifica cada cargo de maneira unica'
COMMENT ON COLUMN cargo.area_de_atuacao IS 'area de atuação de cada cargo'

CREATE TABLE projetos (
                projeto_id              NUMERIC(10) NOT NULL,
                nome                    VARCHAR(512) NOT NULL,
                img_projeto             BYTEA,
                descricao_projeto       VARCHAR(3000) NOT NULL,
                CONSTRAINT pk_projetos  PRIMARY KEY (projeto_id)-- Criação da pk da tabela
);
COMMENT ON TABLE projetos IS 'Tabela de projetos da fortes'
COMMENT ON COLUMN projetos.projeto_id IS 'Pk da tabela que identifica cada projeto de maneira unica'
COMMENT ON COLUMN projetos.nome IS 'Nome do projeto'
COMMENT ON COLUMN projetos.img_projeto IS 'Imagem do projeto'
COMMENT ON COLUMN projetos.descricao_projeto IS 'Descrição do projeto'


CREATE TABLE comunidade (
                comuni_id               NUMERIC(10) NOT NULL,
                nome                    VARCHAR(100) NOT NULL,
                foto                    BYTEA,
                descricao_comuni        VARCHAR(3000) NOT NULL,
                CONSTRAINT pk_comunidae    PRIMARY KEY (comuni_id)-- Criação da pk da tabela
);
COMMENT ON TABLE comunidade IS 'Tabela da comunidades'
COMMENT ON COLUMN comunidade.comuni_id IS 'PK da tabela que identifica cada comunidade de maneira única'
COMMENT ON COLUMN comunidade.nome IS 'Nome de cada comunidade'
COMMENT ON COLUMN comunidade.foto IS 'foto da comunidade'
COMMENT ON COLUMN comunidade.descricao_comuni IS 'descrição da comunidade'

CREATE TABLE colaborador (
                colab_id                NUMERIC(10) NOT NULL,
                nome                    VARCHAR(100) NOT NULL,
                data_de_nascimento      DATE NOT NULL,
                cargo_id                NUMERIC(10) NOT NULL,
                sobre_mim               VARCHAR(3000),
                CONSTRAINT pk_colaborador   PRIMARY KEY (colab_id)-- Criação da pk da tabela
);
COMMENT ON TABLE colaborador IS 'Tabela com os dados do perfil de cada colaborador da empresa.';
COMMENT ON COLUMN colaborador.colab_id IS 'Pk da tabela que identifica cada colaborador unicamente'
COMMENT ON COLUMN colaborador.nome IS 'Nome do colaborador '
COMMENT ON COLUMN colaborador.data_de_nascimento IS 'data de nascimento do colaborador'
COMMENT ON COLUMN colaborador.cargo_id IS 'Fk da tabela que vem da tabela cargos'
COMMENT ON COLUMN colaborador.sobre_mim IS 'Uma descrição que o proprio colaborador informa'


CREATE TABLE colaborador_comunidade (
                colab_id NUMERIC(10)    NOT NULL,
                comuni_id NUMERIC(10)   NOT NULL,
                CONSTRAINT pk_colaborador_comunidade      PRIMARY KEY (colab_id, comuni_id)-- Criação da pk da tabela
);
COMMENT ON TABLE colaborador_comunidade IS 'Tebela que contém duas pfk uma de comunidade e outra de colaborador'
COMMENT ON COLUMN colaborador_comunidade.colab_id IS 'Pfk da tabela pois ela se torna uma pk na tabela mesmo vindo de outra tabela'
COMMENT ON COLUMN colaborador_comunidade.colab_id IS 'Pfk da tabela , ela vem da tabela colaborador'


CREATE TABLE colaborador_projeto (
                colab_id NUMERIC(10)    NOT NULL,
                projeto_id NUMERIC(10)  NOT NULL,
                CONSTRAINT pk_colaborador_projeto      PRIMARY KEY (colab_id, projeto_id)-- Criação da pk da tabela
);
COMMENT ON TABLE colaborador_projeto. IS 'Tabela que contem pk da tabela colaborador e de projetos'
COMMENT ON COLUMN colaborador_projeto.colab_id IS 'Pfk da tabela pois ela se torna uma pk na tabela mesmo vindo de outra tabela'
COMMENT ON COLUMN colaborador_projeto.projeto_id IS 'Pfk da tabela pois ela se torna uma pk na tabela mesmo vindo de outra tabela'


CREATE TABLE skills (
                colab_id NUMERIC(10)        NOT NULL,
                hard_skill VARCHAR(100)     NOT NULL,
                soft_skill VARCHAR(100)     NOT NULL,
                CONSTRAINT pk_skills          PRIMARY KEY (colab_id)-- Criação da pk da tabela
);
COMMENT ON TABLE skills IS 'Tabela de skills dos colaboradores'
COMMENT ON COLUMN skills.colab_id IS 'Pfk da tabela , quem vem da tabela colaborador'
COMMENT ON COLUMN skills.hard_skill IS 'descrição das hards skills do colaborador'
COMMENT ON COLUMN skills.soft_skill IS 'descrição das soft skills do colaborador'


ALTER TABLE colaborador ADD CONSTRAINT cargo_colaborador_fk
FOREIGN KEY (cargo_id)
REFERENCES cargo (cargo_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE colaborador_projeto ADD CONSTRAINT projetos_colaborador_projeto_fk
FOREIGN KEY (projeto_id)
REFERENCES projetos (projeto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE colaborador_comunidade ADD CONSTRAINT comunidade_colaborador_comunidade_fk
FOREIGN KEY (comuni_id)
REFERENCES comunidade (comuni_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE skills ADD CONSTRAINT colaborador_skills_fk
FOREIGN KEY (colab_id)
REFERENCES colaborador (colab_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE colaborador_projeto ADD CONSTRAINT colaborador_colaborador_projeto_fk
FOREIGN KEY (colab_id)
REFERENCES colaborador (colab_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE colaborador_comunidade ADD CONSTRAINT colaborador_colaborador_comunidade_fk
FOREIGN KEY (colab_id)
REFERENCES colaborador (colab_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
