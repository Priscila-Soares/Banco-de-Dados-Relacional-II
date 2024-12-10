-- 1. Criação do banco de dados
CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- 2. Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria TEXT NOT NULL
);

-- 3. Criação da tabela tb_produtos
CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL,
    preco DECIMAL(8, 2) NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    validade DATE NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- 4. Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Medicamentos', 'Produtos para tratamento de doenças e sintomas'),
('Cosméticos', 'Produtos para cuidados pessoais e beleza'),
('Higiene', 'Itens de higiene pessoal'),
('Suplementos', 'Produtos para nutrição e bem-estar'),
('Infantil', 'Produtos destinados ao público infantil');

-- 5. Inserção de registros na tabela tb_produtos
INSERT INTO tb_produtos (nome_produto, preco, fabricante, validade, id_categoria) VALUES
('Paracetamol', 20.00, 'Farmacêutica A', '2025-12-31', 1),
('Shampoo Anticaspa', 35.00, 'Cosméticos B', '2024-06-30', 2),
('Sabonete Líquido', 15.00, 'Higiene C', '2025-01-15', 3),
('Vitamina C', 55.00, 'Suplementos D', '2025-03-20', 4),
('Pomada para Assaduras', 25.00, 'Infantil E', '2025-05-10', 5),
('Base Hidratante', 60.00, 'Cosméticos B', '2024-12-01', 2),
('Protetor Solar', 45.00, 'Cosméticos B', '2024-10-15', 2),
('Leite em Pó', 50.00, 'Infantil E', '2025-09-05', 5);

-- 6. SELECT para produtos com valor > R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- 7. SELECT para produtos com valor entre R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

-- 8. SELECT com operador LIKE para buscar produtos com a letra "C" no nome
SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

-- 9. SELECT com INNER JOIN para unir tb_produtos e tb_categorias
SELECT 
    p.id_produto, p.nome_produto, p.preco, p.fabricante, p.validade, 
    c.nome_categoria, c.descricao_categoria
FROM 
    tb_produtos p
INNER JOIN 
    tb_categorias c
ON 
    p.id_categoria = c.id_categoria;

-- 10. SELECT com INNER JOIN para produtos de uma categoria específica (Exemplo: Cosméticos)
SELECT 
    p.id_produto, p.nome_produto, p.preco, p.fabricante, p.validade, 
    c.nome_categoria
FROM 
    tb_produtos p
INNER JOIN 
    tb_categorias c
ON 
    p.id_categoria = c.id_categoria
WHERE 
    c.nome_categoria = 'Cosméticos';
