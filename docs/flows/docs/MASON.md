<div align="center">
<a href="https://onix-systems.com/">
    <img alt="refine logo" src="../../../images/banner_top.jpg">
</a>

<br/>
<br/>
</div>

# Mason build steps

Mason brick code located in `/bricks/flutter_clean_base` folder.
It consists of raw project structure and hooks.

Before generation have started brick code going to be downloaded from repo. 

Mason `make` process consists of 3 main steps:

```mermaid
flowchart TD
A[Start] --> B[pre_gen.dart];
B ----> C[Make brick];
C ----> D[post_gen.dart];
```

To read more about Mason check their [documentation](https://docs.brickhub.dev/).
