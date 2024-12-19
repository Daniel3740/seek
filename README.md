# seek
Prueba técnica Seek

# Flutter Task Management App

Esta aplicación es un gestor de tareas desarrollado con Flutter que permite crear, gestionar y filtrar tareas.

## Requisitos previos 📋

Antes de comenzar, asegúrate de tener instalado:

- [Flutter](https://flutter.dev/docs/get-started/install) (2.0.0 o superior)
- [Dart](https://dart.dev/get-dart) (2.12.0 o superior)
- [Git](https://git-scm.com/downloads)
- Un IDE compatible (VS Code, Android Studio, o IntelliJ)

## Configuración inicial 🚀

### 1. Clonar el repositorio

```bash
git clone https://github.com/Daniel3740/seek.git
cd nombre-del-repo
```

### 2. Instalar dependencias

Ejecuta el siguiente comando para instalar todas las dependencias del proyecto:

```bash
flutter pub get
```

### 3. Generar código

Este proyecto utiliza code generation. Ejecuta el build_runner para generar los archivos necesarios:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Para watch mode durante el desarrollo:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Ejecutar la aplicación 🏃‍♂️

### Desarrollo

Para ejecutar la aplicación en modo debug:

```bash
flutter run
```

### Tests

Para ejecutar todos los tests:

```bash
flutter test
```

Para ejecutar tests con coverage:

```bash
flutter test --coverage
flutter pub run test_cov_console
```

## Estructura del proyecto 📁

```
lib/
├── application/      # Lógica de negocio y providers
├── domain/          # Modelos y entidades
├── infrastructure/   # Implementaciones de repositorios
└── presentation/    # UI y widgets
```

## Solución de problemas comunes 🔧

1. **Error en build_runner**
   ```bash
   flutter clean
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

2. **Problemas con dependencias**
   ```bash
   flutter pub cache repair
   flutter pub get
   ```

## Contribuir 🤝

1. Crear una rama para tu feature: `git checkout -b feature/amazing-feature`
2. Commit de tus cambios: `git commit -m 'Add amazing feature'`
3. Push a la rama: `git push origin feature/amazing-feature`
4. Crear un Pull Request

## Versionamiento 📌

Usamos [SemVer](http://semver.org/) para el versionamiento. Para ver las versiones disponibles, mira los [tags en este repositorio](https://github.com/Daniel3740/seek/tags).

## Licencia 📄

Este proyecto está bajo la Licencia MIT - mira el archivo [LICENSE.md](LICENSE.md) para detalles