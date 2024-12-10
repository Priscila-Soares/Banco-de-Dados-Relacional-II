-- 1. Criação do banco de dados
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- 2. Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria TEXT NOT NULL
);

-- 3. Criação da tabela tb_pizzas
CREATE TABLE tb_pizzas (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(50) NOT NULL,
    preco DECIMAL(8, 2) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    ingredientes TEXT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- 4. Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Tradicional', 'Sabores clássicos e tradicionais'),
('Especial', 'Combinações exclusivas e especiais'),
('Doce', 'Sabores doces para sobremesas'),
('Vegetariana', 'Opções sem carne para vegetarianos'),
('Premium', 'Sabores gourmet e ingredientes selecionados');

-- 5. Inserção de registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome_pizza, preco, tamanho, ingredientes, id_categoria) VALUES
('Margherita', 35.50, 'Média', 'Queijo, tomate, manjericão', 1),
('Calabresa', 40.00, 'Grande', 'Calabresa, cebola, azeitona', 1),
('Brigadeiro', 50.00, 'Pequena', 'Chocolate, granulado, leite condensado', 3),
('Vegetariana', 45.00, 'Média', 'Queijo, tomate, cogumelo, rúcula', 4),
('Frango Catupiry', 55.00, 'Grande', 'Frango desfiado, catupiry, milho', 2),
('Quatro Queijos', 48.00, 'Média', 'Mozzarella, parmesão, gorgonzola, provolone', 5),
('Nutella', 60.00, 'Pequena', 'Nutella, morango, leite condensado', 3),
('Portuguesa', 42.00, 'Grande', 'Presunto, ovo, cebola, ervilha, queijo', 1);

-- 6. SELECT para pizzas com valor > R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- 7. SELECT para pizzas com valor entre R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- 8. SELECT com operador LIKE para buscar pizzas com a letra "M" no nome
SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

-- 9. SELECT com INNER JOIN para unir tb_pizzas e tb_categorias
SELECT 
    p.id_pizza, p.nome_pizza, p.preco, p.tamanho, 
    c.nome_categoria, c.descricao_categoria
FROM 
    tb_pizzas p
INNER JOIN 
    tb_categorias c
ON 
    p.id_categoria = c.id_categoria;

-- 10. SELECT com INNER JOIN para pizzas de uma categoria específica (Exemplo: Doce)
SELECT 
    p.id_pizza, p.nome_pizza, p.preco, p.tamanho, 
    c.nome_categoria
FROM 
    tb_pizzas p
INNER JOIN 
    tb_categorias c
ON 
    p.id_categoria = c.id_categoria
WHERE 
    c.nome_categoria = 'Doce';
