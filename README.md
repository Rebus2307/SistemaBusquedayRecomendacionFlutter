# Busqueda y Recomendación (Flutter)

Aplicación Flutter para la búsqueda y recomendación de libros y series, con autenticación de usuarios, favoritos y panel de administración. Este frontend **requiere** el backend disponible en [SistemaBusquedaYRecomendacionDJango](https://github.com/Rebus2307/SistemaBusquedaYRecomendacionDJango.git) para funcionar correctamente.

## Requisitos

- [Flutter](https://flutter.dev/docs/get-started/install) 3.x o superior
- [Dart](https://dart.dev/get-dart)
- Acceso a un backend Django corriendo localmente o en red (ver sección Backend)
- Dispositivo o emulador Android/iOS, o entorno web/desktop compatible

## Instalación

1. **Clona este repositorio:**
   ```sh
   git clone https://github.com/TU_USUARIO/SistemaBusquedayRecomendacionFlutter.git
   cd SistemaBusquedayRecomendacionFlutter/busquedayrecomendacion
   ```

2. **Instala las dependencias:**
   ```sh
   flutter pub get
   ```

3. **Configura el backend:**
   - Clona y sigue las instrucciones de [SistemaBusquedaYRecomendacionDJango](https://github.com/Rebus2307/SistemaBusquedaYRecomendacionDJango.git).
   - Asegúrate de que el backend esté corriendo en `http://10.0.2.2:8000` (por defecto para emuladores Android). Si usas otro host/puerto, modifica la variable `baseUrl` en [`lib/services/api_service.dart`](lib/services/api_service.dart).

4. **Ejecuta la app:**
   ```sh
   flutter run
   ```

## Estructura del Proyecto

- `lib/` - Código fuente principal de Flutter
  - `screens/` - Pantallas de la app (login, dashboard, búsqueda, favoritos, perfil, admin)
  - `services/` - Servicios para consumir la API REST del backend
  - `models/` - Modelos de datos (Libro, Serie)
- `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/` - Soporte multiplataforma

## Funcionalidades

- Registro e inicio de sesión de usuarios
- Búsqueda de libros y series
- Agregar a favoritos
- Recomendaciones personalizadas
- Edición de perfil
- Panel de administración para usuarios con permisos

## Notas

- El backend debe estar corriendo antes de iniciar la app Flutter.
- Para pruebas en emulador Android, la IP `10.0.2.2` apunta al localhost de tu máquina.
- Si usas dispositivo físico o web, ajusta la URL del backend según corresponda.

## Créditos

- Frontend Flutter: [Este repositorio](https://github.com/TU_USUARIO/SistemaBusquedayRecomendacionFlutter)
- Backend Django: [SistemaBusquedaYRecomendacionDJango](https://github.com/Rebus2307/SistemaBusquedaYRecomendacionDJango.git)

## Capturas

![LoginPhone](https://github.com/user-attachments/assets/01b4efb1-ea65-40c6-a200-4d3b46099ae3)
![DashboardPhone](https://github.com/user-attachments/assets/cfd4338d-3082-4697-ac8e-90046afdacc5)
![BuscarLibrosPhone](https://github.com/user-attachments/assets/899646e0-f7c5-482c-857e-05dfb9d07211)
![BuscarSeriesPhone](https://github.com/user-attachments/assets/1b2e2960-2a0a-4f8c-9c03-ac44c339c1fb)

---
