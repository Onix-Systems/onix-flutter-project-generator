<div align="center">
<a href="https://onix-systems.com/">
    <img alt="refine logo" src="../../../images/banner_top.jpg">
</a>

<br/>
<br/>
</div>


# File generation

Main file generation code placed in `lib/domain/service/file_generator_service/file_generator_service.dart` file.

Overall generation code split to separate files for different needs:

* Data components generator
* Screens generator
* Signing generator
* Sources generator
* Style generator


## Data components generator

This classes generating data components, like request/response models, entities, repositories, remote sources.

### Components class generator

Designed to create entities and other `freezed` based classes.

File: `lib/domain/service/file_generator_service/data_component_generators/component_class_generator.dart`

### Components enum generator

Designed to create enum classes.

File: `lib/domain/service/file_generator_service/data_component_generators/component_enum_generator.dart`

### Mapper generator

Designed to create mapper classes to map request/response models to entities.

File: `lib/domain/service/file_generator_service/data_component_generators/mapper_generator.dart`

### Request generator

Designed to create map request models to entities and classes with `json_annotation`.

File: `lib/domain/service/file_generator_service/data_component_generators/request_generator.dart`

### Response generator

Designed to create map response models to entities and classes where `json_annotition` used.

File: `lib/domain/service/file_generator_service/data_component_generators/response_generator.dart`

## Screen generator

Screen generator designed to generate screen files, BLoC/Cubit files, Navigation routes nad SL declarations.

Main generator file: `lib/domain/service/file_generator_service/screen_generators/screen_generator.dart`
Code generation placed in `lib/domain/service/file_generator_service/screen_generators/gen/screen_code_content.dart`
and consist of functions:

* Generate screen class;
* Generate BLoC/Cubit and models;
* Inject SL declaration;
* Inject navigation declarations;

## Signing generator

Screen generator designed to create Android signing configuration.

Main generator file: `lib/domain/service/file_generator_service/signing_generator/signing_generator.dart`

Signing generator creates:

* Keystore;
* Signing configuration file;
* Modifies `build.gradle` to support signing;

## Source generator

Source generator designed to create remote sources, repositories and their SL declarations.

Main generator file: `lib/domain/service/file_generator_service/source_generators/data_layer_generator.dart`

Source generator consist of:

* SL generator (to inject SL declarations) `lib/domain/service/file_generator_service/source_generators/component_generator/di_generator.dart`
* Method generator (to generate source functions) `lib/domain/service/file_generator_service/source_generators/component_generator/method_generator.dart`
* Repository generator (to generate repositories) `lib/domain/service/file_generator_service/source_generators/component_generator/repository_files_generator.dart`
* Source generator (to generate sources) `lib/domain/service/file_generator_service/source_generators/component_generator/source_files_generator.dart`

## Style generator

Style generator designed to create styling, themes and color files.

Main styles generator file: `lib/domain/service/file_generator_service/style_generator/styles_generator.dart`

Style generator consist of:

* Colors generator (create file with colors) `lib/domain/service/file_generator_service/style_generator/colors_generator.dart`
* Text Styles generator (create file with text styles) `lib/domain/service/file_generator_service/style_generator/theme_text_styles_generator.dart`
* Themes generator (create theme file) `lib/domain/service/file_generator_service/style_generator/theme_colors_generator.dart`



