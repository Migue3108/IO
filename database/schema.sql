-- ==========================================================
-- PROYECTO "IO" - SCRIPTS DE BASE DE DATOS SQL SERVER
-- Fase 1: Arquitectura y Base de Datos SQL Server
-- ==========================================================

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ProyectoIO_DB')
BEGIN
    CREATE DATABASE ProyectoIO_DB;
END
GO

USE ProyectoIO_DB;
GO

-- 1. Tabla de Roles
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Roles')
BEGIN
    CREATE TABLE Roles (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        NombreRol VARCHAR(50) NOT NULL UNIQUE,
        Descripcion VARCHAR(255) NULL
    );
END
GO

-- 2. Tabla de Usuarios
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Usuarios')
BEGIN
    CREATE TABLE Usuarios (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        NombreUsuario VARCHAR(50) NOT NULL UNIQUE,
        ContrasenaHash VARCHAR(255) NOT NULL,
        NombreCompleto VARCHAR(150) NOT NULL,
        RolId INT NOT NULL,
        EsActivo BIT NOT NULL DEFAULT 1,
        FechaCreacion DATETIME2 NOT NULL DEFAULT GETDATE(),
        CONSTRAINT FK_Usuarios_Roles FOREIGN KEY (RolId) REFERENCES Roles(Id)
    );
END
GO

-- 3. Tabla de Estados de Equipo
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'EstadosEquipo')
BEGIN
    CREATE TABLE EstadosEquipo (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        NombreEstado VARCHAR(50) NOT NULL UNIQUE,
        Descripcion VARCHAR(200) NULL
    );
END
GO

-- 4. Tabla de Equipos
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Equipos')
BEGIN
    CREATE TABLE Equipos (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        CodigoIdentificador VARCHAR(50) NOT NULL UNIQUE,
        Nombre VARCHAR(100) NOT NULL,
        Descripcion VARCHAR(500) NULL,
        EstadoId INT NOT NULL,
        EsActivo BIT NOT NULL DEFAULT 1,
        FechaAlta DATETIME2 NOT NULL DEFAULT GETDATE(),
        FechaBaja DATETIME2 NULL,
        UltimaModificacion DATETIME2 NOT NULL DEFAULT GETDATE(),
        CONSTRAINT FK_Equipos_Estados FOREIGN KEY (EstadoId) REFERENCES EstadosEquipo(Id)
    );
END
GO

-- 5. Índices para Búsqueda rápida (Fase 4: Búsqueda y Edición)
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Equipos_CodigoIdentificador')
BEGIN
    CREATE INDEX IX_Equipos_CodigoIdentificador ON Equipos(CodigoIdentificador);
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Equipos_Estado')
BEGIN
    CREATE INDEX IX_Equipos_Estado ON Equipos(EstadoId);
END
GO

-- 6. Tabla de Auditoría y Logs (Fase 6: Roles y Logs)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'AuditoriaLogs')
BEGIN
    CREATE TABLE AuditoriaLogs (
        Id BIGINT IDENTITY(1,1) PRIMARY KEY,
        Usuario VARCHAR(50) NOT NULL,
        Accion VARCHAR(100) NOT NULL,
        Recurso VARCHAR(100) NOT NULL,
        Detalle NVARCHAR(MAX) NULL,
        FechaHora DATETIME2 NOT NULL DEFAULT GETDATE(),
        Resultado VARCHAR(50) NOT NULL
    );
END
GO

-- ==========================================================
-- Datos iniciales (Seed Data)
-- ==========================================================
IF NOT EXISTS (SELECT 1 FROM Roles)
BEGIN
    INSERT INTO Roles (NombreRol, Descripcion) VALUES 
    ('Administrador', 'Control total sobre el sistema, usuarios y equipos'),
    ('Operador', 'Gestión de equipos, altas, bajas y consultas'),
    ('Auditor', 'Visualización de reportes, dashboard y logs');
END
GO

IF NOT EXISTS (SELECT 1 FROM EstadosEquipo)
BEGIN
    INSERT INTO EstadosEquipo (NombreEstado, Descripcion) VALUES
    ('Operativo', 'Equipo en condiciones óptimas y en funcionamiento'),
    ('En Mantenimiento', 'Equipo en revisión técnica preventiva o correctiva'),
    ('Inactivo', 'Equipo fuera de servicio temporal o dado de baja');
END
GO

IF NOT EXISTS (SELECT 1 FROM Usuarios)
BEGIN
    INSERT INTO Usuarios (NombreUsuario, ContrasenaHash, NombreCompleto, RolId, EsActivo)
    VALUES 
    ('admin', 'HASH_PASSWORD_PLACEHOLDER', 'Administrador del Sistema', 1, 1),
    ('operador', 'HASH_PASSWORD_PLACEHOLDER', 'Operador de Turno', 2, 1);
END
GO

