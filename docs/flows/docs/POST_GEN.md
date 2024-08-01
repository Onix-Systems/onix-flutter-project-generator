<div align="center">
<a href="https://onix-systems.com/">
    <img alt="refine logo" src="../../../images/banner_top.jpg">
</a>

<br/>
<br/>
</div>

# Mason Post-generation steps

Mason post generation code located in `bricks/flutter_clean_base/hooks/post_gen.dart` and will have run after Mason `make` command completed.

Mason post generation steps are:

```mermaid
flowchart TD
A[Start] --> B[Clear temporary files];
B ----> C[Fix pubspec file];
C ----> D[Get Dependencies];
D ----> E[Run flavorizr script];
E ----> F[Configure application main files];
F ----> G[Run localization script];
G ----> H[Run formatting and sorting];
H ----> J[Correct Android versions];
J ----> I[Correct .gitignore];
I ----> K[Completed];
```
