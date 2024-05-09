# Architecture overview

{app_name} project code built on Clean based hybrid Architecture (I'll just call it Clean architecture for simplicity's sake).  

The main concept of regular [Clean Architecture](http://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) is codes split to layers, where every low-level layer knows nothing about up layers, separation of business logic from UI, not depending on frameworks or libraries, etc.

The architecture we used in {app_name} project is very similar to the regular Clean architecture, but it has its own values, which is why we call it Clean based quasi-architecture.

The main features of the architecture:

* a clear separation of code into layers: data, domain, presentation is preserved;
* each layer operates with data within its responsibility;
* interaction between layers occurs through interfaces;
* data models are separated from general use models;
* DI is used to provide access to code components; 
* the chain of access to components and method calls is strictly defined and cannot be broken;
* there is an additional app layer to meet the needs of the application;

## Layers, components, and their interaction

### App level
Contains classes that meet the needs of the entire application. These are usually global components that affect the operation of the entire application. For example: navigation components, localization, utilities, etc. 
This layer also contains application-level services. Usually, these are services that process and store data on which the application globally depends. For example: authorization status, current user profile, etc. 
These services are created and transferred using DI. 

### Data layer
The data layer operates with the lowest-level data and deals with receiving data from various sources, transferring data to storage locations, transforming it, organizing it, and then transferring it to the next layer. 
To be more specific, the main operations that take place in the data layer are as follows: 

* work with APIs;
* work with data storage;
* work with other data providers;
* data transformation for further use in other layers;

The data layer has 2 main components: **source** and **repository implementation**.

**Source** receives data directly from the provider: API, Storage, or others data providers and transmits it in the data format or class of a specific error. 

The **repository** interacts with different sources, receives data from them, transforms, combines and performs other necessary operations and passes it on in the format of data or error.

Both components are created through DI, and have a dependency between them, so that **source can be called from repository but not vice versa**. The dependency is ensured by passing source to the repository constructor (in the DI configuration).  

### Domain layer
The Domain layer is the link layer between data and presentation. In this layer, data is retrieved from the data layer and data calls are organized into specific scenarios. 

The main components are: **usecase** and **repository interface**.

**Usecase** executes specific scenarios in the application by calling repositories, services, and other auxiliary components and returns a result that is ready to be used in the presentation in the format of data or error.  

The **repository interface** is a simple interface that describes the functions of a specific repository and from which a specific repository in the data layer is inherited. 

Both components are created through DI and have a dependency between them, so that **usecase can call functions of repository (or service) but not vice versa**. The dependency is ensured by passing source to the repository constructor (in the DI configuration). 

### Presentation layer
The presentation layer contains classes that are responsible for the visual display of the application, UI and screens, as well as **state controllers and presentation logic holders**(BLoC).

Usually, a separate state controller is used for each screen. But there are cases when it can be used in several places. 

The **state controller** is the highest component in the call chain by calling **usecase** and it initiates calls to other components sequentially. In turn, the state controller depends on the events that occur in the UI.  

### Call chain

To be more specific, the call chain works from the highest level (UI and state controller) to the lowest and usually looks like this:

* usecase called from state controller (BLoC);
* one or more repositories(interface) (or services) called from usecase;
* one or more sources called from repository(implementation);
* source called data provider (API request or else);
* result is providing back to caller by returning result in each component;






