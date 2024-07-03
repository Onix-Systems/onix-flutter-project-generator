<div align="center">
<a href="https://onix-systems.com/">
    <img alt="refine logo" src="../../images/banner_top.jpg">
</a>

<br/>
<br/>
</div>


# HTTP Networking component 

**Generated project use custom Networking component** by default based on Dio HTTP client and networking helper libraries. 

**But you are free to perform your HTTP requests as usual or use your own HTTP client**.

## DioRequestProcessor

This section describes **how DioRequestProcessor performs HTTP requests** and all possible result to be returned after request executed.

DioRequestProcessor encapsulates boilerplate operations used when you perform HTTP Request:

* Check internet connection;
* Perform HTTP request;
* Handle HTTP errors;
* Inject authorization token;
* Retry request;
* Cache request;
* Logging;

DioRequestProcessor consist from 2 classes:

* `dio_request_processor.dart` - to initiate HTTP request, check connection, retry;
* `dio_error_processor.dart` - to handle HTTP errors, parse Custom and Default errors;

They are located in `core\arch\data\remote\dio\`.

DioRequest processor general flow looks like:

```mermaid
flowchart TD
A[Initiate HTTP Call] --> B[Check internet connection];
B ----> C{Has connection?}
C -- Yes --> D[Send Request];
C -- No --> E[Not Connected Error];
D ----> F{Succeed?}
F -- Yes --> G[Parse response in onResponse callback]
F -- No --> I{Use Retry?}
G ----> H[Return success command with response object]
I -- Yes --> A;
I -- No --> J{Is HTTP error?};
J -- Yes --> K{Is Timeout or Unauthorized?}
J -- No --> L[Return Undefined Error]
K -- Yes --> M[Return corresponding error]
K -- No --> N{Custom error handler set?}
N -- Yes --> O[Parse and return Custom Error]
N -- No --> P{Can parse as Default Error object?}
P -- Yes --> R[Parse and return Default error]
P -- No --> L
```

## Request Interceptors

Boilerplate project provides two options of interceptors: basic and advanced, with token auto-renew feature. You free to choose any or write your own. Just replace `customInterceptor` type to interceptor class type you need.

### Basic interceptor

Basic interceptor intended to add Authorization token to Http request before request sent and handle unauthorized error and close user session.
Basic interceptor located in `...\interceptor\basic_interceptor.dart`.
Flow of Basic interceptor:

```mermaid
flowchart TD
A[HTTP request initiated] --> B{Token exist and not empty?};
B -- Yes --> C[Add Authorization header with Token];
B -- No --> D[Continue request];
C ----> D
D ----> E{Succeed?}
E -- Yes --> F[Continue with request result]
E -- No --> G{Is unauthorized error?}
G -- Yes --> H[Close session and Clear tokens]
G -- No --> F
H ----> F
```

### Auto-Renewable interceptor

Auto-Renewable doing the same as Basic interceptor with addition functionality to renew token automatically and retry request if unauthorized error occurs.
Basic interceptor located in `...\interceptor\auto_renewable_interceptor.dart`.
Flow of Auto-Renewable interceptor:

```mermaid
flowchart TD
A[HTTP request initiated] --> B{Token exist and not empty?};
B -- Yes --> C[Add Authorization header with Token];
B -- No --> D[Continue request];
C ----> D
D ----> E{Succeed?}
E -- Yes --> F[Continue with request result]
E -- No --> G{Is unauthorized error?}
G -- Yes --> H[Send Renew token request]
G -- No --> F
H ----> I{Token renewed?}
I -- Yes --> J[Save tokens]
I -- No --> K[Close session and Clear tokens]
K ----> F
J ----> L[Retry initial request]
L ----> M{Retry succeed?}
M -- Yes --> F
M -- No --> K
```


<br/>
<br/>

Have a question? Don't be shy to contact us via [GitHub](https://github.com/Onix-Systems/onix-flutter-project-generator/issues/new?assignees=&labels=question&projects=&template=question.md&title=Question%20about%20Onix%20Project%20Generator).