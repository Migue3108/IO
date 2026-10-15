# Backend .NET - Proyecto "IO"

Este directorio contiene la arquitectura del Backend basada en **.NET 8 / Web API REST**, de acuerdo con las especificaciones del documento de desarrollo.

## Arquitectura de Carpetas Propuesta

```
backend/
├── Controllers/            # Controladores API REST
│   ├── AuthController.cs       # Endpoints de autenticación (Login, JWT)
│   ├── EquiposController.cs    # CRUD de equipos (Altas, bajas, búsquedas, edición)
│   ├── DashboardController.cs  # Métricas y agregaciones
│   └── AuditoriaController.cs  # Logs de auditoría
├── Models/                 # Entidades y DTOs
│   ├── Entities/               # Clases mapeadas de BD (Usuario, Equipo, Rol, etc.)
│   └── DTOs/                   # Data Transfer Objects para requests y responses
├── Data/                   # Contexto de Entity Framework Core o Dapper
│   └── ApplicationDbContext.cs
├── Services/               # Lógica de negocio y servicios
│   ├── AuthService.cs          # Generación y validación de tokens JWT
│   ├── EquipoService.cs        # Reglas de negocio para equipos
│   └── AuditoriaService.cs     # Registro centralizado de logs
├── Hubs/                   # Comunicación en tiempo real (SignalR)
│   └── DashboardHub.cs         # Hub de actualizaciones en vivo
├── Middlewares/            # Middlewares personalizados (Manejo global de errores, logs)
└── Program.cs              # Configuración de servicios, autenticación JWT, Swagger y CORS
```

## Requisitos de Configuración (.NET)
- SDK de .NET 8 o superior.
- Cadena de conexión a SQL Server en `appsettings.json`.
- Configuración de claves JWT (Issuer, Audience, SecretKey).

