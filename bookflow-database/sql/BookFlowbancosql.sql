CREATE DATABASE BookFlow;

USE BookFlow;

CREATE TABLE Livro (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  autor VARCHAR(255),
  genero VARCHAR(100),
  preco DECIMAL(10, 2),
  editora VARCHAR(255),
  quantidade_em_estoque INT
);

CREATE TABLE Cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE,
  endereco TEXT,
  telefone VARCHAR(15)
);

CREATE TABLE Pedido (
  id INT AUTO_INCREMENT PRIMARY KEY,
  data_compra DATETIME,
  status VARCHAR(50),
  cliente_id INT,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE ItemPedido (
  id INT AUTO_INCREMENT PRIMARY KEY,
  quantidade INT,
  livro_id INT,
  pedido_id INT,
  FOREIGN KEY (livro_id) REFERENCES Livro(id),
  FOREIGN KEY (pedido_id) REFERENCES Pedido(id)
);

CREATE TABLE Pagamento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  valor DECIMAL(10, 2),
  data_pagamento DATETIME,
  status VARCHAR(50),
  pedido_id INT,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(id)
);

CREATE TABLE Fornecedor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  contato VARCHAR(255)
);

CREATE INDEX idx_cliente_email ON Cliente(email);
CREATE INDEX idx_pedido_data ON Pedido(data_compra);
