# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users

Colaboradores y operadores autorizados de la organización que requieren consultar, administrar y verificar el estado de los equipos e infraestructura corporativa con rapidez y exactitud.

## Product Purpose

El Sistema "IO" es un software de gestión operativa concebido para centralizar el ciclo de vida del inventario de equipos, garantizando trazabilidad total, monitoreo en tiempo real y control riguroso de accesos sin fricción innecesaria. El éxito del producto radica en una experiencia clara, confiable y sin ruido visual.

## Positioning

Una plataforma de gestión operativa empresarial que combina una arquitectura en tres capas (.NET Web API, Angular y SQL Server) con una estética editorial de alta gama (inspirada en Roland Berger y la paleta Pizarra Urbana de Figma), alejándose de interfaces sobrecargadas o genéricas.

## Operating Context

Entornos corporativos de oficina y áreas de control donde los usuarios acceden desde estaciones de trabajo de escritorio para consultar catálogos de equipos, tramitar altas/bajas operacionales y monitorear dashboards con actualizaciones automáticas en vivo.

## Capabilities and Constraints

- **Stack Tecnológico:** Frontend en Angular (Standalone, TypeScript), Backend en .NET 8 Web API REST y persistencia en Microsoft SQL Server.
- **Seguridad:** Autenticación y autorización basada en JWT y roles de usuario; actualmente simulada mediante un servicio Mock en desarrollo.
- **Acceso:** Formulario de inicio de sesión estricto que admite únicamente campos de usuario y contraseña (sin registro abierto de usuarios).
- **Flujos Clave Confirmados:**
  1. Portal de bienvenida e información sobria del sistema.
  2. Autenticación con Mock y redirección protegida.
  3. Gestión integral de inventario (altas, bajas lógicas y búsqueda/edición).
  4. Monitoreo en tiempo real (SignalR).
  5. Registro centralizado de auditoría y logs.

## Brand Commitments

- **Nombre:** Sistema "IO" - Gestión Operativa.
- **Línea Visual:** Monochrome Product Marketing (diseño editorial de alto contraste, sobrio, sin color ni artificios técnicos).
- **Paleta de Color Institucional:**
  - Lienzo central: Blanco puro (`#FFFFFF`).
  - Base y fondo: Gris neutro tenue (`#F5F5F5`).
  - Tipografía y elementos de acción: Negro absoluto (`#0A0A0A`) y gris medio (`#525252`).
  - Bordes y separadores: Líneas sutiles (`#E5E5E5`).
- **Regla Fundamental:** Eliminar cualquier dato de arquitectura, seguridad o estado técnico en la interfaz del usuario. Mantener la pantalla limpia, funcional y directa.

## Evidence on Hand

- `Documentacion_Cronograma_Desarrollo_IO.pdf`: Documento técnico oficial con el plan de 9 fases del cronograma.
- `database/schema.sql`: Script DDL con tablas de Usuarios, Roles, Equipos, Estados y Auditoría.
- `frontend/`: Aplicación Angular funcional con componentes `LandingComponent`, `LoginComponent` y `WelcomeComponent`.

## Product Principles

1. **Claridad sobre Ruido:** Cada pantalla debe comunicar su propósito esencial sin saturación de datos irrelevantes o adornos superfluos.
2. **Centro Luminoso y Enfoque:** Preservar la jerarquía visual con el contenido nuclear y los elementos de acción en los tonos más claros.
3. **Seguridad y Trazabilidad:** Ninguna operación ocurre sin validación ni registro auditable.
4. **Respuesta Inmediata:** Transiciones fluidas, retroalimentación instantánea de errores y estados de carga claros.

## Accessibility & Inclusion

Cumplimiento de estándares de contraste visual según WCAG AA entre los textos carbón `#5E5653` y el fondo claro `#E9E6E7`, soporte para navegación por teclado y formularios estructurados con etiquetas accesibles.

