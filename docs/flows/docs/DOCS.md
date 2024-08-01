<div align="center">
<a href="https://onix-systems.com/">
    <img alt="refine logo" src="../../../images/banner_top.jpg">
</a>

<br/>
<br/>
</div>

# Documentation generation

Documentation generation code placed in `lib/domain/service/docs_service/docs_service.dart` file.

Main point is to take pre-designed documentation files from `assets/documentation`, modify 
them according to the project configuration and copy to the project folder.

```mermaid
flowchart TD
A[Get files from assets] --> B[Open file];
B ----> C[Replace file content according to the project configuration];
C ----> D[Save file to project folder];
D --> E{Has next file?}
E -->|Yes| B
E -->|No| F[Completed]
```

