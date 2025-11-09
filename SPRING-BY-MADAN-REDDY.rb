############################################### SECTION:1 INTRODUCTION TO SPRING FRAMEWORK ###############################################

1: What we are going to learn :-
    Intro to Spring Framework
    Spring Core
    Spring MVC

    Thymeleaf
    Spring Boot
    Spring Security

    Spring JDBC
    Spring Data (JPA, ORM, Hibernate)
    Spring REST

    Logging
    Properties & Profiles
    Actuator

    Deploying Springboot WebApp Into Cloud (AWS)

2: Description about notes

3: What is Spring?
    -> The Spring Framework is a mature, powerful and highly flexible Framework. Focused on building web applications in Java.
    -> Spring makes Java program quicker, easier and safer for everybody.
    -> Born as an alternative to EJBs (Enterprise Java Beans) in the early 2000s, Spring quickly overtook its opponent with its simplicity, variety 
       of features, and its third party library integration.
    -> It is so popular that its main competitor quit the race when Oracle stopped the evalution of Java EE 8, and the community took over its 
       maintenance via Jakarta EE.
    -> The main reason of Spring Framework success is it regularly introduces features/projects based on recent market trends Ex.- Spring Boot
    -> Spring is open source. It has a large and active community that provides continuous feedback based on real world use case.

4: Jakarta EE vs Spring 
   Oracle handover the Java EE Framework to the developer community and they dont want to gave them Name Java so they renamed it with Jakarta EE
   and handover to the community. All the packages are updated with javax.* to jakarta.* .

   Java EE quit the race against the Spring Framework, when oracle stopped the evalution of Java EE 8, and the community took over its maintenance
   via Jakarta EE.

   Java/Jakarta Enterprise Edition contains Servlets, JSPs, EJB, JMS, RMI, JPA, JSF, JAXB, JAX-WS, Web Sockets etc.

   The very first edition of Spring was written by "Rod Johnson" who released the Framework with the publication of his book Expert One-on-One J2EE
   Design and development in October 2002.
    
5: Introduction to Spring Core
   Spring Core is the heart of entire Spring. It contains some base Framework classes, principles and mechanism.
   The entire Spring Framework and other projects of Spring are developed on top of the Spring Core.
   Spring Core contains following important components :-
   -> IoC (Inversion of Control)
   -> DI (Dependency Injection)
   -> Beans
   -> Context
   -> SpEL (Spring Expression Language)
   -> IoC Container

6: Introduction to IoC (Inversion of Control) & DI (Dependency Injection)
   IoC is a Software Design Principle, Independent of language, which does not actually create the objects but describes the way in which object is
   created.
   Instead of programmer controlling the flow, the Framework or service takes the control of the program flow.

   DI is the pattern through which Inversion of Control achieved.
   Through Dependency Injection, The responsibility of creating objects is shifted from the application to the Spring IoC Container. It reduces
   coupling between multiple objects as it is dynamically Injected by the Framework.

7: Demo of Inversion of Control & Dependency Injection

8: Advantages of Inversion of Control & Dependency Injection
   -> Loose coupling between the components
   -> Minimizes the amount of code in your application
   -> Makes unit testing easy with different mocks
   -> Increased system maintainability & module reusability
   -> Allows concurrent of Independent development
   -> Replacing modules has no side effect on other modules
    
9: Introduction to Beans, Context and SpEL
   Any normal Java class that is instantiated, assembled, and otherwise managed by a Spring IoC Container is called Spring Bean.
   These Beans are created with the configuration metadata that you supply to the container either in the form of XML configs and annotation.
   Spring IoC Container manages the lifecycle of Spring Bean scope and injecting any required Dependencies in the Bean.

   Context is like a memory location of your app in which we add all the object instances that we want the Framework to manage. By default, Spring
   does not know any of the objects you define in your application. To enable Spring to see your objects, you need to add them to Context.

   The SpEL provides a powerful Expression language for querying and manipulating an object graph at runtime like setting and getting property
   values, property assignment, method invocation etc.

10: Introduction to Spring IoC Container
   The IoC Container is responsible
   -> To instantiate the application class
   -> To configure the object
   -> To assemble the dependencies between the objects

   There are two types of IoC Container. They are:
   org.springframework.beans.factory.BeanFactory
   org.springframework.context.ApplicationContext

   BeanFactory is a very basic IoC Container, it is not provide any advanced features, so it can only handle the Bean Creation, Bean maintenance,
   Autowiring them and injecting the dependencies based upon Dependency Injection pattern
   On the other side ApplicationContext is an advanced IoC Container and it implements Bean Factory also, It provides extra advanced features to 
   the developer. 

############################################### SECTION 2: CREATING BEANS INSIDE SPRING CONTEXT ###############################################

11: Installation of Maven

12: IntelliJ Idea Ultimate Link

13: Creating Maven Project

14: Creating Beans using @Bean annotation
   @Bean annotation lets Spring know that it needs to call this method when it inializes its context and adds the returned object/value to the
   Spring context/Spring IoC Container.

   Ex.- @Bean
        Vehicle vehicle(){
            var veh = new Vehicle();
            veh.setName("AUDI 8");
            return veh;
        }
   
    @Configuration annotation used to let the IoC Container to scan all the content of this class because this is an indication that the developer
    has done some changes which will result into creating Beans. 
    Basically it indicates that the class has @Bean definition methods.

    Note:- Method names will become bean names as well in the context.

    Note:- We cannot use direct BeanFactory and ApplicationContext because they are interface so we are creating object through  their implement
    class.
        Ex.- var context = new AnnotationConfigApplicationContext(ProjectConfig.class); {AnnotationConfigApplicationContext used here because we 
        are configuring through annotations}

15: Understanding NoUniqueBeanDefinitionException
    When we create multiple objects of same type and try to fetch the bean from context by type, then Spring cannot guess which instance you have 
    declared you refer to. This will lead to NoUniqueBeanDefinitionException like shown below.

    Ex.- 
        @Bean
        Vehicle vehicle1(){
            var veh = new Vehicle();
            veh.setName("AUDI 8");
            return veh;
        }

        @Bean
        Vehicle vehicle2(){
            var veh = new Vehicle();
            veh.setName("HONDA");
            return veh;
        }

    To avoid NoUniqueBeanDefinitionException in these kind of scenarios, we can fetch the bean from the context by mentioning its name like shown
    below : 
    var context = new AnnotationConfigApplicationContext(ProjectConfig.class);
    Vehicle veh = context.getBean("vehicle1",Vehicle.class);
    System.out.println("Vehicle name from Spring Context is : "+ veh.getName());

16: Providing a custom name to the Bean
    By default, Spring will consider the method name as the bean name. But if we have a custom requirement to define a separate bean name, then 
    we can use any of the below approach with the help of @Bean annotation,
    Ex.- 
        @Bean(name="audiVehicle")
        Vehicle vehicle1(){
            var veh = new Vehicle();
            veh.setName("AUDI 8");
            return veh;
        }

        @Bean(value="hondaVehicle")
        Vehicle vehicle2(){
            var veh = new Vehicle();
            veh.setName("HONDA");
            return veh;
        }

        @Bean("ferrariVehicle")
        Vehicle vehicle2(){
            var veh = new Vehicle();
            veh.setName("HONDA");
            return veh;
        }

17: Understanding @Primary Annotation 
    When you have multiple beans of the same kind inside the Spring Context, you can make one of them primary by using @Primary annotation. 
    Primary bean is the one which Spring will choose if it has multiple options and you dont specify a name. In other words, it is the default
    bean that Spring Context will consider in case of confusion due to multiple beans present of same type.
    Ex.- 
        @Bean(name="audiVehicle")
        Vehicle vehicle1(){
            var veh = new Vehicle();
            veh.setName("AUDI 8");
            return veh;
        }

        @Bean(value="hondaVehicle")
        Vehicle vehicle2(){
            var veh = new Vehicle();
            veh.setName("HONDA");
            return veh;
        }

        @Primary
        @Bean("ferrariVehicle")
        Vehicle vehicle2(){
            var veh = new Vehicle();
            veh.setName("HONDA");
            return veh;
        }

18: Creating Beans using @Component Annotation
    @Component is one of the most commonly used stereotype annotation by developers. Using this we can easily create and add a bean to the Spring
    context by writing less code compared to the @Bean option. With stereotype annotations, we need to add the annotation above the class for
    which we need to have an instance in the Spring Context.

    Using @ComponentScan annotation over the configuration class, instruct Spring on where to find the classes you  marked with stereotype
    annotations.
    Ex.-
        @ComponentScan(basePackages = "com.example.beans")
        public class ProjectConfig {
        }

        @Component
        public class Vehicle {
        private String name;
        public String getName() {
            return name;
            }
        public void setName(String name) {
            this.name = name;
            }
        public void printHello(){
            System.out.println("Printing hello from Component Vehicle Bean");
            }
        }
19: Stereotype Annotations 
    -> Spring provides special annotations called Stereotype annotations which will help to create the Spring beans automatically in the 
       application context.
    -> The Stereotype Annotations in Spring are
        @Component
        @Service
        @Repository
        @Controller

        @Component -> is used as general on top of any Java class. It is the base for other annotations.
        @Service -> can be used on top of the classes inside the service layer especially where we write business logic and make external API calls
        @Repository -> can be used on top of the classes which handles the code related to Database access related operations like Insert, Update,
        Delete etc...
        @Controller -> can be used on top of the classes inside the Controller layer of MVC applications.

        Note-> Dao => Data Access Object 

20: Comparison between @Bean vs @Component

21: Understanding @PostConstruct Annotation
    -> We have seen that when we are using stereotype annotations, we dont have control while creating a Bean. But what if we want to execute some
       instruction post Spring creates the bean. For the same, We can use @PostConstruct annotation.

    -> We can define a method in the Component class and annotate that method with @PostConstruct, which instructs Spring to execute that method
       after it finishes creating the bean.
    -> Spring borrows the @PostConstruct annotation from JavaEE.
         @PostConstruct
            public void initialize(){
            this.name = "Honda";
        }

        Dependency for @PostConstruct Annotation =>
        <dependency>
            <groupId>jakarta.annotation</groupId>
            <artifactId>jakarta.annotation-api</artifactId>
            <version>3.0.0</version>
        </dependency>

22: Understanding @PreDestroy Annotation
    -> @PreDestroy Annotation can be used on top of the methods and Spring will make sure to call this method just before clearing and destroying 
    the context.
    -> This can be used in the scenarios where we want to close any IO resources, Database connections etc.
    -> Spring borrows the @PreDestroy annotation also from JavaEE.
    
23: Creating Beans programmatically using registerBean()
    Sometimes we want to create new instance of an object and add them into the Spring Context based on a programming condition. For the same, 
    Spring 5 version, a new approach is provided to create the beans programmatically by invoking the registerBean() method present inside the 
    context object.
        context.registerBean("volkswagen",Vehicle.class,volkswagenSupplier);

24: Creating Beans using XML Configuration (Old approach but we have to learn)
    Manually creating beans by using config.xml file in resources folder.
    ClassPathXmlApplicationContext annotation used to create bean of the class.

25: Why should we use Framework

26: Introductions to Spring projects -1
    -> Spring Core & Spring MVC
    -> Spring Boot
    -> Spring Data
    -> Spring Cloud
    -> Spring Security
    -> Spring Session
    -> Spring Integration
    -> Spring AMQP
   
27: Introductions to Spring projects -2

############################################### SECTION 3: WIRING BEANS USING @AUTOWIRING ###############################################

28: Introduction to wiring and auto-wiring 
    Spring Context without wiring
    Controller Object           Service Object          Dao Object 

    Spring Context with wiring and DI
    Controller Object --------> Service Object--------> Dao Object

    When creating two beans but without wiring they are unknown with each other. For example Vehicle does not belong to any Person. The Person and
    Vehicle beans are present in Context but no relation established.

29: Wiring Beans using method call
    Ex.-
    @Bean
    public Vehicle vehicle() {
        Vehicle vehicle = new Vehicle();
        vehicle.setName("Toyota");
        return vehicle;
    }

    @Bean
    public Person person() {
        Person person = new Person();
        person.setName("Lucy");
        person.setVehicle(vehicle());
        return person;
    }

30: Wiring Beans using method parameters
    Ex.-
    @Bean
    public Vehicle vehicle() {
        Vehicle vehicle = new Vehicle();
        vehicle.setName("Toyota");
        return vehicle;
    }

    @Bean
    public Person person(Vehicle vehicle) {
        Person person = new Person();
        person.setName("Lucy");
        person.setVehicle(vehicle());
        return person;
    }

    Here on the above code, we are trying to wire or establish a relationship between Person and Vehicle, by passing the vehicle as a method
    parameter to the person() bean method. Now inside Spring Context, person owns the vehicle.
    Spring injects the vehicle bean in the person bean using depedency Injection.

31: Wiring Beans using @Autowired annotation on class field
    The @Autowired annotation marks on a field, setter method, constructor is used to auto-wire the bean that is 'injecting beans'(object) at 
    runtime by Spring Dependency Injection mechanism.
    With the below code, Spring injects/auto-wire the vehicle bean to the person bean through a class field and depedency injection.
    The below style is not recomended for production usage as we cant mark the field as final.
    
    Note:- @Autowired(required=false) will help to avoid the NoSuchBeanDefinitionException if the Bean is not available during Autowiring process.
    Ex.-
    @Autowired
    public Person(Vehicle vehicle){
        System.out.println("Person bean created by Spring");
        this.vehicle = vehicle;
    }

32: Wiring Beans using @Autowired annotation on setter method
    Ex.- 
    @Autowired
    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

33: Wiring Beans using @Autowired annotation on constructor
    Note:- From Spring 4.3, when we only have one constructor in the class, writing the @Autowired annotation is optional
    Ex.-
    @Autowired
    public Person(Vehicle vehicle){
        System.out.println("Person bean created by Spring");
        this.vehicle = vehicle;
    }

34: Deep dive of Autowiring inside Spring - Theory
    How autowiring works with multiple Beans of same type
    Step : 1
    -> By default Spring tries autowiring with class type. But this approach will fail if the same class type has multiple beans.
    -> If the Spring context has multiple beans of same class type, then Spring will try to auto-wire based on the parameter name/field name that
    we use while configuring autowiring annotation.
    -> In the below scenario, we used 'vehicle1' as constructor parameter. Spring will try to auto-wire with the bean which has same name like shown
    in the image below
        Ex.-
        @Component
        public class Person{
            private String name="Lucy";
            private final Vehicle vehicle;

            @Autowired
            public Person(Vehicle vehicle1){
                System.out.println("Person bean created by Spring");
                this.vehicle = vehicle1;
            }
        }

    Step : 2
    -> If the parameter name/field name that we use while configuring autowiring annotation is not matching with any of the bean names, then Spring
    will look for the Bean which has @Primary configured.

    Step : 3
    -> If the parameter name/field name that we use while configuring autowiring annotation is not matching with any of the bean names amd even 
    Primary bean is not configured, then Spring will look if @Qualifier annotation is used with the bean name watching with Spring context bean names.
    Ex.- 
    @Component
        public class Person{
            private String name="Lucy";
            private final Vehicle vehicle;

    @Autowired
        public Person(@Qualifier("vehicle2") Vehicle vehicle){
            System.out.println("Person bean created by Spring");
            this.vehicle = vehicle;
        }
    }

35: Deep dive of Autowiring inside Spring - Coding

36: Understanding and Avoiding Circular dependencies
    -> A circular dependency will happen if 2 beans are waiting for each to create inside the Spring context to do auto-wiring.
    -> Consider the below scenario, where Person has a dependency on Vehicle and Vehicle has a dependency on Person. In such scenarios, Spring will
    throw UnsatisfiedDependencyException due to circular reference.
    -> As a developer, it is our responsibility to make sure we are defining the configurations/dependencies that will result in circular depedency.
    Ex.-
    @Component
        public class Person{
            private String name="Lucy";
            private Vehicle vehicle;

            @Autowired
            public vois setVehicle(Vehicle vehicle){
                this.vehicle = vehicle;
            }
        }
    
    public class Vehicle {
        private String name;

        @Autowired
        private Person person;
    }

37: Problem statement for assignment related to Beans, Autowiring and DI 

38: Solution for assignment related to Beans, Autowiring and DI - example13 practical

############################################### SECTION 4: BEANS SCOPE INSIDE SPRING FRAMEWORK ###############################################

39: Introduction to Bean scope 
    Bean scope inside Spring 
    -> Singleton
    -> Prototype

    Below three scopes are related to web application
    -> Request
    -> Session
    -> Application 

40: Deep dive in Singleton Bean scope
    Singleton is the default scope of a Bean in Spring. In this scope, for a single Bean we always get a same instance when you refer or autowire 
    inside your application.
    Unlike Singleton design pattern where we have only 1 instance in entire app, inside Singleton scope Spring will make sure to have only 1 
    instance per unique bean. For example, if you have multiple beans of same type, then Spring Singleton scope will maintain 1 instance per 
    each beans declared of same type.

41: What is race condition
    A race condition occurs when two threads access a shared variable at the same time. The first thread reads the variable, and the second thread 
    reads the same value from the variable. Then the first thread and second thread perform their operations on the value, and they race to see 
    which thread can write the value last to the shared variable. The value of the thread that writes its value last is preserved, because the 
    thread is writing over the value that the previous thread wrote.


42: Usecases of Singleton bean scope
    -> Since the same instance of singleton bean will be used by multiple threads inside your application, it is very important that these beans 
    are immutable.
    -> This scope is more suitable for beans which handles service layer, repository layer business logic.

    Not:- Only create bean when there is business logic present in the program.

43: Deepdive of Eager and Lazy instantiation of Singleton scope
    -> By default Spring will create all the singleton beans eagerly during the startup of the application itself. This is called Eager 
    instantiation.
    -> We can change the default behavior to initialize the singleton beans lazily only when the application is trying to refer to the bean. 
    This approach is called Lazy instantiation.

44: Demo of Eager and Lazy instantiation of Singleton Bean
    @Component(value="personBean")
    @Lazy
    public class Person {
    private String name="Lucy";
    private final Vehicle vehicle;
    }

45: Eager Initialization Vs Lazy Initialization

46: Deepdive of Prototype Bean scope
    With prototype scope, every time we request a reference of a bean, Spring will create a new object instance and provide the same.
    Prototype scope is rarely used inside the applications and we can use this scope only in the scenarios where your bean will frequently change 
    the state of the data which will result race conditions inside multi thread environment. Using prototype scope will not create any race conditions.
    Ex.- 
    @Component
    @Scope(BeanDefinition.SCOPE_PROTOTYPE)
    public class VehicleServices {
    }

47: Singleton Beans Vs Prototype Beans

############################################### SECTION 5: ASPECT ORIENTED PROGRAMMING (AOP) ###############################################

48: Introduction to Aspect Oriented Programming (AOP)
    -> An aspect is  simply a piece of code the Spring Framework executes when you call specific method inside your app.
    -> AOP provides the way to dynamically add the cross-cutting concern before, after or around the actual logic using simple pluggable 
    configuration.
    -> AOP helps in separating and maintaining many non-business logic related code like logging, auditing, security, transaction management.
    -> AOP is a programming paradigm that aims to increse modularity by allowing the separation of cross-cutting concern. It does this by 
    adding additional behaviour to existing code without modifying the code itself.
    
49: Understanding the problems inside web applications with out AOP

50: Understanding & Running the Application with out AOP 

51: AOP Jargons
    When we define an Aspect or doing configurations, we need to follow WWW (3Ws)

    WHAT -> Aspect
    WHEN -> Advice
    WHICH -> Pintcut

    -> What code or logic we want the Spring to execute when you call a specific method. This is called as Aspect.
    -> When the Spring need to execute the given Aspect. For example is it before or after the method call. This is called Advice.
    -> Which method inside App that Framework needs to  intercept and execute the given Aspect. This is called as a Pointcut.

    Join point : which defines the event that triggers the execution of an aspect. Inside Spring, this event is always a method call.
    Target object : is the bean that declares the method/pointcut which is intercepted by an aspect.

52: Weaving inside AOP
    When we are implementing AOP inside our App using Spring framework, it will intercept each method call and apply the logic defined in the 
    Aspect.
    But how does this works ? Spring does this with the help of proxy object. So we try to invoke a method inside a bean, Spring instead of 
    directly giving reference of the bean instead it will give a proxy object that will manage the each call to a method and apply the aspect 
    logic. This process is called Weaving.

53: Types of Advice inside AOP
    -> @Before 
    -> @AfterReturning
    -> @AfterThrowing
    -> @After 
    -> @Around 

    -> Before advice runs before a matched method execution.
    -> After returning advice runs when a matched method execution completes normally.
    -> After throwing advice runs when a matched method execution exits by throwing an exception.
    -> After(finally) advice runs no matter how a matched method execution exits.
    -> Around advice runs "around" a matched method execution. It has the opportunity to do work both before and after the method runs and to 
       determine when, how,  and even if the method actually gets to run at all.

54: Configuring Advices inside AOP
    We can use the AspectJ Pointcut expression to provide details to Spring about what kind of methods it needs to intercept by mentioning details
    around modifier, return type, name pattern, param pattern, exception pattern etc.
    Below is the format of the same,
        execution(modifiers-pattern? ret-type-pattern declaring-type-pattern?name-pattern(param-pattern) throws-pattern?)

    Like shown below, we can mention the pointcut expressions as an input after advice annotations that we use,
    @Configuration
    @ComponentScan(basePackages = {"com.example.implementations","com.example.services","com.example.aspects"})
    @EnableAspectJAutoProxy
    public class ProjectConfig{

    }

    @Aspect
    @Component
    public class LoggerAspect {
        @Around("execution(*com.example.services.*.*(..))")
        public void log(ProceedJoinPoint joinPoint) throws throwable{
            //Aspect logic
        }
    }

55: Configuring @Around advice
    @EnableAspectJAutoProxy => Enables AOP inside the application.

    @Order annotation uses to define the priority of an aspect. it written on the class.
    
56: Configuring @Before advice

57: Configuring @AfterThrowing and @AfterReturning advices

58: Configuring Advices inside AOP with Annotations approach
    Alternatively, we can use Annotation style of configuring Advice inside AOP. Below are three steps that we follow for the same.
    Step : 1 Create an annotation type
    @Retention(RetentionPolicy.Runtime)
    @Target(ElementType.Method)
    public @interface LogAspect{

    } 

    Step : 2 Mention the same annotation on top of the method which we want to intercept using AOP
    @LogAspect 
    public String playMusic(boolean started, Song song){
        //Business logic
    }

    Step 3: Use the annotation details to configure on top of the aspect method to advice
    @Arround("@Annotation(com.example.interfaces.LogAspect)")
    public void logWithAnnotation(ProceedingJoinPoint joinPoint) throws Throwable {
        //Aspect logic
    }

59:  Demo of Configuring Advices inside AOP with Annotations approach

##################################### SECTION 6: BUILDING WEB APPLICATIONS USING SPRING BOT AND SPRING MVC #####################################

60: Quick Introduction about web applications
    Usually web applications can be:
    -> Only Frontend (Static Web App)
    -> Only Backend (APIs)
    -> Frontend + Backend (Ecommerce app)

    -> The Web clients sends a request using protocols like HTTP to Web Application asking some data like list of images, videos, text etc.
    -> The web server where web app is deployed receives the client requests and process the data it receives. Post that it will respond 
    to the clients request in the format of HTML, JSON etc.
    -> In Java web apps, Servlet Container (Web Server) takes care of translating the HTTP messages for Java code to understand. One of 
    the mostly used servlet container is Apache Tomcat.
    -> Servlet Container converts the HTTP messages into ServletRequest and hand over to Servlet method as a parameter. Similarly, 
    ServletResponse returns as an output to Servlet Container from Servlet.
        
61: Role of Servlets inside web applications
    Before Spring : 
    -> Before Spring, developer has to create a new servlet instance, configure it in the servlet container, and assign it to a specific 
    URL path.
    -> When the client sends a request, Tomcat calls a method of the servlet associated with the path the client requested. The servlet gets
    the values on the request and builds the response that Tomcat sends back to the client.
    Note: All the configuration of web we have to write in .xml file.
    
    With Spring : 
    -> With Spring, it defines a servlet called Dispatcher Servlet which maintain all the URL mapping inside a web application.
    -> The servlet container calls the Dispatcher Servlet for any client request, allowing the servlet to manage the request and the response.
    This way Spring internally doest all the magic for Developers with out the need of defining the servlets inside a Web App.

62: Evolution of Web Apps inside Java ecosystem
    Somewhere in 2000s:
    JSP/JSF                     JDBC
    HTML/CSS                    SOAP  
    Servlets                    J2EE 
     
    Somewhere in 2010s:
    JSP/JSF                     MVC
    HTML/CSS                    SOAP/REST  
    Jquery/Bootstrap            ORM 

    Somewhere in 2020s:
    Angular                     ReactJS
    HTML/CSS                    REST 
    ORM/JPA                     Cloud
    Microservices               Docker/K8s
    
63: Types of Web Apps we can build with Spring
    Approach 1:
    Web Apps which holds UI elements like HTML, CSS, JS and backend logic.
    Here the App is responsible to fully prepare the view along with data in response to a client request.
    Spring Core, Spring MVC, SpringBoot, Spring Data, Spring Rest, Spring Security will be used.

    Approach 2:
    Web Apps which holds only backend logic. These Apps send data like JSON to separate UI Apps built based on Angular, React etc.
    Here the App is responsible to only process the request and respond with only data ignoring view.
    Spring Core, SpringBoot, Spring Data, Spring Rest, Spring Security will be used.

    When we are building an app using MVC that means we are creating a web app 
    But When we are building an app without using Spring MVC then we can say that we are creating backend.

64: Introduction to Spring Boot - The Hero of Spring framework
    -> Spring Boot was introduced in April 2014 to reduce some of the burdens while developing a Java web application.
    -> Before SpringBoot, Developer need to configure a servlet container, establish link b/w Tomcat and Dispatcher servlet, deploy into 
    a server, define lot of dependencies……
    -> But with SpringBoot, we can create Web Apps skeletons within seconds or at least in 1-2 mins 😊. It helps eliminating all the 
    configurations we need to do.
    -> Spring Boot is now one of the most appreciated projects in the Spring ecosystem. It helps us to create Spring apps more efficiently and 
    focus on the business code.
    -> SpringBoot is a mandatory skill now due to the latest trends like Full Stack Development, Microservices, Serverless, Containers, Docker etc.

65: Springboot important features
    -> SpringBoot Starters
    -> Autoconfiguration
    -> Actuator & DevTools

66: Creating simple web application using Spring Boot

67: Running simple web application using Spring Boot
    Note: with the help of Spring Boot starter Projects we should be able to generate the maven project within seconds. and most of the 
    configurations and dependencies were taken care by the SpringBoot itself

    Note: In the "Main" class we have to annotate with @SpringBootApplication
    Note: @EnableAutoConfiguration annotation tells Spring to please configure all inter-related dependencies that needed by my web application.
    Note: @Controller annotation indicates that a particular class serve the role of a controller.

68: Changing the default server port & context path of SpringBoot Web application
    We can configure our properties in application.properties file.
    Configuration in properties file => 
    server.port=8081
    server.servlet.context-path=/eazyschool

69: Random server port number inside SpringBoot
    Note: sever.port=0 means consider a random port number, Spring will assign it on its own on runtime. 
    We want to run multiple instances then we have to user port number as "0".

70: Demo of Spring Boot AutoConfiguration
    Note: we can see that what SpringBoot will create Beans by using a property debug=true in application.property file, that tells us that what
    Beans it created.

    When we want that Spring won’t AutoConfigure a class’s bean itself then we have to define the class name as below mentioned - 
    @SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })

71: Quick Recap
    -> We can identify the Spring Boot main class by looking for an annotation @SpringBootApplication.
    A single @SpringBootApplication annotation can be used to enable those three features, that is:
    -> @EnableAutoConfiguration: enable Spring Boot’s auto-configuration mechanism
    -> @ComponentScan: enable @Component scan on the package where the application is located
    -> @SpringBootConfiguration: enable registration of extra beans in the context or the import of additional configuration classes. 
        An alternative to Spring’s standard @Configuration annotation

    -> The @RequestMapping annotation provides “routing” information. It tells Spring that any HTTP request with the given path should be mapped 
    to the corresponding method. It is a Spring MVC annotation and not specific to Spring Boot.
    
    -> server.port and server.servlet.context-path properties can be mentioned inside the application.properties to change the default port number 
    and context path of a web application.

    -> Mentioning server.port=0 will start the web application at a random port number every time.

    -> Mentioning debug=true will print the Autoconfiguration report on the console. We can mention the exclusion list as well for SpringBoot 
    auto-configuration by using the below config,
    @SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })

################################ SECTION 7: ADAPTING THYMELEAF FOR BUILDING DYNAMIC CONTENT IN SPRING MVC WEB APPS ################################

72: Quick Tip - Mapping multiple paths inside Spring Web Application
    We can configure multiple paths against a single method using Spring MVC annotations.
    @RequestMapping(value={"","/","/home"})
    public String displayHomePage(Model model) {
        return "home.html";
    }

73: Introduction to Thymeleaf
    -> Thymeleaf is a modern server-side Java template engine for both web and standalone environments. This allows developers to build dynamic 
    content inside the web applications.
    -> Thymeleaf will convert your template into a html file.
    -> Thymeleaf has great integration with Spring especially with Spring MVC, Spring Security etc.
    -> The Thymeleaf + Spring integration packages offer a SpringResourceTemplateResolver implementation which uses all the Spring infrastructure 
    for accessing and reading resources in applications, and which is the recommended implementation in Spring-enabled applications.
        <table>
            <thead>
                <tr>
                <th th:text="#{msgs.headers.name}">Name</th>
                <th th:text="#{msgs.headers.price}">Price</th>
                </tr>
            </thead>
            <tbody>
                <tr th:each="prod : ${allProducts}">
                <td th:text="${prod.name}">Oranges</td>
                <td th:text="${#numbers.formatDecimal(prod.price, 1, 2)}">0.99</td>
                </tr>
            </tbody>
        </table>
    
        Other famous template engines supported by Spring:
        Jakarta Server Pages (JSP)
        Jakarta Server Faces (JSF)
        Apache FreeMarker
        Groovy

74: Building dynamic content using Thymeleaf
    If you had to add dynamic value then write as below
    <h1 th:text="'Hello, ' + ${username} + '!!! 'Welcome to Eazy School.'"></h1>

75: Disabling Thymeleaf template caching
    spring.thymeleaf.cache=false 
    this modification in application.property

76: Introduction to Spring Boot DevTools
    The SpringBoot DevTools provides features like Automatic restart & LiveReload that make the application  development experience a little 
    more pleasent for developers.
    It can be added into any of the SpringBoot project by adding the below Maven Dependency.
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-devtools</artifactId>
    </dependency>

    -> DevTools maintains 2 class loaders. one with classes that doesn’t change and other one with classes that change. When restart needed 
    it only reload the second class loader which makes restarts faster as well.

    -> DevTools includes an embedded LiveReload server that can be used to trigger a browser refresh when a resource is changed. 
    LiveReload related browser extensions are freely available for Chrome, Firefox

    ->  DevTools triggers a restart when ever a build is triggered through IDE or by maven commands etc.
        DevTools disables the caching options by default during development.
        Repackaged archives do not contain DevTools by default.

    DevTools only works with the SpringBoot not with the Spring or Spring MVC.

    ClassLoader is a place where we deploy all our classes that way our code will be executed.
    With DevTools it is not required to add caching property because it do by its own we don’t have to tell.

77: Implemetation & Demo of Spring Boot DevTools

78:  Building Home Page of EazySchool Web Application

79: Understanding the Home Page source code of EazySchool

80: Deep Dive of Spring MVC Internal architecture
    Model View Controller Design Pattern: Separation of Concern to achieve loose coupling
    Model: Represent the data of the application like name, age, student list etc. It stores & manages the data.
    View: Represents UI and usually takes data from the controller and display it with the help of HTML pages.
    Controller: Controls the flow and decides which business logic needs to be executed. It acts as a Brain inside MVC pattern.

    1. Web Client makes HTTP request
    2. Servlet Containers like Tomcat accepts the HTTP requests and handovers the Servlet Request to Dispatcher Servlet inside Spring Web App.
    3. The Dispatcher Servlet will check with the Handler Mapping to identify the controller and method names to invoke based on the HTTP method, 
    path etc.
    4. The Dispatcher Servlet will invoke the corresponding controller & method. After execution, the controller will provide a view name and data 
    that needs to be rendered in the view.
    5. The Dispatcher Servlet with the help of a component called View Resolver finds the view and render it with the data provided by the 
    controller.
    6. The Servlet Container or Tomcat accepts the Servlet Response from the Dispatcher servlet and convert the same to HTTP response before 
    returning to the client.
    7. The browser or client intercepts the HTTP response and display the view, data etc.

    ✅ Highlighted terms:
    Dispatcher Servlet (in step 2)
    Handler Mapping (in step 3)
    View Resolver (in step 5)

81: Separation of Header and Footer code using Thymeleaf replace tag

82: Building Courses Web Page of Eazy School Web Application
    Quick Tip :-
    Do you know, we can register view controllers that create a direct mapping between the URL and the view name using the ViewControllerRegistry. 
    This way, there’s no need for any Controller between the two.

        @Configuration
        public class WebConfig implements WebMvcConfigurer {
        @Override
        public void addViewControllers(ViewControllerRegistry registry) {
            registry.addViewController("/courses").setViewName("courses");
            registry.addViewController("/about").setViewName("about");
            }
        }

    Note: We can do mapping also in the backend without the need of controller class with the help of WebMvcConfigurer class.

83: Quick Tip - Resolving Build & Cache issues inside maven projects
    Deleting the target folder will clear the cache and forces mavenn to rebuild the project so that new changes will apply as we want.
    
84: Building About Page of Eazy School Web Application

85: Building Contact Page of Eazy School Web Application

86: Submit information from Contact page using @RequestParam

87: Submit information from Contact page using POJO object

88: Define actions for all the links in the Home & Footer page

89: Building Holidays Page of Eazy School Web Application

#################################################### SECTION 8: DEEP DIVE OF LOMBOK LIBRARY ####################################################

90: Introduction to Lombok library
    -> Java expects lot of boilerplate code inside POJO classes like getters and setters.
    Lombok, which is a Java library provides you with several annotations aimed at avoiding writing Java code known to be repetitive 
    -> and/or boilerplate.
    -> It can be added into any of the Java project by adding the below maven dependency.

    <dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    </dependency>

    -> Project Lombok works by plugging into your build process. Then, it will auto-generate the Java bytecode into your .class files 
    required to implement the desired behavior, based on the annotations you used.

    -> Most commonly used Lombok annotations,
    @Getter, @Setter
    @NoArgsConstructor
    @RequiredArgsConstructor
    @AllArgsConstructor
    @ToString, @EqualsAndHashCode
    @Data
    
    -> @Data is a shortcut annotation that combines the features of below annotations together,
    @ToString
    @EqualsAndHashCode
    @Getter, @Setter
    @RequiredArgsConstructor

91: Implementing Lombok inside Eazy School Web App

92: Demo of @Slf4j (Simple Logging Facade for Java) annotation from Lombok library
    This annotation will generate a log object which is very quielent to 
                            ||
    private static Logger log = LoggerFactory.getLogger(ContactService.class)

##################################### SECTION 9: PROCESSING QUERY PARAMS & PATH VARIABLES INSIDE SPRING #####################################

93: Accepting Query Params using @RequestParam annotation - Theory
    • In Spring @RequestParam annotation is used to map either query parameters or form data.
    • For example, if we want to get parameters value from a HTTP GET requested URL then we can use @RequestParam annotation like in below example.
        http://localhost:8080/holidays?festival=true&federal=true

            @GetMapping("/holidays")
            public String displayHolidays(@RequestParam(required = false) boolean festival,
            @RequestParam(required = false) boolean federal) {
            // Business Logic
            return "holidays.html";
            }

    ✓ The @RequestParam annotation supports attributes like name, required, value, defaultValue.We can use them in our application based on 
    the requirements.

    ✓ The name attribute indicates the name of the request parameter to bind to.
    ✓ The required attribute is used to make a field either optional or mandatory.
    If it is mandatory, an exception will throw in case of missing fields.

    ✓ The value attribute is similar to name elements and can be used as an alias.
    ✓ defaultValue for the parameter is to handle missing values or null values.
    If the parameter does not contain any value then this default value will be considered.

94: Accepting Query Params using @RequestParam annotation - Coding

95: Accepting Path Params using @PathVariable annotation - Theory
    • The @PathVariable annotation is used to extract the value from the URI. It is most suitable for the RESTful web service where the URL 
    contains some value. Spring MVC allows us to use multiple @PathVariable annotations in the same method.
    • For example, if we want to get the value from a requested URI path, then we can use @PathVariable annotation like in below example.

            http://localhost:8080/holidays/all
            http://localhost:8080/holidays/federal
            http://localhost:8080/holidays/festival

        @GetMapping("/holidays/{display}")
         public String displayHolidays(@PathVariable String display) {
         //Business Logic
         return "holidays.html";
        }

        ✓ The @PathVariable annotation supports attributes like name, required, value similar to @RequestParam.
        We can use them in our application based on the requirements.

96: Accepting Path Params using @PathVariable annotation - Coding

##################################### SECTION 10: VALIDATING THE INPUT USING JAVA & HIBERNATE VALIDATORS #####################################

97: Importation of Validations insed Web Application

98: Introduction to Java Bean Validations
    • Bean Validation (https://beanvalidation.org/) is the standard for implementing validations in the Java ecosystem. It’s 
    well integrated with Spring and Spring Boot.
    • Below is the maven dependency that we can add to implement Bean validations in any Spring/SpringBoot project.

    <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-validation</artifactId>
    </dependency>

    -> Bean Validation works by defining constraints to the fields of a class by annotating them with certain annotations.
    -> We can put the @Valid annotation on method parameters and fields to tell Spring that we want a method parameter or field to be validated.
    -> Below are the important packages where validations related annotations can be identified,
    ✓ jakarta.validation.constraints.*
    ✓ org.hibernate.validator.constraints.*

    jakarta.validation.constraints.*                        org.hibernate.validator.constraints.*
    ✓ @Digits                                                 ✓ @CreditCardNumber
    ✓ @Email                                                  ✓ @Currency
    ✓ @Max                                                    ✓ @Range
    ✓ @Min                                                    ✓ @URL
    ✓ @NotBlank                                               ✓ @UniqueElements
    ✓ @NotEmpty                                               ✓ @EAN
    ✓ @NotNull                                                ✓ @ISBN
    ✓ @Pattern
    ✓ @Size

99: Adding Bean Validation annotations inside Contact POJO class
   Note: If the Java version is less than 17 then the package name of the validators class are javax,  and if the java version is 17 or above
   then the package name should be jakarta packages.\

100: Adding Bean Validation related changes inside EazySchool Web Application
     Note: When we are refering the Bean then we have to use ($) and 
     When we are refering the field we have to use (*) sign.  

101: Demo of Bean Validations inside Contact form Page
     • Sample validations declaration inside a Java POJO class.

        @Data
        public class Contact {

        @NotBlank(message = "Email must not be blank")
        @Email(message = "Please provide a valid email address")
        private String email;

        @NotBlank(message = "Subject must not be blank")
        @Size(min = 5, message = "Subject must be at least 5 characters long")
        private String subject;

        @NotBlank(message = "Message must not be blank")
        @Size(min = 10, message = "Message must be at least 10 characters long")
        private String message;
        }

     • We can put the @Valid annotation on method parameters to tell Spring framework that we want a particular POJO object needs to be 
     validated based on the validation annotation configurations. For any issues, framework populates the error details inside the Errors 
     object. The errors can be used to display on the UI to the user. Sample example code is below.
   
     @RequestMapping(value = "/saveMsg", method = POST)
    public String saveMessage(@Valid @ModelAttribute("contact") Contact contact, Errors errors) {

    if (errors.hasErrors()) {
        log.error("Contact form validation failed due to : " + errors.toString());
        return "contact.html";
    }

    contactService.saveMessageDetails(contact);
    return "redirect:/contact";
    }

    <ul>
    <li class="alert alert-danger" role="alert"
        th:each="error : ${#fields.errors('contact.*')}"
        th:text="${error}" />
    </ul>

############################################### SECTION 11: BEANS WEB SCOPE INSIDE SPRING FRAMEWORK ###############################################

102: Introduction to Spring Web Scopes
    Web Scopes inside Spring
    -> Request (@RequestScope)
    -> Session (@SessionScope)
    -> Application (@ApplicationScope)

    1 Request Scope – Spring creates an instance of the bean class for every HTTP request. The instance exists only for that specific 
    HTTP request.
    2 Session Scope – Spring creates an instance and keeps the instance in the server’s memory for the full HTTP session. Spring links the 
    instance in the context with the client’s session.
    3 Application Scope – The instance is unique in the app’s context, and it’s available while the app is running.

103: Use Cases of Spring Web Scopes
    Request Scope
    ✓ Many Beans for One/Many Session Every Time.
    ✓ Creates every bean for every HTTP request, creates lots of Bean.
    ✓ Spring creates a lot of instances of this bean in the app’s memory for each HTTP request. So these types of beans are short-lived.
    ✓ Since Spring creates a lot of instances, please make sure to avoid time-consuming logic while creating the instance.
    ✓ Can be considered for the scenarios where the data needs to be reset after new request or page refresh etc.

    Session Scope
    ✓ One Bean for One Session.
    ✓ When the session is open the Bean is open.
    ✓ Session scoped beans have longer life & they are less frequently garbage collected.
    ✓ Avoid keeping too much information inside session data as it impacts performance. Never store sensitive information as well.
    ✓ Can be considered for the scenarios where the same data needs to be accessed across multiple pages like user information.

    Application Scope
    ✓ One Bean for all Session.
    ✓ Bean created once and many browsers/http/user can access the same Bean, Other Bean could not be created.
    ✓ In the application scope, Spring creates a bean instance per web application runtime.
    ✓ It is similar to singleton scope, with one major difference. Singleton scoped bean is singleton per ApplicationContext where application 
    scoped bean is singleton per ServletContext.
    ✓ Can be considered for the scenarios where we want to store Drop Down values, Reference table values which won’t change for all the users.

104: Demo of @RequestScope inside Eazy School Web Application

105: Demo of @SessionScope inside Eazy School Web Application

106: Demo of @ApplicationScope inside Eazy School Web Application

######################################## SECTION 12: IMPLEMENT SECURITY INSIDE WEB APP - SECURITY PART-1 ########################################

107: Introduction to Spring Security
    • Spring Security is a powerful and highly customizable authentication and access-control framework. It is the de-facto standard for 
    securing Spring-based applications.
    • Below is the maven dependency that we can add to implement security using Spring Security project in any of the SpringBoot projects,
    <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
    </dependency>

    -> Spring Security is a framework that provides authentication, authorization, and protection against common attacks.
    -> Spring Security helps developers with easier configurations to secure a web application by using standard username/password 
    authentication mechanism.
    -> Spring Security provides out of the box features to handle common security attacks like CSRF, CORS. It also has good 
    integration with security standards like JWT, OAUTH2 etc.

108: Deepdive of Authentication Vs Authorization
    AUTHENTICATION
    -> In authentication, the identity of users are checked for providing the access to the system.
    -> Authentication done before authorization.
    -> It needs usually user login details.
    -> If authentication fails usually we will get 401 error response.
    -> For example as a Bank customer/employee in order to perform actions in the app, we need to prove our identity.

    AUTHORIZATION
    -> In authorization, person’s or user’s authorities are checked for accessing the resources.
    -> Authorization always happens after authentication.
    -> It needs user’s privilege or roles.
    -> If authorization fails usually we will get 403 error response.
    -> Once logged into the application, my roles, authorities will decide what kind of actions I can do.
   
109: Demo of Spring Security inside Eazy School Web App with default behavior

110: Configure custom credentials inside Spring Security
    
    Quick Tip => 
    Do you know,

    ✔ As soon as we add spring security dependency to a web application, by default it protects all the pages/APIs inside it. 
    It will redirect to the inbuilt login page to enter credentials.
    ✔ The default credentials are user and password is randomly generated & printed on the console.
    ✔ We can configure custom credentials using the below properties to get started for POCs etc. But for PROD applications, Spring Security 
    supports user credentials configuration inside DB, LDAP, OAUTH2 Server etc.
    
111: IMPORTANT NOTE about Spring Security
    Starting from Spring Security 6.1 and Spring Boot 3.1.0 versions, the Spring Security framework team recommends using the Lambda DSL 
    style for configuring security for APIs, web paths, etc. Consequently, they have deprecated a few methods within the framework. These 
    deprecated methods are planned to be removed in Spring Security 7, which is expected to be released in the next 2-3 years. This timeframe 
    allows all developers sufficient time for migrating their code.

    However, theres no need to worry as this change does not alter the underlying concepts, . Instead of using normal Java configurations, 
    we will now employ the Lambda DSL. Below, you will find an example code snippet illustrating the differences between the two styles:

    Please note that the course is recorded using Spring Boot 3 and Spring Security 6 versions, where normal Java style configurations are used 
    instead of Lambda DSL. Therefore, I encourage you to follow the videos to understand the concepts, methods, configurations, etc., and try to 
    use Lambda DSL style configurations.
    For your reference, I have updated the code in the GitHub repository to use the Lambda DSL style. You should be able to comprehend the 
    Lambda DSL style, but if you have any questions, please feel free to reach out to me.
    The Lambda DSL was created to accomplish to following goals:
    Automatic indentation makes the configuration more readable.
    The is no need to chain configuration options using .and()
    The Spring Security DSL has a similar configuration style to other Spring DSLs such as Spring Integration and Spring Cloud Gateway.

112: Understanding default security configurations inside Spring Security framework
    By default, Spring Security framework protects all the paths present inside the web application. This behaviour is due to the code 
    present inside the method defaultSecurityFilterChain(HttpSecurity http) of class SpringBootWebSecurityConfiguration

    @Bean
    @Order(SecurityProperties.BASIC_AUTH_ORDER)
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
    http.authorizeHttpRequests().anyRequest().authenticated();
    http.formLogin();
    http.httpBasic();
    return http.build();
    }

113: Configure permitAll() inside Web App using Spring Security
    Using permitAll() configurations we can allow full/public access to a specific resource/path or all the resources/paths inside 
    a web application.
    Below is the sample configuration that we can do in order to allow any requests in a Web application without security.

    @Configuration
    public class ProjectSecurityConfig {
    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {

        http.authorizeHttpRequests()
            .anyRequest().permitAll()
            .and().formLogin()
            .and().httpBasic();

        return http.build();
        }
    }

    ☁️ Form Login provides support for username and password being provided through an HTML form.
    ☁️ HTTP Basic Auth uses an HTTP header in order to provide the username and password when making a request to a server.

114: Configure denyAll() inside Web App using Spring Security
    Using denyAll() configurations we can deny access to a specific resource/path or all the resources/paths inside a web application 
    regardless of user authentication.
    Below is the sample configuration that we can do in order to deny any requests that is coming into a web application.

    @Configuration
    public class ProjectSecurityConfig {
    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {

        http.authorizeHttpRequests()
            .anyRequest().denyAll()
            .and().formLogin()
            .and().httpBasic();

        return http.build();
        }
    }

    ☁️ Usually denyAll() is used to retire a specific API temporarily without removing the code.
    ☁️ permitAll() is used to allow public access to public APIs, paths, CSS, images, JS files etc.

115:  Configure custom security configurations using Spring Security
    .authenticated() used to secure a specific entire page

    .requestMatchers("/holidays/**").permitAll()
    .requestMatchers("/courses").authenticated()

116: Demo of CSRF protection & CSRF Disable inside Spring Security framework 
    CSRF = Cross-Site Request Forgery
    • We can apply custom security configurations based on our requirements for each API/URL like below.
    • permitAll() can be used to allow access w/o security and authenticated() can be used to protect a web page/API.
    • By default any requests with HTTP methods that can update data like POST, PUT will be stopped with 403 error due to CSRF protection. 
    We can disable the same for now and enable it in the coming sections when we started generating CSRF tokens.
    • Below is the sample configuration that we can do to implement custom security configs and disable CSRF.

    @Configuration
    public class ProjectSecurityConfig {
    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests()
                .requestMatchers("/dashboard").authenticated()
                .requestMatchers("", "/", "/home").permitAll()
                .requestMatchers("/holidays/**").permitAll()
                .requestMatchers("/contact").permitAll()
                .requestMatchers("/saveMsg").permitAll()
                .requestMatchers("/courses").permitAll()
                .requestMatchers("/about").permitAll()
                .requestMatchers("/assets/**").permitAll()
            .and().formLogin()
            .and().httpBasic();
        return http.build();
        }
    }

117: Configure multiple users using inMemoryAuthentication() of Spring Security
    • Spring Security provide support for username/password based authentication based on the users stored in application memory.
    • Like mentioned below, we can configure any number of users & their roles, passwords using in-memory authentication.

    @Configuration
    public class ProjectSecurityConfig {
        @Bean
        SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception { ... }
        @Bean
        public InMemoryUserDetailsManager userDetailsService() {

            UserDetails admin = User.withDefaultPasswordEncoder()
                .username("user")
                .password("12345")
                .roles("USER")
                .build();

            UserDetails user = User.withDefaultPasswordEncoder()
                .username("admin")
                .password("54321")
                .roles("USER", "ADMIN")
                .build();

            return new InMemoryUserDetailsManager(user, admin);
        }
    }

    ☁️ Note:
    In-memory authentication is ideal for POC (Proof of Concept) web apps or internal web apps used only in non-production environments.
    NEVER EVER use in-memory authentication for production web applications.

118: Implement Login & Logout inside Web App - Part 1
    • Spring Security allows us to configure a custom login page to our web application instead of using the Spring Security default 
    provided login page.
    • Similarly we can configure logout page as well.
    • Below is the sample configuration that we can follow.

    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
    http.csrf().disable()
        .authorizeHttpRequests()
            .requestMatchers("/dashboard").authenticated()
            .requestMatchers("", "/", "/home").permitAll()
            .requestMatchers("/holidays/**").permitAll()
            .requestMatchers("/contact").permitAll()
            .requestMatchers("/saveMsg").permitAll()
            .requestMatchers("/courses").permitAll()
            .requestMatchers("/about").permitAll()
            .requestMatchers("/assets/**").permitAll()
            .requestMatchers("/login").permitAll()
        .and().formLogin()
            .loginPage("/login")
            .defaultSuccessUrl("/dashboard").failureUrl("/login?error=true").permitAll()
        .and().logout()
            .logoutSuccessUrl("/login?logout=true")
            .invalidateHttpSession(true).permitAll()
        .and().httpBasic();
        return http.build();
    }

    ☁️ Note:
    Configured login page will be shown if the user tries to access a secured page/resource without a valid authenticated session.
    The same behavior applies for the default login page provided by Spring Security.

119: Implement Login & Logout inside Web App - Part 2

120: Implement Login & Logout inside Web App - Part 3

121: Demo of integration between ThymeLeaf & Spring Security
    💡 Do you know, Thymeleaf has a great integration with Spring Security.
    More details can be found at
    🔗 https://www.thymeleaf.org/doc/articles/springsecurity.html

    Step 1: Add the below dependency in the pom.xml
    <dependency>
    <groupId>org.thymeleaf.extras</groupId>
    <artifactId>thymeleaf-extras-springsecurity6</artifactId>
    </dependency>

    Step 2: Add the below XML namespace which enables us to use Thymeleaf Security-related tags
    <html lang="en" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity6">

    Step 3: Use any of the Thymeleaf Security tags inside HTML code based on Authentication details
    sec:authorize="isAnonymous()" 
    sec:authorize="isAuthenticated()" 
    sec:authorize="hasRole('ROLE_ADMIN')" 
    sec:authentication="name" 
    sec:authentication="principal.authorities"

################################## SECTION 13: EXCEPTION HANDLING USING @ControllerAdvice & @ExceptionHandler ##################################

122: Introduction to @ControllerAdvice & @ExceptionHandler annotations
    • @ControllerAdvice is a specialization of the @Component annotation which allows handling exceptions across the whole application in one 
    global handling component.
    You can think of it as an interceptor of exceptions thrown by methods annotated with @RequestMapping or one of the shortcuts like @GetMapping, 
    etc.
    • We can define the exception handle logic inside a method and annotate it with @ExceptionHandler.
    • Below is the sample configuration that we can follow.

    @ControllerAdvice
    public class GlobalExceptionController {
    @ExceptionHandler(Exception.class)
    public ModelAndView exceptionHandler(Exception exception) {
        ModelAndView errorPage = new ModelAndView();
        errorPage.setViewName("error");
        errorPage.addObject("errormsg", exception.getMessage());
        return errorPage;
        }
    }

    ☁️ Note:
    Combination of @ControllerAdvice & @ExceptionHandler can handle exceptions across all controllers inside a web application globally.

123: Demo of @ControllerAdvice & @ExceptionHandler annotations
    💡 Do you know,

    ✅ If a method annotated with @ExceptionHandler is present inside a @Controller class, then the exception handling logic will be applicable 
    for any exceptions occurred in that specific controller class.

    ✅ If the same @ExceptionHandler annotated method is present inside a @ControllerAdvice class, then the exception handling logic will be 
    applicable for any exceptions occurred across all the controller classes.

    ✅ Using @ExceptionHandler annotation, we can handle any number of exceptions like the below sample code:

    @ExceptionHandler({NullPointerException.class,
                   ArrayIndexOutOfBoundsException.class,
                   IOException.class})
        public ModelAndView handleException(RuntimeException ex) {
        // Exception handling logic
    }

################################## SECTION 14: IMPLEMENT CSRF FIX INSIDE WEB-APP SPRING SECURITY PART-2 ##################################

124: Deep dive of CSRF attack
    • A typical Cross-Site Request Forgery (CSRF or XSRF) attack aims to perform an operation in a web application on behalf of a user 
    without their explicit consent. In general, it doesn’t directly steal the user’s identity, but it exploits the user to carry out an 
    action without their will.
    • Consider you are using a website netflix.com and the attacker’s website evil.com.

    Step 1: The Netflix user logs in to Netflix.com, and the backend server of Netflix will provide a cookie which will store in the browser 
    against the domain name Netflix.com

    👤 User submits their credentials & tries to log in to Netflix.com
    ➡️ Netflix server creates a cookie & saves it in the user’s browser against the Netflix.com domain name.

    Step 2: The same Netflix user opens an evil.com website in another tab of the browser.

    👤 User accesses an evil blog/site hosted on evil.com
    ⬅️ evil.com returns a web page that has an embedded malicious link to change the email ID of the Netflix account.
    But the link appears with a text like — “90% OFF on iPhone”

    Step 3 : User tempted and clicked on the malicious link which makes a request to Netflix.com. And since the login cookie already present 
    in the same browser and the request to change email is being made to the same domain Netflix.com, the backend server of Netflix.com can’t 
    differentiate from where the request came. So here the evil.com forged the request as if it is coming from a Netflix.com UI page.

    (User clicks on a link on evil.com which has content something like below)
    Boom !! The email of the Netflix account changed

    <form action="https://netflix.com/changeEmail"
      method="POST" id="form">
    <input type="hidden" name="email" value="user@evil.com">
    </form>

    <script>
        document.getElementById('form').submit()
    </script>

125: Solution for CSRF attack - Theory
    • To defeat a CSRF attack, applications need a way to determine if the HTTP request is legitimately generated via the application’s user 
    interface. The best way to achieve this is through a CSRF token. A CSRF token is a secure random token that is used to prevent CSRF attacks. 
    The token needs to be unique per user session and should be of large random value to make it difficult to guess.

    • Let’s see how this solve CSRF attack by taking the previous Netflix example again.

    Step 1 :
    The Netflix user login to Netflix.com and the backend server of Netflix will provide a cookie which will store in the browser against the 
    domain name Netflix.com along with a randomly generated unique CSRF token for this particular user session. CSRF token is inserted within 
    hidden parameters of HTML forms to avoid exposure to session cookies.

    (User submit his credentials & try to login to Netflix.com)
    (Netflix server create a cookie & randomly generated CSRF token)
        
    Step 2 :
    The same Netflix user opens an evil.com website in another tab of the browser.

    (User accessed an evil blog/site hosted on evil.com)
    (evil.com returns a web page which has an embedded malicious link to change email of Netflix account. But link appears with a text like 
    “90% OFF on iPhone”)

    Step 3 : User tempted and clicked on the malicious link which makes a request to Netflix.com. And since the login cookie already present in 
    the same browser and the request to change email is being made to the same domain Netflix.com. This time the Netflix.com backend server 
    expects CSRF token along with the cookie. The CSRF token must be same as initial value generated during login operation.

    (User clicks on a link on evil.com which has content something like below)
    Boom !! The Netflix threw an error 403

    Note:- The CSRF token will be used by the application server to verify the legitimacy of the end-user request if it is coming from the 
    same App UI or not. The application server rejects the request if the CSRF token fails to match the test.

    Do you know,

    ✅ By default, Spring Security enables CSRF fix for all the HTTP methods which results in data change like POST, DELETE, etc. But not for GET.

    ✅ Using Spring Security configurations we can disable the CSRF protection for complete application or for only few paths based on our 
    requirements like below:

    http.csrf().disable()
    http.csrf().ignoringRequestMatchers("/saveMsg")

    ✅ Thymeleaf has great integration & support with Spring Security to generate a CSRF token.
    We just need to add the below code in login HTML form code and Thymeleaf will automatically append the CSRF token for the remaining 
    pages/forms inside the web application:
    
    <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}" />

126: Solution for CSRF attack - Coding

################################## SECTION 15: DEEP DIVE ON SPRINGBOOT H2 DATABASE & SPRING JDBC FRAMEWORK ##################################

127: Introduction to in-memory H2 Database of Spring Boot
        H2 provides a fast in-memory database that supports JDBC API and R2DBC access.
        <dependency>
        <groupId>com.h2database</groupId>
        <artifactId>h2</artifactId>
        <scope>runtime</scope>
        </dependency>

    🟩 Since it is an internal memory DB, we need to create the schema and data that is needed during startup of the App. Any updates to the 
    data will be lost after restarting the server.

    🟨 To create schema & data for the H2 DB, we can add schema.sql & data.sql inside the maven projects resources folder. Any table creation 
    scripts and DB records scripts can be present inside schema.sql and data.sql respectively.

    🟪 By default, the H2 web console is available at /h2-console. You can customize the console’s path by using the spring.h2.console.path 
    property.

    The default credentials of H2 DB are username is sa and password is "" (Empty)

128: Setup H2 Database inside a Spring Boot web application

129: Introduction to JDBC & problems with it
    Key points of JDBC
    Intro to JDBC=>

    ✅ JDBC or Java Database Connectivity is a specification from Core Java that provides a standard abstraction for Java apps to communicate 
    with various databases.
    ✅ JDBC API along with the database driver is capable of accessing databases.
    ✅ JDBC is a base framework or standard for frameworks like Hibernate, Spring Data JPA, MyBatis etc.

    Steps in JDBC to access DB=>
    We need to follow the below steps to access DB using JDBC,

    Load Driver Class
    Obtain a DB connection
    Obtain a statement using connection object
    Execute the query
    Process the result set
    Close the connection

    Problem with JDBC=>
    ✅ Developers are forced to follow all the steps mentioned to perform any kind of operation with DB which results in a lot of duplicate 
    code at many places.
    ✅ Developers need to handle the checked exceptions that will throw from the API.
    ✅ JDBC is database dependent.

130: Introduction to Spring JDBC
    • Spring JDBC simplifies the use of JDBC and helps to avoid common errors. It executes core JDBC workflow, leaving application code to 
    provide SQL and extract results. It does this magic by providing JDBC templates which developers can use inside their applications.

    • Below is the maven dependency that we need to add to any Spring/SpringBoot projects in order to use Spring JDBC provided templates,
    <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-jdbc</artifactId>
    </dependency>

    -> Spring provides many templates for JDBC related activities. Among them, the famous ones are JdbcTemplate, NamedParameterJdbcTemplate.
    -> JdbcTemplate is the classic and most popular Spring JDBC approach. This avoids “lowest-level” approach and all others templates uses 
    JdbcTemplate under the covers.
    -> NamedParameterJdbcTemplate wraps a JdbcTemplate to provide named parameters instead of the traditional JDBC ? placeholders. This approach 
    provides better documentation and ease of use when you have multiple parameters for an SQL statement.

131: Deep dive on usage of JdbcTemplate
    • JdbcTemplate is the central class in the JDBC core package. It handles the creation and release of resources, which helps you avoid common errors, such as forgetting to close the connection. It performs the basic tasks of the core JDBC workflow (such as statement creation and execution), leaving application code to provide SQL and extract results.

    • You can use JdbcTemplate within a DAO implementation through direct instantiation with a DataSource reference, or you can configure it in a Spring IoC container and give it to DAOs as a bean reference.

    • We need to follow the below steps in order to configure JdbcTemplate inside a Spring Web application (Without Spring Boot)

    Step 1 : First we need to create a Data Source Bean inside Web application with the DB credentials like mentioned below.
    @Bean
    public DataSource myDataSource() {
    DriverManagerDataSource dataSource = new DriverManagerDataSource();
    dataSource.setDriverClassName("com.mysql.jdbc.Driver");
    dataSource.setUrl("jdbc:mysql://localhost:3306/eazyschool");
    dataSource.setUsername("user");
    dataSource.setPassword("password");
    return dataSource;
    }

    Step 2 : Inside any Repository/DAO classes where we want to execute queries, we need to create a bean/object of JdbcTemplate by injecting data source bean
    @Repository
    public class PersonDAOImpl implements PersonDAO {
    
    JdbcTemplate jdbcTemplate;

    @Autowired
    public PersonDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
        }
    }

    • Instances of the JdbcTemplate class are thread-safe, once configured. This is important because if needed we can configure a single instance of a JdbcTemplate and then safely inject this shared reference into multiple DAOs (or repositories).

132. Saving Contact Message into DB using JdbcTemplate Insert operation

133. Display Contact messages from DB using JdbcTemplate select operation - Part 1

134: Display Contact messages from DB using JdbcTemplate select operation - Part 2    
    • RowMapper interface allows to map a row of the relations with the instance of user-defined class. It iterates the ResultSet internally and adds it into the collection. So we don’t need to write a lot of code to fetch the records as ResultSetExtractor.

    • RowMapper saves a lot of code because it internally adds the data of ResultSet into the collection.

    • It defines only one method mapRow that accepts ResultSet instance and int as parameters. Below is the sample usage of it,

    private final RowMapper<Person> personRowMapper = (resultSet, rowNum) -> {
    Person person = new Person();
    person.setFirstName(resultSet.getString("first_name"));
    person.setLastName(resultSet.getString("last_name"));
    return person;
    };

    public List<Person> findAllPersons() {
    return this.jdbcTemplate.query("select first_name, last_name from person", personRowMapper);
    }

135: Update Contact messages status using JdbcTemplate update operation

136: Implementing AOP inside Eazy School Web Application

137: Display list of Holidays from H2 Database using JdbcTemplate

    Do you know, with Spring Boot working with JdbcTemplate is very easy. Spring Boot auto configures DataSource, JdbcTemplate and NamedParameterJdbcTemplate classes based on the DB connection details mentioned in the property file and you can @Autowired them directly into your own repository classes, as shown in the following example.

    You can customize some properties of the template by using the spring.jdbc.template.* properties, like mentioned below,
                                                        spring.jdbc.template.max-rows=500

    @Repository
    public class HolidaysRepository {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public HolidaysRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
        }
    }

########################################### SECTION 16: SETUP MYSQL DB IN AWS & MIGRATING FROM H2 DB ############################################

138: Setup MYSQL DB inside AWS - Part 1

139: Setup MYSQL DB inside AWS - Part 2

140: Migrate from H2 Database to MYSQL Database

141: Demo of MYSQL Database changes inside Eazy School Web App

########################################### SECTION 17: INTRODUCTION TO SPRING DATA & SPRING JPA ############################################

142: Problems with Spring JDBC & how ORM frameworks solve these problems
    ORM  => OBJECT-RELATIONAL MAPPING
    
    JPA => JAVA PERSISTENCE API
    
143: Introduction to Spring Data143. Introduction to Spring Data
    Spring Data is a Spring ecosystem project that simplifies the persistence layer’s development by providing implementations according to the persistence technology we use. This way, we only need to write a few lines of code to define the repositories of our Spring app.

    Spring Application Logic

    Spring Data

    JPA/Hibernate
    JDBC
    MongoDB
    Cassandra
    Any other persistence technology

    Spring Data is a high-level layer that simplifies the persistence implementation by unifying the various technologies under the same abstractions.

144: Deepdive on Repository,CrudRepository,PagingAndSortingRepository,JpaRepository
    • Whichever persistence technology your app uses, Spring Data provides a common set of interfaces (contracts) you extend to define the app’s persistence capabilities.
    • The central interface in the Spring Data repository abstraction is Repository

    🔵 Repository is the most abstract contract. If you extend this contract, your app recognizes the interface you write as a particular Spring Data repository. Still, you won’t inherit any predefined operations (such as adding a new record, retrieving all the records, or getting a record by its primary key). The Repository interface doesn’t declare any method (it is a marker interface).

    🟡 CrudRepository is the simplest Spring Data contract that also provides some persistence capabilities. If you extend this contract to define your app’s persistence capabilities, you get the simplest operations for creating, retrieving, updating, and deleting records. ListCrudRepository is an extension to CrudRepository returning List instead of Iterable wherever applicable.

    🟢 PagingAndSortingRepository provides methods to retrieve entities using the pagination and sorting abstraction. ListPagingAndSortingRepository is an extension to PagingAndSortingRepository returning List instead of Iterable wherever applicable.

    To implement your app’s repositories using Spring Data, you extend specific interfaces. The main interfaces that represent Spring Data contracts are Repository, CrudRepository, ListCrudRepository, PagingAndSortingRepository and ListPagingAndSortingRepository. You extend one of these contracts to implement your app’s persistence capabilities.

    🔵 Repository
    <<Interface>>

    🟡 CrudRepository
    <<Interface>>

    🟡 ListCrudRepository
    <<Interface>>

    🟢 PagingAndSortingRepository
    <<Interface>>

    🟢 ListPagingAndSortingRepository
    <<Interface>>

    Do you know,

    ✓ We should not confuse between @Repository annotation and Spring Data Repository interface.

    ✓ Spring Data provides multiple interfaces that extend one another by following the principle called interface segregation. This helps apps to extend what they want instead of always following fat implementation.

    ✓ Some Spring Data modules might provide specific contracts to the technology they represent. For example, using Spring Data JPA, you also can extend the JpaRepository interface directly and similarly using Spring Data Mongo module to your app provides a particular contract named MongoRepository.

145: Introduction to Spring Data JPA
    Spring Data JPA is available to Spring Boot applications with the JPA starter. This starter dependency not only brings in Spring Data JPA, but also transitively includes Hibernate as the JPA implementation.

    Below is the maven dependency that we need to add to any SpringBoot projects in order to use Spring Data JPA,
    <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>

    We need to follow the below steps in order to query a DB using Spring Data JPA inside a Spring Boot application,

    Step 1: We need to indicate a Java POJO class as an entity class by using annotations like @Entity, @Table, @Column
    @Entity
    @Table(name = "contact_msg")
    public class Contact extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name = "native", strategy = "native")
    @Column(name = "contact_id")
    private int contactId;
    }

    💬 Side Note:
    JPA is just a specification that defines an object-relational mapping (ORM) standard for storing, accessing, and managing Java objects in relational databases. Hibernate is the most popular and widely used implementation of JPA specifications. By default, Spring Data JPA uses Hibernate as a JPA provider.

    Step 2: We need to create interfaces for a given table entity by extending framework provided Repository interfaces. This helps us to run the basic CRUD operations on the table w/o writing method implementations.
    @Repository
    public interface ContactRepository extends CrudRepository<Contact, Integer> {

    }

    Step 3: Enable JPA functionality and scanning by using the annotations @EnableJpaRepositories and @EntityScan
    @SpringBootApplication
    @EnableJpaRepositories("com.eazybytes.eazyschool.repository")
    @EntityScan("com.eazybytes.eazyschool.model")
    public class EazyschoolApplication {
    }

146: Migrate from Spring JDBC to Spring Data JPA - Part 1

147: Migrate from Spring JDBC to Spring Data JPA - Part 2

    Step4 : We can inject repository beans into any controller/service classes and execute the required DB operations.
    @Service
    public class ContactService {

    @Autowired
    private ContactRepository contactRepository;

    public boolean saveMessageDetails(Contact contact){
        boolean isSaved = false;
        Contact savedContact = contactRepository.save(contact);
        if(null != savedContact && savedContact.getContactId() > 0) {
            isSaved = true;
        }
        return isSaved;
        }
    }

148:  Migrate from Spring JDBC to Spring Data JPA - Part 3
    With Spring Data JPA, we can use the method names to derive a query and fetch the results w/o writing code manually like with traditional JDBC.

    As a developer we just need to define the query methods in a repository interface that extends one of the Spring Data’s repositories such as CrudRepository. Spring Data JPA will create queries and implementation at runtime automatically by parsing these method names.

    Below are few examples,
    // find persons by last name
    List<Person> findByLastName(String lastName);

    // find person by email
    Person findByEmail(String email);

    // find person by email and last name
    Person findByEmailAndLastname(String email, String lastname);

149:  Migrate from Spring JDBC to Spring Data JPA - Part 4

150: Deep dive on derived query methods inside Spring Data JPA
    Do you know a derived query method name has two main components separated by the first By keyword.

    The introducer clause like find, read, query, count, or get which tells Spring Data JPA what you want to do with the method. This clause can contain further expressions, such as Distinct to set a distinct flag on the query to be created.

    The criteria clause that starts after the first By keyword. The first By acts as a delimiter to indicate the start of the actual query criteria. The criteria clause is where you define conditions on entity properties and concatenate them with And and Or keywords.

 #################################### SECTION 18: AUDITING SUPPORT BY SPRING DATA JPA INSIDE WEB APPLICATION #####################################
   
151: Introduction of Auditing Support by Spring Data JPA
    Spring Data provides sophisticated support to transparently keep track of who created or changed an entity and when the change happened. To benefit from that functionality, you have to equip your entity classes with auditing metadata that can be defined either using annotations or by implementing an interface.

    Additionally, auditing has to be enabled either through Annotation configuration or XML configuration to register the required infrastructure components.

    Below are the steps that needs to be followed,
    Step 1: We need to use the annotations to indicate the audit related columns inside DB tables. Spring Data JPA ships with an entity listener that can be used to trigger the capturing of auditing information. We must register the AuditingEntityListener to be used for all the required entities.
    @Data
    @MappedSuperclass
    @EntityListeners(AuditingEntityListener.class)
    public class BaseEntity {

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdAt;

    @CreatedBy
    @Column(updatable = false)
    private String createdBy;

    @LastModifiedDate
    @Column(insertable = false)
    private LocalDateTime updatedAt;

    @LastModifiedBy
    @Column(insertable = false)
    private String updatedBy;
    }
    @CreatedDate, @CreatedBy, @LastModifiedDate, @LastModifiedBy
    are the key annotations that support JPA auditing.

    Step 2: Date related info will be fetched from the server by JPA but for CreatedBy & UpdatedBy we need to let JPA know how to fetch that info by implementing AuditorAware interface like shown below.
    @Component("auditAwareImpl")
    public class AuditAwareImpl implements AuditorAware<String> {

    @Override
    public Optional<String> getCurrentAuditor() {
        return Optional.ofNullable(SecurityContextHolder.getContext()
                .getAuthentication().getName());
        }
    }

    Step 3: Enable JPA auditing by annotating a configuration class with the @EnableJpaAuditing annotation.
    @SpringBootApplication
    @EnableJpaRepositories("com.eazybytes.eazyschool.repository")
    @EntityScan("com.eazybytes.eazyschool.model")
    @EnableJpaAuditing(auditorAwareRef = "auditAwareImpl")
    public class EazyschoolApplication {
    }

    Do you know we can print the queries that are being formed and executed by Spring Data JPA by enabling the below properties,
    spring.jpa.show-sql=true
    spring.jpa.properties.hibernate.format_sql=true

    show-sql property will print the query on the console/logs whereas format_sql property will print the queries in a readable friendly style.
    But please make sure to leverage them in non-prod environments only as they impact the performance of the web application.

152: Implement automatic auditing support with Spring Data JPA - Part 1

153: Implement automatic auditing support with Spring Data JPA - Part 2

 ########################################## SECTION 19: BUILDING CUSTOM VALIDATIONS INSIDE SPRING MVC ############################################

154: Building new user registration web page inside Eazy School Web App

155: Building Custom validations for new user registration page - Part 1
    Important Validation Annotations

    jakarta.validation.constraints.*
    ✓ @Digits
    ✓ @Email
    ✓ @Max
    ✓ @Min
    ✓ @NotBlank
    ✓ @NotEmpty
    ✓ @NotNull
    ✓ @Pattern
    ✓ @Size

    org.hibernate.validator.constraints.*
    ✓ @CreditCardNumber
    ✓ @Length
    ✓ @Currency
    ✓ @Range
    ✓ @URL
    ✓ @UniqueElements
    ✓ @EAN
    ✓ @ISBN

    Sample validations declaration inside a Java POJO class.
    @Data
    public class Contact {

    @NotBlank(message = "Email must not be blank")
    @Email(message = "Please provide a valid email address")
    private String email;

    @NotBlank(message = "Subject must not be blank")
    @Size(min = 5, message = "Subject must be at least 5 characters long")
    private String subject;

    @NotBlank(message = "Message must not be blank")
    @Size(min = 10, message = "Message must be at least 10 characters long")
    private String message;
    }

    We can put the @Valid annotation on method parameters to tell Spring framework that we want a particular POJO object needs to be validated based on the validation annotation configurations. For any issues, framework populates the error details inside the Errors object. The errors can be used to display on the UI to the user. Sample example code is below,

    @RequestMapping(value = "/saveMsg", method = POST)
    public String saveMessage(@Valid @ModelAttribute("contact") Contact contact, Errors errors) {

    if (errors.hasErrors()) {
        log.error("Contact form validation failed due to: " + errors.toString());
        return "contact.html";
    }

    contactService.saveMessageDetails(contact);
    return "redirect:/contact";
    }

    <ul>
    <li class="alert alert-danger" role="alert" th:each="error : ${#fields.errors('contact.*')}"
        th:text="${error}" />
    </ul>

    We have seen before using Bean validations like Max, Min, Size etc. we can do validations on the input received. Now let’s try to define custom validations that are specific to our business requirements. For the same we need to follow the below steps,

    Step 1: Suppose if we have a requirement to not allow some weak passwords inside our user registration form, we first need to create a custom annotation like below. Here we need to provide the class name where the actual validation logic present.
    @Documented
    @Constraint(validatedBy = PasswordStrengthValidator.class)
    @Target({ ElementType.METHOD, ElementType.FIELD })
    @Retention(RetentionPolicy.RUNTIME)
    public @interface PasswordValidator {
        String message() default "Please choose a strong password";
        Class<?>[] groups() default {};
        Class<? extends Payload>[] payload() default {};
    }

    Step 2: We need to create a class that implements ConstraintValidator interface and overriding the isValid() method like shown below.
    public class PasswordStrengthValidator implements 
        ConstraintValidator<PasswordValidator, String> {

    List<String> weakPasswords;

    @Override
    public void initialize(PasswordValidator passwordValidator) {
        weakPasswords = Arrays.asList("12345", "password", "qwerty");
    }

    @Override
    public boolean isValid(String passwordField, 
                           ConstraintValidatorContext cxt) {
        return passwordField != null && (!weakPasswords.contains(passwordField));
        }
    }

    Step 3: Finally we can mention the annotation that we created on top of the field inside a POJO class.
    @NotBlank(message = "Password must not be blank")
    @Size(min = 5, message = "Password must be at least 5 characters long")
    @PasswordValidator
    private String pwd;

156: Building Custom validations for new user registration page - Part 2

157: Building Custom validations for new user registration page - Part 3

158: Building Custom validations for new user registration page - Part 4
    We have seen before using Bean validations like Max, Min, Size etc. we can do validations on the input received. Now let’s try to define custom validations that are specific to our business requirements. For the same we need to follow the below steps,

    Step 1: Suppose if we have a requirement to not allow some weak passwords inside our user registration form, we first need to create a custom annotation like below. Here we need to provide the class name where the actual validation logic present.
    @Documented
    @Constraint(validatedBy = PasswordStrengthValidator.class)
    @Target({ ElementType.METHOD, ElementType.FIELD })
    @Retention(RetentionPolicy.RUNTIME)
    public @interface PasswordValidator {
        String message() default "Please choose a strong password";
        Class<?>[] groups() default {};
        Class<? extends Payload>[] payload() default {};
    }

    



















