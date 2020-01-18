>   ## Microservices

-   An engineering approach focused on **decomposing** applications into **single-function module**s with **well-defined ** **interface** which are **independently** deployed and operated by small teams who own the **entire lifecycle** of the service.
-   It accelerate delivery by **minimizing** communication and coordination between people while **reducing** the scope and **risk** of change.

-   Similar to concept of file as in Linux kernel Development. Every thing is a file.
-   These services are independent and do not rely on each other.
-   **Based on the idea of distributed system**

##### Well defined Interface imply the service should define it's construct i.e what type of input and output the microservice operates on.

##### Independent imply that the services should run even if they are not used by other services.

##### Entire lifecycle is governed and operated by the same team thus faster debugging and testing unlike traditional separate team which has to start from learning and then testing.

##### Minimizing Communication imply reduces complex team with larger count by dividing up into small team which only interact when the decide common ground for interface to interact.

##### Each Microservices are under constant development and each service may have difference versions running unlike monolithic architecture where entire application has only one version.

### A Microservices is a throwaway thing, an instance is created when it's required and may be destroyed when not needed anymore.

-   Thus allowing us to reduce cost both computational and financially since microservices are deployed in cloud and destroying / scaling down microservices reduces cost.
-   Scaling down or up is independent to other and without user intervention.

>   Advantage

1.  The microservice architecture makes it easier to **scale** development.
2.  The microservice architecture also improves **fault isolation**. 
    -   For example, a memory leak in one service only affects that service. Other services will continue to handle requests normally. 
    -   In comparison, one misbehaving component of a monolithic architecture will **bring down** the entire system.

3.  Last but not least, the microservice architecture **eliminates any long-term commitment to a technology stack. **

    -   In principle, when developing a new service the developers are free to pick whatever language and frameworks are best suited for that service. 

    -   Of course, in many organizations it makes sense to restrict the choices but the key point is that you aren’t constrained by past decisions.
    -   Moreover, because the services are small, it becomes practical to rewrite them using better  languages and technologies.

>   Drawbacks

1.  First distributed system must be carefully planned.
2.  It increases **operational complexity** since there are too  many moving parts which involve careful co-ordination .

>   Communication between Microservices

-   In monolithic architecture, the program for ex web application interacts via standard HTTP request but in microservices interact via REST HTTP request.

-   Even for a simple application it may require 100s of call to microservices which may prove inefficient resulting in poor experience.
    -   Amazon.com, for example, [describes](http://highscalability.com/amazon-architecture) how some pages require calls to 100+ services. 

-   A much better approach is for clients to make a **small** number of requests per-page, perhaps as few as one, over the Internet to a **front-end server** known as an **API gateway**,
-   The API gateway sits between the application’s clients and the microservices. It provides APIs that are tailored to the client.
    -    In this example, the desktop clients makes multiple requests to retrieve information about a product, where as a mobile client makes a single request.

>   
>
>   Inter-service communication mechanisms

-    In a monolithic application, components call one another via **regular method calls**. 
-   But in a microservice architecture, different services run in different processes. Consequently, services must use an **inter-process communication** (**IPC**) to communicate.
-   A consequence of decomposing the application into services is that the database is also partitioned. To ensure **loose coupling**, each service has its own **database (schema)**. 

>   #### Cloud Computing

-   Several components of deploying a code

    1.  ##### Code

        -   Business Logic or Application

    2.  ##### Data

    3.  ##### Runtime

        -   The code and the data execute in a   runtime environment, which contains the state required by program execution as well as object instances used to execute the services required by the program.

    4.  **Middleware**

        -   Software that mediate between runtime and the OS.
        -   Ex. Webservers

    5.  **O/S**

        -   Software that links computer hardware .

    6.  **Visualization**

        -   The use of software simulation of software or hardware or storage.
        -   Used to run multiple instant of O/S on same hardware.

    7.  ##### Server

        -   Access services to the all the network.

    8.  ##### Storage

    9.  **Networking**

        -   Firewalls,load balancing

>   #### Traditional Stack Of Deployment

|  Stack Form   |
| :-----------: |
|     Code      |
|     Data      |
|    Runtime    |
|  Middleware   |
|      O/S      |
| Visualization |
|    Server     |
|    Storage    |
|  Networking   |

-   Traditional IT will manage all the component. 
-   Called as **On premise IT**
-   Requires weeks to deploy the application as dedicated staff and and resource are needed. 

##### Infrastructure as a Service ( Iaas )

-   The cloud service provider will manage the 
    1.  Visualization
    2.  Servers
    3.  Storage
    4.  Networking
-   This will still take days to deploy since Middleware O/S up-gradation is client's responsibility.

##### Platform as a Service (Paas)

-   The cloud provider along with **Iaas** will manage 
    1.  Runtime
    2.  Middleware
    3.  O/S

-   Faster Deployment but less control to the development environment.



##### Software as a Service (Saas)

-   Vendor Manages everything.
-   Components in Saas
    1.  Code
    2.  Data

-    Instead, the applications reside on a remote cloud network accessed  through the web or an API. Through  the application, users can store and  analyze data and collaborate on projects.
-   Users do not have to manage, install or upgrade software; SaaS providers manage this.

##### Continuous Integration / Continuous Delivery ( CI/CD )

-   The continuous changes in software must be deployed quickly and continuously integrated i.e referred as CI/CD
-   It is an automatic process.
-   Performed by DevOps.
-   CD uses a technique call **blue-green technique** which takes the application offline for upgrades and then back online.
    -   When a new upgrade takes place then all the new users for that services are re-routed to new upgrade whereas the existing user are still services with the older micro-services.
    -   Once there is no more user using old service then it is removed from production.

##### Failures and there monitoring

-   When microservices stop working due to some issues it's may return incorrect or no result to the client.
-   In order to identify and monitor it all the request must pass through **circuit breakers ** which handle the client request and route to microservices.
-   If the microservices fail then the circuit breaker will inform the client and will take appropriate action.

| Client | Circuit Breaker | Microservices |
| ------ | :-------------: | :-----------: |

#### Microservices are not OOP extensions

-   Microservice architectures will use libraries, but their        primary way of **componentizing** their own software is by        breaking down into services. 
-   We define **libraries**   as components that are linked into a program and called using in-memory function calls, while **services** are   out-of-process components who communicate with a mechanism such  as a web service request, or remote procedure call. 
-   (This is a different concept to that of a service object in many OO programs .)
-   One main reason for using services as components (rather than libraries) is that **services are independently deployable**.
-    If you have an application  that consists of a multiple **libraries** in a single process, a change to any single component results in having to **redeploy** the entire application. 
-   But if that application is decomposed into multiple services, you can expect many single service changes to only require that service to be redeployed. 

### A microservice should have a [single responsibility](https://en.wikipedia.org/wiki/Single_responsibility_principle).

-   Microservice should take a “**share nothing**” philosophy. This applies to implementation as well as its data.
-   If a microservice is relying on a shared library for it’s functionality, that becomes harder to enforce. These libraries can be in the form of domain specific business login not common utilities. 
-   Moreover a microservice may defer in functionality from other in case if it write intensive or read only thus having different database will increase modularity .

##### Communication B/W microservices

-   ##### API Gateway

    -   If client want to interact with microservices directly then it must know the URL of the microservice.
    -   But since in cloud microservices are under constant development as a result keeping track of there address is difficult.
    -     Thus mobile client communicate with microservices with the help of **API GATEWAY** 
    -   API GATEWAY is an server that act as a **API front-end**  . 
    -   It passes the request to the appropriate service at the back-end and then passes the response back to the requester.
    -   API GATEWAY allows to modify the request which allow to implement security policies and other throttling.

#### API Gateway represents a single URL endpoint for anything that is calling it.

-   It must be less changes than individual microservices.

Communication b/w services can be **synchronous** ( HTTP ) as **REST**   or as asynchronous communication.

-   In **asynchronous** communication is preferred as request and response queue is used where the request & response is stored .

-   More preferable as failure at any end does not need to start the communication again.

>   #### Microservices Instances

-   Specify how microservices to locate each other and communicate.
-   Since multiple instances of microservices can be present in the cloud. Some microservices may be dead or broken  or failed .
-   Requester needs to find the instance of service to communicate which it is not failed.
-   To Find this microservices use **registry of instances**   which keeps record of all the instances of the microservices there **status** and the requester request is passed through registry.
-   When microservices instance is created it may try to register itself directly or through other microservice known as **third party registration**.
-    The instance which has failed is being flagged in the registry. This means that a reference to that instance will not be handed  back in response to a request.
-   If the requested microservice is running then it's instance is returned to the requester.

