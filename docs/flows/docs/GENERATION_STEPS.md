<div align="center">
<a href="https://onix-systems.com/">
    <img alt="refine logo" src="../../../images/banner_top.jpg">
</a>

<br/>
<br/>
</div>


# Generation steps

The generation starts in `lib/presentation/screen/generation_screen` and commands have running in screen's BLoC file.

Project is building using Mason brick functionality with additional custom generators.

Here described common generation flow to create a new project:

```mermaid
flowchart TD
O[Start] --> A[Generate Android signing Password];
A --> B[Create config file];
B ----> C[Download Mason brick code from repo];
C ----> D[Activate and make Mason brick];
D ----> E[Create Android signing configuration];
E ----> F[Generate styles];
F ----> G[Generate screens];
G ----> H[Generate data components];
H ----> J[Run code formatting];
J ----> I[Generate documentation];
I ----> K[Generate fastlane configuration];
K ----> L[Open flutter fire window];
L ----> M[Completed];
```
