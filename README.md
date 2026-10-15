# IO - Sistema de Gestión Operativa

Plataforma empresarial para la administración, búsqueda, monitoreo en tiempo real y auditoría de inventario de equipos.

## 🛠️ Tecnologías del Sistema (Documentación Oficial)

| Elemento | Definición | Estado Actual |
| :--- | :--- | :--- |
| **Frontend** | Angular (v19/v20 Standalone) | ✅ Implementado (3 pantallas + Mock) |
| **Backend** | .NET 8 / Web API REST | 📁 Estructura base preparada |
| **Base de datos** | SQL Server | 📁 Scripts DDL y esquema creados |
| **Seguridad** | Autenticación y Autorización JWT y roles | ✅ Simulado con Mock Service + Guard |
| **Tiempo real** | SignalR / WebSockets para Dashboard | 📋 Especificado en Fase 5 |

---

## 📂 Estructura del Repositorio

```
IO/
├── Documentacion_Cronograma_Desarrollo_IO.pdf  # Documento oficial del plan de desarrollo
├── database/                                  # Scripts para Microsoft SQL Server
│   └── schema.sql                             # DDL de tablas, relaciones, roles e índices
├── backend/                                   # Arquitectura para la API .NET
│   └── README.md                              # Estructura de controladores, DTOs y servicios
├── frontend/                                  # Aplicación Angular
│   ├── src/
│   │   ├── app/
│   │   │   ├── core/
│   │   │   │   ├── guards/
│   │   │   │   │   └── auth.guard.ts         # Protección de rutas privadas
│   │   │   │   ├── models/
│   │   │   │   │   └── user.model.ts         # Interfaces de usuario y respuestas
│   │   │   │   └── services/
│   │   │   │       └── mock-auth.service.ts  # Servicio Mock con simulación JWT
│   │   │   ├── pages/
│   │   │   │   ├── landing/                  # 1. Página de entrada / presentación
│   │   │   │   ├── login/                    # 2. Login (solo usuario y contraseña)
│   │   │   │   └── welcome/                  # 3. Bienvenido al sistema
│   │   │   ├── app.routes.ts                 # Rutas de la aplicación
│   │   │   └── app.ts                        # Componente raíz
│   │   └── styles.css                        # Estilos globales y tema visual
│   └── package.json
└── README.md
```

---

## 🖥️ Páginas del Frontend Implementadas

1. **Página de Entrada / Presentación (`/inicio`)**:
   - Da detalles completos del sistema "IO", sus capacidades, equipo y cronograma.
   - Cuenta con botón destacado para ingresar al sistema.
2. **Inicio de Sesión (`/login`)**:
   - Cumple con la restricción de **no permitir la creación de usuarios**; cuenta únicamente con los campos de **Usuario** y **Contraseña**.
   - Integrado con el **Mock de Autenticación** y validación reactiva de formularios.
   - Incluye accesos rápidos de prueba con usuarios mock para facilitar la evaluación.
3. **Bienvenida al Sistema (`/bienvenida`)**:
   - Pantalla privada protegida por `authGuard`.
   - Muestra bienvenida personalizada con nombre, usuario y rol asignado.
   - Permite visualizar y copiar el token JWT generado por el Mock.
   - Resumen interactivo de módulos del cronograma y botón de cerrar sesión.

---

## 🔑 Credenciales para el Mock de Autenticación

| Usuario | Contraseña | Rol | Nombre |
| :--- | :--- | :--- | :--- |
| `admin` | `password123` | Administrador | Ángel Administrador |
| `miguel` | `password123` | QA Lead | Miguel (Líder QA) |
| `operador` | `password123` | Operador | Emiliano Operador |

*(Nota: En la pantalla de login puedes hacer clic directamente en cualquiera de las tarjetas de usuario para rellenar las credenciales automáticamente).*

---

## 🚀 Cómo Ejecutar el Frontend

1. Dirígete a la carpeta `frontend`:
   ```powershell
   cd frontend
   ```
2. Inicia el servidor de desarrollo:
   ```powershell
   npm start
   ```
3. Abre tu navegador en [http://localhost:4200](http://localhost:4200).

>>>>>>> 845f5b2 (feat: initial commit - sistema de gestion operativa IO)
