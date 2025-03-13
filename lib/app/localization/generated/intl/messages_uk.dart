// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uk locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'uk';

  static String m0(type) => "Додати ${type} параметри";

  static String m1(componentName) => "${componentName} вже існує";

  static String m2(variant) =>
      "Зміна стейт мененджера змінить ... на ${variant}. Дійсно бажаєте продовжити?";

  static String m3(componentName) => "Перегляд компонента ${componentName}";

  static String m4(componentName) => "Компонент ${componentName} вже існує";

  static String m5(sourceName) => " в джерелі ${sourceName}";

  static String m6(componentName) =>
      "Дійсно хочете видалити компонент ${componentName}? Це також видалить всі референсні змінні в усіх об\'єктах даних.";

  static String m7(name) => "Видалити ${name} компонент?";

  static String m8(duplicates) => "Знайдено дубликати:\n${duplicates}";

  static String m9(type) => "Редагувати ${type} параметри";

  static String m10(projectName) => "Змінити ${projectName}";

  static String m11(sourceName) =>
      "Дійсно хочете видалити джерело ${sourceName}?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "actions": MessageLookupByLibrary.simpleMessage("Дії"),
        "add": MessageLookupByLibrary.simpleMessage("Додати"),
        "addComponent":
            MessageLookupByLibrary.simpleMessage("Додати компонент"),
        "addDataComponents":
            MessageLookupByLibrary.simpleMessage("Компоненти Даних"),
        "addField": MessageLookupByLibrary.simpleMessage("Додати поле"),
        "addFlavors": MessageLookupByLibrary.simpleMessage("Додати флавори:"),
        "addFromJson": MessageLookupByLibrary.simpleMessage("Додати з JSON"),
        "addParam": MessageLookupByLibrary.simpleMessage("Додати параметр"),
        "addParamFailureTitle":
            MessageLookupByLibrary.simpleMessage("Не вдалося додати параметр"),
        "addParams": m0,
        "addRequest": MessageLookupByLibrary.simpleMessage("Додати запит"),
        "addScreen": MessageLookupByLibrary.simpleMessage("Додати екран"),
        "addSource": MessageLookupByLibrary.simpleMessage("Додати джерело"),
        "addVariable": MessageLookupByLibrary.simpleMessage("Додати змінну"),
        "addVariableFailureTitle":
            MessageLookupByLibrary.simpleMessage("Не вдалося додати змінну"),
        "alreadyExistsError": m1,
        "alsoReadThis":
            MessageLookupByLibrary.simpleMessage("Також прочитайте це"),
        "apiFailureNoNetwork": MessageLookupByLibrary.simpleMessage(
            "Вибачте, виникла проблема з підключенням. Будь ласка, перевірте інтернет з\'єднання та спробуйте ще раз.\n\nЯкщо проблема не вирішилась - зверніться до техпідтримки."),
        "apiFailureTooManyRequests": MessageLookupByLibrary.simpleMessage(
            "Ой! Схоже, що в нас проблема з цим запитом. Будь ласка, спробуйте ще раз.\n\nЯкщо проблема не вирішилась - зверніться до техпідтримки."),
        "apiFailureUnAuthorized": MessageLookupByLibrary.simpleMessage(
            "Ім\'я користувача або пароль не вірний."),
        "apiFailureUndefined": MessageLookupByLibrary.simpleMessage(
            "Ой! Схоже, що в нас проблема з цим запитом. Будь ласка, спробуйте ще раз.\n\nЯкщо проблема не вирішилась - зверніться до техпідтримки."),
        "cancel": MessageLookupByLibrary.simpleMessage("Відміна"),
        "changeStateManagerError": MessageLookupByLibrary.simpleMessage(
            "Попередження зміни стейт менеджера"),
        "changeStateManagerErrorContent": m2,
        "checkNamesContentFirstPart":
            MessageLookupByLibrary.simpleMessage("Назва проекту\n"),
        "checkNamesContentLastPart":
            MessageLookupByLibrary.simpleMessage("\nвас влаштовують?"),
        "checkNamesContentSecondPart":
            MessageLookupByLibrary.simpleMessage("\nта організація\n"),
        "checkNamesTitle": MessageLookupByLibrary.simpleMessage(
            "Перевірте назву проекту та організацію перед тим, як продовжити"),
        "cityOrLocality":
            MessageLookupByLibrary.simpleMessage(" Місто або локація"),
        "clear": MessageLookupByLibrary.simpleMessage("Очистити"),
        "colorStyles": MessageLookupByLibrary.simpleMessage("Кольори"),
        "componentName":
            MessageLookupByLibrary.simpleMessage("Назва компонента"),
        "componentNamePlaceholder":
            MessageLookupByLibrary.simpleMessage("Назва компонента"),
        "componentPreview": m3,
        "continueLabel": MessageLookupByLibrary.simpleMessage("Продовжити"),
        "createRequestCheckboxLabel":
            MessageLookupByLibrary.simpleMessage("Створити запит?"),
        "createResponseCheckboxLabel":
            MessageLookupByLibrary.simpleMessage("Створити відповідь?"),
        "dataComponent":
            MessageLookupByLibrary.simpleMessage("Компонент даних"),
        "dataComponentExistsError": m4,
        "dataComponentExistsInSource": m5,
        "dataComponents":
            MessageLookupByLibrary.simpleMessage("Компоненти даних"),
        "delete": MessageLookupByLibrary.simpleMessage("Видалити"),
        "deleteComponent":
            MessageLookupByLibrary.simpleMessage("Видалити компонент?"),
        "deleteComponentConfirmation": m6,
        "deleteConcreteComponent": m7,
        "deleteRequest": MessageLookupByLibrary.simpleMessage("Видалити запит"),
        "dialogWillOpenInSeparateWindow": MessageLookupByLibrary.simpleMessage(
            "(Діалог видкріється в окремому вікні)"),
        "duplicatesFoundError": m8,
        "edit": MessageLookupByLibrary.simpleMessage("Редагувати"),
        "editParams": m9,
        "empty": MessageLookupByLibrary.simpleMessage("Пусто"),
        "emptyConfigContent": MessageLookupByLibrary.simpleMessage(
            "Файл конфіга вітсутній або невірний! Перевірте, чи був відкритий проект згенерований за допомогою Onix Flutter Project Generator"),
        "emptyConfigTitle": MessageLookupByLibrary.simpleMessage(
            "Помилка читання файлу конфіга!"),
        "enterProjectName":
            MessageLookupByLibrary.simpleMessage("Введіть Ім\'я Проекту"),
        "error": MessageLookupByLibrary.simpleMessage("Помилка"),
        "exitLabel": MessageLookupByLibrary.simpleMessage("Вийти"),
        "fields": MessageLookupByLibrary.simpleMessage("Поля"),
        "figmaFileKey":
            MessageLookupByLibrary.simpleMessage("Ключ файлу Figma"),
        "figmaGetStylesEmpty": MessageLookupByLibrary.simpleMessage(
            "В цьому figma файлі не знайдено стилів"),
        "figmaGetStylesEmptyFileId":
            MessageLookupByLibrary.simpleMessage("Figma id пустий"),
        "figmaGetStylesEmptyToken":
            MessageLookupByLibrary.simpleMessage("Figma token пустий"),
        "figmaGetStylesError": MessageLookupByLibrary.simpleMessage(
            "Помилка завантаження стилів: перевірте інтернет з\'єднання, id figma файлу та токен"),
        "figmaToken": MessageLookupByLibrary.simpleMessage("Токен Figma"),
        "firebaseAuth": MessageLookupByLibrary.simpleMessage(
            "Інтегрувати Firebase з FirebaseAuth?"),
        "firstLastName":
            MessageLookupByLibrary.simpleMessage(" Ім\'я та прізвище"),
        "flavorName": MessageLookupByLibrary.simpleMessage("Назва флавора"),
        "flavorize":
            MessageLookupByLibrary.simpleMessage("Генерувати флавори?"),
        "flavors": MessageLookupByLibrary.simpleMessage("Флавори"),
        "generate": MessageLookupByLibrary.simpleMessage("Генерувати"),
        "generateAndroidSigning": MessageLookupByLibrary.simpleMessage(
            "Сконфігурувати підпис Android"),
        "generateFlavors":
            MessageLookupByLibrary.simpleMessage("Генерувати флавори"),
        "generateNewProject":
            MessageLookupByLibrary.simpleMessage("Створити новий проект"),
        "generateProject":
            MessageLookupByLibrary.simpleMessage("Створити проект"),
        "generateScreens":
            MessageLookupByLibrary.simpleMessage("Генерувати екрани"),
        "generateSigningKey":
            MessageLookupByLibrary.simpleMessage("Згенерувати ключ підпису?"),
        "generateSonarConfig":
            MessageLookupByLibrary.simpleMessage("Згенерувати конфіг Sonar?"),
        "getFromSwagger":
            MessageLookupByLibrary.simpleMessage("Отримати з свагера"),
        "getStyles": MessageLookupByLibrary.simpleMessage("Імпортувати"),
        "getStylesFromFigma":
            MessageLookupByLibrary.simpleMessage("Отримати стилі з Figma"),
        "gitPermissionsContent": MessageLookupByLibrary.simpleMessage(
            "Помилка доступу до Git! Перевірте, чи встановлений git та чи маєте ви права доступу до репозиторія або спробуйте додати ключ від git в Ключар."),
        "gitPermissionsTitle":
            MessageLookupByLibrary.simpleMessage("Помилка доступу до Git!"),
        "goBack": MessageLookupByLibrary.simpleMessage("Назад"),
        "ignore": MessageLookupByLibrary.simpleMessage("Ігнорувати"),
        "importApi":
            MessageLookupByLibrary.simpleMessage("Імпортувати запити REST API"),
        "importStyles":
            MessageLookupByLibrary.simpleMessage("Імпортувати Стилі"),
        "initial": MessageLookupByLibrary.simpleMessage("Початковий екран?"),
        "integrateGraphQl":
            MessageLookupByLibrary.simpleMessage("Інтегрувати GraphQL?"),
        "integrateSentry":
            MessageLookupByLibrary.simpleMessage("Інтегрувати Sentry?"),
        "keyStorePasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Залиште пустим для автогенерації..."),
        "keystorePassword":
            MessageLookupByLibrary.simpleMessage(" Пароль до сховища ключів"),
        "list": MessageLookupByLibrary.simpleMessage("Список"),
        "localization": MessageLookupByLibrary.simpleMessage("Локалізація"),
        "localizationMethod":
            MessageLookupByLibrary.simpleMessage("Метод локалізації"),
        "masonBrickSource":
            MessageLookupByLibrary.simpleMessage("Гілка Mason Brick"),
        "modify": MessageLookupByLibrary.simpleMessage("Змінити"),
        "modifyComponent":
            MessageLookupByLibrary.simpleMessage("Змінити компонент"),
        "modifyGeneratedProject": m10,
        "modifyScreen": MessageLookupByLibrary.simpleMessage("Змінити екран"),
        "modifySigningVars":
            MessageLookupByLibrary.simpleMessage("Змінити дані підпису..."),
        "modifySource": MessageLookupByLibrary.simpleMessage("Змінити джерело"),
        "navigationRouter":
            MessageLookupByLibrary.simpleMessage("Навігаційний роутер"),
        "newVersionAvailableContent": MessageLookupByLibrary.simpleMessage(
            "Доступна нова версія Onix Flutter Project Generator. Хочете її завантажити?"),
        "newVersionAvailableTitle":
            MessageLookupByLibrary.simpleMessage("Доступна нова версія"),
        "no": MessageLookupByLibrary.simpleMessage("Ні"),
        "noDataComponents":
            MessageLookupByLibrary.simpleMessage("Компоненти не знайдено"),
        "noInputParameters":
            MessageLookupByLibrary.simpleMessage("Немає вхідних параметрів"),
        "noRequests": MessageLookupByLibrary.simpleMessage("Немає запитів"),
        "nullable": MessageLookupByLibrary.simpleMessage("Опціональне"),
        "objects": MessageLookupByLibrary.simpleMessage("Об\'єкти"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "openExistingProject":
            MessageLookupByLibrary.simpleMessage("Відкрити існуючий проект"),
        "openInAndroidStudio":
            MessageLookupByLibrary.simpleMessage("Відкрити в Android Studio"),
        "or": MessageLookupByLibrary.simpleMessage("або"),
        "organization": MessageLookupByLibrary.simpleMessage("Організація"),
        "organizationNameHelperText": MessageLookupByLibrary.simpleMessage(
            "Цифра не може бути першим символом у сегменті пакету. У пакеті повинен бути хоча б один роздільник \'.\'. Кілька символів \'.\' підряд не допускаються."),
        "organizationalUnit":
            MessageLookupByLibrary.simpleMessage(" Організаційний підрозділ"),
        "overwrite": MessageLookupByLibrary.simpleMessage("Перезаписати"),
        "parseErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Не вдалося отримати компоненти Swagger. Спробуйте знову або зв\'яжіться з підтримкою, якщо не вдається отримати компоненти."),
        "pasteJsonHere":
            MessageLookupByLibrary.simpleMessage("Вставте JSON сюди"),
        "path": MessageLookupByLibrary.simpleMessage("Шлях"),
        "pathNotSelectedContent": MessageLookupByLibrary.simpleMessage(
            "Будь ласка, виберіть шлях до проекту"),
        "pathNotSelectedTitle":
            MessageLookupByLibrary.simpleMessage("Шлях до проекту не вибрано"),
        "placeURLTitle":
            MessageLookupByLibrary.simpleMessage("Вставте URL сюди"),
        "platforms": MessageLookupByLibrary.simpleMessage("Платформи"),
        "preview": MessageLookupByLibrary.simpleMessage("Перегляд"),
        "projectArch":
            MessageLookupByLibrary.simpleMessage("Архітектура проекту"),
        "projectExistsError": MessageLookupByLibrary.simpleMessage(
            "Проект з такою назвою вже існує"),
        "projectName": MessageLookupByLibrary.simpleMessage("Назва проекту"),
        "projectNameHelperText": MessageLookupByLibrary.simpleMessage(
            "Назва проєкту має бути повністю маленькими літерами, з підкресленнями, щоб відокремити слова. Також переконайтеся, що назва є дійсним ідентифікатором Dart - вона не починається з цифр, не є зарезервованим словом, не починається і не закінчується символом підкреслення"),
        "projectPath": MessageLookupByLibrary.simpleMessage("Шлях до проекту"),
        "projectSelectErrorMessage":
            MessageLookupByLibrary.simpleMessage("Pubspec файл не знайдено."),
        "projectSelectErrorTitle":
            MessageLookupByLibrary.simpleMessage("Не папка з проектом Flutter"),
        "replace": MessageLookupByLibrary.simpleMessage("Замінити"),
        "request": MessageLookupByLibrary.simpleMessage("Запит"),
        "requestBodyMultipartConflict": MessageLookupByLibrary.simpleMessage(
            "Ви додали одночасно body і multipart body. Multipart body буде згенеровано, але проігноровано у запиті."),
        "response": MessageLookupByLibrary.simpleMessage("Відповідь"),
        "retry": MessageLookupByLibrary.simpleMessage("Повторити"),
        "router": MessageLookupByLibrary.simpleMessage("Роутер"),
        "screenAlreadyExistsContent": MessageLookupByLibrary.simpleMessage(
            "Екран з такою назвою вже існує"),
        "screenAlreadyExistsTitle":
            MessageLookupByLibrary.simpleMessage("Вже є"),
        "screenClassNameHelperText": MessageLookupByLibrary.simpleMessage(
            "Перший символ у назві класу має бути літерою"),
        "screenName": MessageLookupByLibrary.simpleMessage("Назва екрану"),
        "screens": MessageLookupByLibrary.simpleMessage("Екрани"),
        "searchPrompt": MessageLookupByLibrary.simpleMessage("Пошук..."),
        "selectProjectFolder":
            MessageLookupByLibrary.simpleMessage("Onix Project Generator"),
        "selectProjectPlatforms":
            MessageLookupByLibrary.simpleMessage("Виберіть Платформи"),
        "selectProjectScreens":
            MessageLookupByLibrary.simpleMessage("Генерація Екранів"),
        "selectProjectSetting":
            MessageLookupByLibrary.simpleMessage("Налаштування Проекту"),
        "signingErrorException": MessageLookupByLibrary.simpleMessage(
            "Не вдалося завершити конфігурацію підпису. Перевірте чи ваш проект містить папку android та чи вона відповідає проекту Android?"),
        "signingErrorExist": MessageLookupByLibrary.simpleMessage(
            "Не вдалося завершити конфігурацію підпису. Сертифікат або конфігурація вже існує."),
        "signingErrorParams": MessageLookupByLibrary.simpleMessage(
            "Не вдалося завершити конфігурацію підпису. Відбулась внутрішня помилка, зв\'яжіться з розробником."),
        "signingToolSuccessText": MessageLookupByLibrary.simpleMessage(
            "Сертифікат та конфігурація підпису додана до проекту."),
        "signingToolTitle":
            MessageLookupByLibrary.simpleMessage("Сертифікат підпису Android"),
        "signingVars": MessageLookupByLibrary.simpleMessage("Дані підпису"),
        "sourceDeletingDialogTitle": m11,
        "sourceNamePlaceholder":
            MessageLookupByLibrary.simpleMessage("Назва джерела"),
        "sourceNotFound":
            MessageLookupByLibrary.simpleMessage("Джерело не знайдено"),
        "sources": MessageLookupByLibrary.simpleMessage("Джерела"),
        "spaceSeparated":
            MessageLookupByLibrary.simpleMessage("(розділяти пробілами)"),
        "standaloneDataComponents": MessageLookupByLibrary.simpleMessage(
            "Самостійні компоненти даних:"),
        "stateManager": MessageLookupByLibrary.simpleMessage("Менеджер стану"),
        "stateOrProvince":
            MessageLookupByLibrary.simpleMessage(" Штат або провінція"),
        "summary": MessageLookupByLibrary.simpleMessage("Підсумки"),
        "swaggerParserPrompt": MessageLookupByLibrary.simpleMessage(
            "Вставте посилання на json файл конфігу свагера сюди для отримання компонентів від API\nабо залиште пустим для продовженя без інтеграції API"),
        "swaggerParserScreenConflictError": MessageLookupByLibrary.simpleMessage(
            "Файл Свагера містить компоненти, що конфліктують з тими що є. Замінити зпарсеними компоненами або ігнорувати конфліктуючі дані?"),
        "swaggerURL": MessageLookupByLibrary.simpleMessage("Swagger URL"),
        "textStyles": MessageLookupByLibrary.simpleMessage("Стилі тексту"),
        "theming": MessageLookupByLibrary.simpleMessage("Темізація"),
        "title": MessageLookupByLibrary.simpleMessage(
            "Onix Flutter Project Generator"),
        "tools": MessageLookupByLibrary.simpleMessage("Інструменти"),
        "twoLetterCountryCode":
            MessageLookupByLibrary.simpleMessage(" Двохлітерний код країни"),
        "unUsed": MessageLookupByLibrary.simpleMessage("Не використано"),
        "url": MessageLookupByLibrary.simpleMessage("URL"),
        "useScreenUtil": MessageLookupByLibrary.simpleMessage(
            "Використовувати Screen Util?"),
        "useSonar": MessageLookupByLibrary.simpleMessage("Підключити Sonar?"),
        "usingBloc": MessageLookupByLibrary.simpleMessage("Використати BLoC"),
        "usingCubit": MessageLookupByLibrary.simpleMessage("Використати Cubit"),
        "variableName": MessageLookupByLibrary.simpleMessage("Назва змінної"),
        "warning": MessageLookupByLibrary.simpleMessage("Увага"),
        "willBeAddedAutomatically": MessageLookupByLibrary.simpleMessage(
            "DEV та PROD флавори будуть додані автоматично"),
        "withComponents":
            MessageLookupByLibrary.simpleMessage("З компонентами"),
        "wrongScreenNameContent": MessageLookupByLibrary.simpleMessage(
            "Назва екрану не має починатися з цифри та бути \'Screen\' або \'screen\'."),
        "wrongScreenNameTitle":
            MessageLookupByLibrary.simpleMessage("Невірна назва екрану"),
        "yes": MessageLookupByLibrary.simpleMessage("Так")
      };
}
