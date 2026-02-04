-- Tabela de Clientes e Veículos
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    CPF CHAR(11) UNIQUE
);

CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    Placa CHAR(7) UNIQUE,
    Modelo VARCHAR(45),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela de Ordem de Serviço (OS)
CREATE TABLE OrdemServico (
    idOS INT PRIMARY KEY AUTO_INCREMENT,
    DataEmissao DATE,
    ValorTotal FLOAT,
    Status ENUM('Aguardando', 'Em conserto', 'Finalizado'),
    idVeiculo INT,
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

-- Query de exemplo: Valor total por veículo (usando GROUP BY e HAVING)
SELECT idVeiculo, SUM(ValorTotal) as Gasto_Total
FROM OrdemServico
GROUP BY idVeiculo
HAVING Gasto_Total > 500;
