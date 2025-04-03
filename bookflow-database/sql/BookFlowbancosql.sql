CREATE TABLE Turma (
    CodigoTurma INT PRIMARY KEY,
    CodigoMateria INT NOT NULL,
    Ano INT NOT NULL,
    CodigoTurmaProfessor INT NOT NULL,
    CONSTRAINT fk_CodigoMateria FOREIGN KEY (CodigoMateria) REFERENCES Materia(CodigoMateria),
    CONSTRAINT fk_CodigoProfessor FOREIGN KEY (CodigoTurmaProfessor) REFERENCES Professor(CodigoProfessor)
);
