<div align="center">
<a href="https://onix-systems.com/">
    <img alt="refine logo" src="../../../images/banner_top.jpg">
</a>

<br/>
<br/>
</div>


# Mason Pre-generation steps


Mason pre generation code located in `bricks/flutter_clean_base/hooks/pre_gen.dart` and will have run before Mason `make` command.

Mason pre generation steps are:

```mermaid
flowchart TD
A[Start] --> B[Create empty Flutter project];
B ----> C[Initialize custom variables];
C ----> D[Completed];
```

