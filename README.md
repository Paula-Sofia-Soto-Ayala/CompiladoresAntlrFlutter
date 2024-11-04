# CompiladoresAntlrFlutter


# Inventory Management App

Esta es una aplicación de gestión de inventario desarrollada en Flutter. Permite realizar operaciones como agregar, eliminar, actualizar y buscar artículos, además de ver el inventario y el historial de cambios. La aplicación se conecta a una API alojada en Render.

## Características

- Agregar artículos al inventario
- Eliminar artículos por nombre
- Actualizar cantidad, descripción y categoría de los artículos
- Buscar artículos por nombre, descripción o categoría
- Ver el inventario completo
- Ver el historial de cambios

## Configuración del Proyecto

### Pre-requisitos

1. [Flutter](https://flutter.dev/docs/get-started/install) instalado.
2. [Firebase CLI](https://firebase.google.com/docs/cli) instalado.
3. Una cuenta en Firebase y un proyecto configurado para Firebase Hosting.

### Configuración Inicial

1. Clona el repositorio del proyecto:

   ```bash
   git clone https://github.com/tu_usuario/tu_repositorio.git
   cd tu_repositorio
   ```

2. Instala las dependencias de Flutter:

   ```bash
   flutter pub get
   ```

3. Compila la aplicación para la web:

   ```bash
   flutter build web
   ```

### Configuración de Firebase Hosting

1. Inicia sesión en Firebase CLI:

   ```bash
   firebase login
   ```

2. Inicializa Firebase Hosting en el proyecto:

   ```bash
   firebase init
   ```
   - Selecciona **Hosting** y luego el proyecto de Firebase al que quieres vincular esta aplicación.
   - Cuando te pregunte por el **directorio público**, escribe `build/web`.
   - Configura la aplicación como una SPA (Single Page Application) si se te pregunta.

3. Despliega la aplicación en Firebase Hosting:

   ```bash
   firebase deploy
   ```

## Configuración de la API

La API de gestión de inventario está alojada en Render en el siguiente URL base:

```
https://inventory-app-manager.onrender.com/inventory
```

Este URL ya está configurado en el código, por lo que no es necesario realizar ajustes adicionales.

## Uso de la Aplicación

### Operaciones Disponibles

1. **Agregar un Artículo**: Ingresa el nombre, cantidad, descripción y categoría del artículo, y haz clic en "Add Item".
2. **Eliminar un Artículo**: Ingresa el nombre del artículo y haz clic en "Remove Item".
3. **Actualizar Cantidad**: Ingresa el nombre y la nueva cantidad, y haz clic en "Update Quantity".
4. **Actualizar Descripción**: Ingresa el nombre y la nueva descripción, y haz clic en "Update Description".
5. **Actualizar Categoría**: Ingresa el nombre y la nueva categoría, y haz clic en "Update Category".
6. **Buscar por Categoría**: Ingresa la categoría y haz clic en "Search by Category".
7. **Buscar por Descripción**: Ingresa la descripción y haz clic en "Search by Description".
8. **Buscar por Nombre**: Ingresa el nombre y haz clic en "Search by Name".
9. **Mostrar Inventario**: Haz clic en "Show Inventory" para ver todos los artículos.
10. **Mostrar Historial**: Haz clic en "Show History" para ver el historial de cambios.

### Mensajes de Resultado

El resultado de cada operación (éxito o error) se mostrará en la parte inferior de la pantalla en un cuadro de texto.

## Estructura del Proyecto

- `lib/main.dart`: Contiene el código principal de la aplicación, incluyendo la interfaz de usuario y las operaciones de la API.
- `build/web`: Carpeta donde se encuentran los archivos listos para ser desplegados en Firebase Hosting después de compilar la aplicación para la web.

## Dependencias

- `http`: Para realizar solicitudes HTTP a la API de inventario.

## Despliegue en Firebase Hosting

Para desplegar la aplicación en Firebase Hosting, asegúrate de haber configurado Firebase en la raíz del proyecto y compilar la aplicación para la web.

1. Construye el proyecto para la web:

   ```bash
   flutter build web
   ```

2. Despliega en Firebase:

   ```bash
   firebase deploy
   ```

## Recursos Adicionales

- [Documentación de Flutter](https://flutter.dev/docs)
- [Documentación de Firebase](https://firebase.google.com/docs/hosting)
- [API de gestión de inventario en Render](https://inventory-app-manager.onrender.com)

