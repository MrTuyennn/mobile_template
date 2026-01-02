# Flutter Monorepo Template

A Flutter monorepo project template using [Melos](https://melos.invertase.dev/) for workspace management. This template provides a scalable structure for building Flutter applications with shared packages and assets.

## 📁 Project Structure

```
template_mobile/
├── app/                    # Main Flutter application
│   ├── lib/
│   ├── android/
│   ├── ios/
│   ├── web/
│   ├── macos/
│   ├── linux/
│   └── windows/
├── packages/               # Feature packages
│   └── core/              # Core business logic package
├── shared/                 # Shared packages across projects
│   ├── assets/            # Assets package (fonts, images, etc.)
│   └── theme/             # Theme package
├── melos.yaml             # Melos workspace configuration
└── pubspec.yaml           # Root workspace configuration
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.10.1)
- Dart SDK (>=3.0.0 <4.0.0)
- Melos CLI

### Installation

1. **Install Melos globally:**
   ```bash
   dart pub global activate melos
   ```

2. **Bootstrap the workspace:**
   ```bash
   melos bootstrap
   ```
   This command will:
   - Install all dependencies for all packages
   - Link local packages together
   - Run any setup scripts

3. **Generate assets:**
   ```bash
   melos run gen_assets
   ```
   This will regenerate asset files using `flutter_gen`.

## 📦 Packages

### App (`app/`)

The main Flutter application that consumes all packages.

**Dependencies:**
- `core` - Core business logic
- `assets` - Shared assets (fonts, images)

### Core (`packages/core/`)

Core business logic and utilities shared across the application.

**Example usage:**
```dart
import 'package:core/core.dart';

final calculator = Calculator();
print(calculator.hello()); // 'hello from core'
```

### Assets (`shared/assets/`)

Shared assets package containing fonts, images, and other resources.

**Features:**
- Font management (Quicksand, ResIcons)
- Asset path generation via `flutter_gen`
- Font loading utilities

**Fonts included:**
- **Quicksand**: Light (300), Regular (400), Medium (500), SemiBold (600), Bold (700)
- **ResIcons**: Icon font

**Usage:**
```dart
import 'package:assets/assets.dart';

// Use generated font family
TextStyle(
  fontFamily: FontFamily.quicksand,
  fontSize: 16,
)

// Or use helper function
TextStyle style = quicksand(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

// Use generated asset paths
String fontPath = ResAssets.fonts.quicksandBold;
```

**Generated files:**
- `assets.gen.dart` - Asset paths
- `fonts.gen.dart` - Font family constants

### Theme (`shared/theme/`)

Shared theme package for consistent styling across applications.

## 🛠️ Development

### Running the App

```bash
cd app
flutter run
```

### Running Tests

Run tests for all packages:
```bash
melos test
```

Run tests for a specific package:
```bash
cd packages/core
flutter test
```

### Code Generation

Generate assets using `flutter_gen`:
```bash
melos run gen_assets
```

Or manually:
```bash
cd shared/assets
flutter pub run build_runner build
```

### Linting

Check code style across all packages:
```bash
melos run analyze
```

## 📝 Melos Scripts

Available Melos scripts defined in `melos.yaml`:

- `gen_assets` - Regenerate asset files using flutter_gen

## 🔧 Adding New Packages

1. **Create a new package:**
   ```bash
   flutter create --template=package packages/your_package_name
   ```

2. **Add to `melos.yaml`:**
   ```yaml
   packages:
     - packages/**
     - shared/**
   ```

3. **Link in your app's `pubspec.yaml`:**
   ```yaml
   dependencies:
     your_package_name:
       path: ../packages/your_package_name
   ```

4. **Bootstrap:**
   ```bash
   melos bootstrap
   ```

## 📚 Key Technologies

- **Melos**: Monorepo management tool
- **Flutter Gen**: Asset code generation
- **Flutter Lints**: Code linting and analysis

## 🎨 Assets Management

Assets are managed through the `shared/assets` package:

1. **Add fonts**: Place font files in `shared/assets/fonts/`
2. **Update `pubspec.yaml`**: Add font configuration
3. **Generate code**: Run `melos run gen_assets`
4. **Use in code**: Import and use generated constants

## 📄 License

[Add your license here]

## 🤝 Contributing

[Add contributing guidelines here]

## 📞 Support

[Add support information here]

