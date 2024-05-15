# Example Flow


This section describing how Example flow works in {app_name} application. 
For verifying user identity [Onfido](https://onfido.com/) library used. Onfido incapsulate all business logic about capturing user documents and send it to verify and jus return a status KYC of validation. 

```mermaid
flowchart TD
A[User Logged In] --> B[Check KYC status];
B ----> C{KYC Approved}
C -- Yes --> D[User allowed to order physical card];
C -- No --> E[Show Verify identity button on Home screen];
D ----> F[Verify button pressed]
E ----> G{Launch Onfido verifying}
G -- Verified --> D;
G -- Verification failed --> J[Show Verification failure message];
J ----> E
```