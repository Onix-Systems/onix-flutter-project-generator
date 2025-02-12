# Changelog

## Changes since v1.3.0

### New Features

- **Simplified Architecture**: Introduced a new `Basic` architecture to simplify project structure. This structure follows the principles of feature separation but lacks explicit domain separation. Project architecture selector added to project configuration screen. Basic architecture contains three layers:
  - `app/` : Contains core application setup such as DI (dependency injection), localization, routing, services, and utilities.
  - `data/` : Includes models, repositories, and data sources for API handling (using Dio for networking).
  - `presentation/` : Holds UI-related components like screens, styles, and common widgets.
   
<p align="center">
<img width="540" alt="Screenshot 2025-02-10 at 10 48 01" src="https://github.com/user-attachments/assets/c2a9a13f-0435-48c0-a72d-cb659c6a734a" />
</p>
<hr />

- **MVVM and Signals State Manager**: Integrated the MVVM pattern and a Signals state management using [onix_flutter_mvvm](https://pub.dev/packages/onix_flutter_mvvm) and [onix_flutter_signals](https://pub.dev/packages/onix_flutter_signals) packages.

- **Standalone Flavors Generator**: Added a standalone flavor generator for adding flavors in already generated project.
<p align="center">
<img width="537" alt="Screenshot 2025-02-10 at 10 49 08" src="https://github.com/user-attachments/assets/2101fa47-16a0-484d-af7c-976d159676ff" /> 
</p>

<p align="center">Just write new flavor name, click `+` to add flavor to generating list...</p>

<p align="center"><img width="514" alt="Screenshot 2025-02-10 at 10 58 58" src="https://github.com/user-attachments/assets/aa640a1b-285a-41f9-b9ba-76c6c1d4cb4c" /></p>

<p align="center">...and click `Ok` to generate flavors</p>
<p align="center">
<img width="514" alt="Screenshot 2025-02-10 at 10 59 11" src="https://github.com/user-attachments/assets/e4d0d5f1-2ea4-43b1-abca-8813b1e0e087" />
</p>

<p align="center">Flavors in list are removable, so you can delete any.</p>

> [!CAUTION]
> Flavor generator works only with projects generated with this app. Projects with already generated flavors are not applicable

<hr />

### Enhancements

- **Base Data Components Preview**: Introduced a preview feature for data components parsed from Swagger, enabling developers to visualize and understand the data components more effectively.

<p align="center">Click on highlighted component will open dialog with data component class structure</p>
<p align="center">
<img width="1212" alt="Screenshot 2025-02-10 at 10 52 32" src="https://github.com/user-attachments/assets/e493b0ac-febd-4d23-97ec-b3ca08f38097" />
</p>

- **Added Backup for Standalone Signing Generator**: Included a backup mechanism for the standalone signing generator to ensure configuration changes can be reverted if necessary.

- **Environment Security Enhanced**: flutter_dotenv package replaced with [envied](https://pub.dev/packages/envied) to provide more security to environment variables.

- **Adding screens to existing project**: Adding screens to existing project functional is back. This allows you to add new screens during development with preffered state variant in less time.

<p align="center">Open project. You will see previously generated screens</p>

<p align="center">
<img width="1212" alt="Screenshot 2025-02-10 at 12 54 03" src="https://github.com/user-attachments/assets/3b3ec72e-a79a-42ba-aae4-3b710a392035" />
</p>

> [!NOTE]
> At this step you can also change initial project screen.

<p align="center">Add new screen</p>

<p align="center">
<img width="1212" alt="Screenshot 2025-02-10 at 12 54 32" src="https://github.com/user-attachments/assets/3e9bdd87-3c68-4e82-9048-e36c79375393" />
</p>

<p align="center">And press `Continue` to generate new screens.</p>

<hr />

### Bug Fixes

- **Swagger Parser Fixes**: Implemented various fixes to improve the accuracy and stability of the Swagger parser.
