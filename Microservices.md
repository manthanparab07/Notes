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

    