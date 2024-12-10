-- 1. Criação do banco de dados
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- 2. Criação da tabela tb_classes
CREATE TABLE tb_classes (
    id_class INT AUTO_INCREMENT PRIMARY KEY,
    name_class VARCHAR(50) NOT NULL,
    description_class TEXT NOT NULL
);

-- 3. Criação da tabela tb_personagens
CREATE TABLE tb_personagens (
    id_personagem INT AUTO_INCREMENT PRIMARY KEY,
    name_personagem VARCHAR(50) NOT NULL,
    attack_power INT NOT NULL,
    defense_power INT NOT NULL,
    level INT NOT NULL,
    id_class INT,
    FOREIGN KEY (id_class) REFERENCES tb_classes(id_class)
);

-- 4. Inserção de registros na tabela tb_classes
INSERT INTO tb_classes (name_class, description_class) VALUES
('Arqueiro', 'Especialista em ataques à distância'),
('Mago', 'Dominador de feitiços e magias'),
('Guerreiro', 'Forte e resiliente, ideal para combate corpo a corpo'),
('Assassino', 'Mestre da furtividade e ataques rápidos'),
('Clérigo', 'Protetor e curador com habilidades mágicas');

-- 5. Inserção de registros na tabela tb_personagens
INSERT INTO tb_personagens (name_personagem, attack_power, defense_power, level, id_class) VALUES
('Legolas', 2500, 1500, 20, 1),
('Gandalf', 3000, 1200, 30, 2),
('Thorin', 2000, 1800, 25, 3),
('Altair', 2700, 1100, 22, 4),
('Elrond', 2300, 1600, 18, 5),
('Arwen', 2100, 1400, 15, 5),
('Aragorn', 2600, 2000, 28, 3),
('Frodo', 800, 1000, 10, NULL); -- Sem classe associada para testar integridade

-- 6. SELECT para personagens com poder de ataque > 2000
SELECT * FROM tb_personagens WHERE attack_power > 2000;

-- 7. SELECT para personagens com poder de defesa entre 1000 e 2000
SELECT * FROM tb_personagens WHERE defense_power BETWEEN 1000 AND 2000;

-- 8. SELECT com operador LIKE para buscar personagens com a letra "C" no nome
SELECT * FROM tb_personagens WHERE name_personagem LIKE '%C%';

-- 9. SELECT com INNER JOIN para unir tb_personagens e tb_classes
SELECT 
    p.id_personagem, p.name_personagem, p.attack_power, p.defense_power, 
    c.name_class, c.description_class
FROM 
    tb_personagens p
INNER JOIN 
    tb_classes c
ON 
    p.id_class = c.id_class;

-- 10. SELECT com INNER JOIN para personagens de uma classe específica (Exemplo: Arqueiros)
SELECT 
    p.id_personagem, p.name_personagem, p.attack_power, p.defense_power,
    c.name_class
FROM 
    tb_personagens p
INNER JOIN 
    tb_classes c
ON 
    p.id_class = c.id_class
WHERE 
    c.name_class = 'Arqueiro';
