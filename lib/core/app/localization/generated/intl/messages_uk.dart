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

  static String m0(componentName) => "Перегляд компонента ${componentName}";

  static String m1(componentName) => "Компонент ${componentName} вже існує";

  static String m2(sourceName) => " в джерелі ${sourceName}";

  static String m3(componentName) =>
      "Дійсно хочете видалити компонент ${componentName}?";

  static String m4(projectName) => "Змінити ${projectName}";

  static String m5(sourceName) =>
      "Дійсно хочете видалити джерело ${sourceName}?";

  static String m6(sourceName) => "${sourceName}Source вже існує";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "actions": MessageLookupByLibrary.simpleMessage("Дії"),
        "addComponent":
            MessageLookupByLibrary.simpleMessage("Додати компонент"),
        "addField": MessageLookupByLibrary.simpleMessage("Додати поле"),
        "addFlavors": MessageLookupByLibrary.simpleMessage("Додати флавори:"),
        "addScreen": MessageLookupByLibrary.simpleMessage("Додати екран"),
        "addSource": MessageLookupByLibrary.simpleMessage("Додати джерело"),
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
        "colorStyles": MessageLookupByLibrary.simpleMessage("Кольори"),
        "componentNamePlaceholder":
            MessageLookupByLibrary.simpleMessage("Назва компонента"),
        "componentPreview": m0,
        "continueLabel": MessageLookupByLibrary.simpleMessage("Продовжити"),
        "createRequestCheckboxLabel":
            MessageLookupByLibrary.simpleMessage("Створити запит?"),
        "createResponseCheckboxLabel":
            MessageLookupByLibrary.simpleMessage("Створити відповідь?"),
        "dataComponent":
            MessageLookupByLibrary.simpleMessage("Компонент даних"),
        "dataComponentExistsError": m1,
        "dataComponentExistsInSource": m2,
        "dataComponents":
            MessageLookupByLibrary.simpleMessage("Компоненти даних"),
        "delete": MessageLookupByLibrary.simpleMessage("Видалити"),
        "deleteComponentConfirmation": m3,
        "dialogWillOpenInSeparateWindow": MessageLookupByLibrary.simpleMessage(
            "(Діалог видкріється в окремому вікні)"),
        "emptyConfigContent": MessageLookupByLibrary.simpleMessage(
            "Файл конфіга вітсутній або невірний! Перевірте, чи був відкритий проект згенерований за допомогою Onix Flutter Project Generator"),
        "emptyConfigTitle": MessageLookupByLibrary.simpleMessage(
            "Помилка читання файлу конфіга!"),
        "error": MessageLookupByLibrary.simpleMessage("Помілка"),
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
        "firstLastName":
            MessageLookupByLibrary.simpleMessage(" Ім\'я та прізвище"),
        "flavorize":
            MessageLookupByLibrary.simpleMessage("Генерувати флавори?"),
        "flavors": MessageLookupByLibrary.simpleMessage("Флавори"),
        "generate": MessageLookupByLibrary.simpleMessage("Генерувати"),
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
        "getStylesFromFigma":
            MessageLookupByLibrary.simpleMessage("Отримати стилі з Figma"),
        "gitPermissionsContent": MessageLookupByLibrary.simpleMessage(
            "Помилка доступу до Git! Перевірте, чи встановлений git та чи маєте ви права доступу до репозиторія або спробуйте додати ключ від git в Ключар."),
        "gitPermissionsTitle":
            MessageLookupByLibrary.simpleMessage("Помилка доступу до Git!"),
        "goBack": MessageLookupByLibrary.simpleMessage("Назад"),
        "ignore": MessageLookupByLibrary.simpleMessage("Ігнорувати"),
        "integrateGraphQl":
            MessageLookupByLibrary.simpleMessage("Інтегрувати GraphQL?"),
        "keyStorePasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Залиште пустим для автогенерації..."),
        "keystorePassword":
            MessageLookupByLibrary.simpleMessage(" Пароль до сховища ключів"),
        "list": MessageLookupByLibrary.simpleMessage("Список"),
        "localization": MessageLookupByLibrary.simpleMessage("Локалізація:"),
        "localizationMethod":
            MessageLookupByLibrary.simpleMessage("Метод локалізації"),
        "masonBrickSource":
            MessageLookupByLibrary.simpleMessage("Гілка Mason Brick"),
        "modify": MessageLookupByLibrary.simpleMessage("Змінити"),
        "modifyComponent":
            MessageLookupByLibrary.simpleMessage("Змінити компонент"),
        "modifyGeneratedProject": m4,
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
        "nullable": MessageLookupByLibrary.simpleMessage("Опціональне"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "openExistingProject":
            MessageLookupByLibrary.simpleMessage("Відкрити існуючий проект"),
        "openInAndroidStudio":
            MessageLookupByLibrary.simpleMessage("Відкрити в Android Studio"),
        "organization": MessageLookupByLibrary.simpleMessage("Організація"),
        "organizationalUnit":
            MessageLookupByLibrary.simpleMessage(" Організаційний підрозділ"),
        "pathNotSelectedContent": MessageLookupByLibrary.simpleMessage(
            "Будь ласка, виберіть шлях до проекту"),
        "pathNotSelectedTitle":
            MessageLookupByLibrary.simpleMessage("Шлях до проекту не вибрано"),
        "placeURLTitle":
            MessageLookupByLibrary.simpleMessage("Вставте URL сюди"),
        "platforms": MessageLookupByLibrary.simpleMessage("Платформи"),
        "preview": MessageLookupByLibrary.simpleMessage("Перегляд"),
        "projectExistsError": MessageLookupByLibrary.simpleMessage(
            "Проект з такою назвою вже існує"),
        "projectName": MessageLookupByLibrary.simpleMessage("Назва проекту"),
        "projectPath": MessageLookupByLibrary.simpleMessage("Шлях до проекту"),
        "replace": MessageLookupByLibrary.simpleMessage("Замінити"),
        "request": MessageLookupByLibrary.simpleMessage("Запит"),
        "response": MessageLookupByLibrary.simpleMessage("Відповідь"),
        "retry": MessageLookupByLibrary.simpleMessage("Повторити"),
        "router": MessageLookupByLibrary.simpleMessage("Роутер:"),
        "screenAlreadyExistsContent": MessageLookupByLibrary.simpleMessage(
            "Екран з такою назвою вже існує"),
        "screenAlreadyExistsTitle":
            MessageLookupByLibrary.simpleMessage("Вже є"),
        "screenName": MessageLookupByLibrary.simpleMessage("Назва екрану"),
        "screens": MessageLookupByLibrary.simpleMessage("Екрани"),
        "signingVars": MessageLookupByLibrary.simpleMessage("Дані підпису"),
        "sourceDeletingDialogTitle": m5,
        "sourceExistsError": m6,
        "sourceNamePlaceholder":
            MessageLookupByLibrary.simpleMessage("Назва джерела"),
        "sources": MessageLookupByLibrary.simpleMessage("Джерела"),
        "spaceSeparated":
            MessageLookupByLibrary.simpleMessage("(розділяти пробілами)"),
        "standaloneDataComponents": MessageLookupByLibrary.simpleMessage(
            "Самостійні компоненти даних:"),
        "stateManager": MessageLookupByLibrary.simpleMessage("Менеджер стану"),
        "stateOrProvince":
            MessageLookupByLibrary.simpleMessage(" Штат або провінція"),
        "swaggerParserPrompt": MessageLookupByLibrary.simpleMessage(
            "Вставте посалання на json файл конфігу свагера сюди для отримання компонентів від API\nабо залиште пустим для продовженя без інтеграції API"),
        "swaggerParserScreenConflictError": MessageLookupByLibrary.simpleMessage(
            "Файл Свагера містить компоненти, що конфліктують з тими що є. Замінити зпарсеними компоненами або ігнорувати конфліктуючі дані?"),
        "swaggerURL": MessageLookupByLibrary.simpleMessage("Swagger URL"),
        "textStyles": MessageLookupByLibrary.simpleMessage("Стилі тексту"),
        "theming": MessageLookupByLibrary.simpleMessage("Theming"),
        "title": MessageLookupByLibrary.simpleMessage(
            "Onix Flutter Project Generator"),
        "twoLetterCountryCode":
            MessageLookupByLibrary.simpleMessage(" Двохлітерний код країни"),
        "url": MessageLookupByLibrary.simpleMessage("URL"),
        "useSonar": MessageLookupByLibrary.simpleMessage("Підключити Sonar?"),
        "usingBloc": MessageLookupByLibrary.simpleMessage("Використати BLoC"),
        "usingCubit": MessageLookupByLibrary.simpleMessage("Використати Cubit"),
        "willBeAddedAutomatically": MessageLookupByLibrary.simpleMessage(
            "DEV та PROD флавори будуть додані автоматично"),
        "withComponents":
            MessageLookupByLibrary.simpleMessage("З компонентами"),
        "yes": MessageLookupByLibrary.simpleMessage("Так")
      };
}
