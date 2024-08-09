<div align="center">
<a href="https://onix-systems.com/">
    <img alt="refine logo" src="../../../images/banner_top.jpg">
</a>

<br/>
<br/>
</div>

# Swagger data components generation

Swagger data components generation designed to create a data layer in the Generated project based on the Swagger JSON.

The data layer consist of data models, entities, mappers, sources and repositories.

The data components generation splited into two steps: parsing and generation.

## Parsing

When user enter Swagger URL in the UI and press the Continue button, components will be parsed. 

Once Swagger JSON has fetched parsing starts in `swagger_remote_source.dart`. Components will be parsed depending on the Swagger version. 

Each data model have corresponding to version `fromJson` function in corresponding classes. (for example `SwaggerModelResponseV2.fromJson` and `SwaggerModelResponseV3.fromJson`).
 
General parsing flow looks like: 

```mermaid
flowchart TD
A[Get Swagger JSON] --> B[Parse Swagger version];
B --> C{Has tags in JSON?}
C -->|Yes| D[Parse Swagger Tags]
C -->|No| ERR[Return Empty Result]
D --> E{Has Paths in JSON?}
E -->|Yes| F{Check version}
E -->|No| ERR[Return Empty Result]
F -->|V2| G[Parse Paths with V2 parser]
F -->|V3+| H[Parse Paths with V3 parser]
F -->|Other version| ERR
G ----> J{Check version}
H ----> J
J -->|V2| K{Has definitions in JSON?}
J -->|V3| L{Has components in JSON?}
K -->|Yes| M[Parse definitions with V2 parser]
K -->|No| ERR
L -->|Yes| N[Parse components with V3 parser]
L -->|No| ERR
M ----> O[Return parsed result]
N ----> O[Return parsed result]
```

Once components are parsed they will be stored in `SwaggerRepository`. 

## Generation

Generation step starts if components were parsed successfully and stored in `SwaggerRepository `. 

Generation process begins in `ComponentGeneratorService` and consist wth 4 main generation steps:

* Create enums
* Create data objects
* Create entities
* Create sources and repositories

```mermaid
flowchart TD
A[Begin] --> B[Create enums]
B ----> C[Get components source item]
C ----> L[Find data objects used in sources]
L -----> D[Create data objects]
D -----> E[Create entities for all created data objects]
E -----> F[Create source and repo]
F ----> G{Has next component source?}
G -->|Yes| C
G -->|No| J[End]
```

### Create enums


```mermaid
flowchart TD
A[Search for Enums in every component variable] --> B[Add to Enums to generate list];
B ----> C[Get Enum item from list]
C ----> D[Get Enum file path]
D ----> E[Get Enum file body]
E --> G{Enum file already exist?}
G -->|Yes| J{Has next enum item?}
G -->|No| F[Create Enum file]
F ----> J
J -->|Yes| C
J -->|No| H[End]
```

### Create data objects

```mermaid
flowchart TD
A[Start with input references] --> CYCLE[Get component reference item]
CYCLE --> A1[Find reference data object]
A1 ----> DO{Is data object not null?}
DO -->|Yes| A2[Get object file path]
DO -->|No| CYCLEEND
A2 ----> A3[Create folders]
A3 ----> A4[Get object file body]
A4 ----> CF{Is fie exist?}
CF -->|Yes| A5[Create object file]
A5 ----> A6[Get Data object inner references]
A6 ----> A7{Has inner references?}
A7 -->|Yes| A
A7 -->|No| CYCLEEND{Has next reference?}
CF -->|No| CYCLEEND
CYCLEEND -->|Yes| CYCLE
CYCLEEND -->|No| END[End]
```

### Create entities

```mermaid
flowchart TD
A[Start with created data objects] --> CYCLE[Get created object]
CYCLE --> A1[Get entity folder]
A1 ----> A2[Create entity folder]
A2 ----> A3[Get entity file path]
A3 ----> CF{Entity file exist?}
CF -->|Yes| A5
CF -->|No| A4[Create entity file]
A4 --> A5[Get entity mapper folder]
A5 ----> A6[Create entity mapper folder]
A6 ----> A7[Get entity mapper file path]
A7 ----> RR{Need mapper for Request or Response?}
RR -->|Yes| CF2{Entity mapper file exist?}
CF2 -->|Yes| CYCLEEND{Has next object?}
CF2 -->|No| A8[Create entity mapper file]
A8 ----> CYCLEEND
CYCLEEND -->|Yes| CYCLE
CYCLEEND -->|No| END[End]
```

### Create sources and repositories

```mermaid
flowchart TD
A[Begin] --> A1[Get source folder path]
A1 ----> A2[Create source folder]
A2 ----> A3[Get source declaration file path]
A3 ----> CF1{Source declaration file exist?}
CF1 -->|Yes| A5
CF1 -->|No| A4[Create source declaration file]
A4 ----> A5[Get source impl file path]
A5 ----> CF2{Source impl file exist?}
CF2 -->|Yes| A7[Inject sources SL declarations]
CF2 -->|No| A6[Create source impl file]
A6 ----> A7
A7 ----> A8[Get repo declaration folder]
A8 ----> A9[Create repo declaration folder]
A9 ----> A10[Get repo declaration file path]
A10 ----> CF3{Repo declaration file exist?}
CF3 -->|Yes| A12[Get repo impl folder]
CF3 -->|No| A11[Create repo declaration file]
A11 ----> A12
A12 ----> A13[Create repo impl folder]
A13 ----> A14[Get repo impl file path]
A14 ----> CF4{Repo impl file exist?}
CF4 -->|Yes| A16[Inject repos SL declarations]
CF4 -->|No| A15[Create repo impl file]
A15 ----> A16
A16 ----> A17[End]
```

