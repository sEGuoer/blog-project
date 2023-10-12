## Spring和Spring-webmvc结合

详情从commit：Hello spring-webmvc(f40837da)看起
![img.png](img.png)
如图我们已经有对应的配置文件。然后我们来探究一下究竟是如何实现的。
![img_1.png](img_1.png)

### SPI
![img_2.png](img_2.png)
由于SPI的存在，在运行springmvc启动时，我们会看到该类会去处理WebApplicationInitializer.class

### WebApplicationInitializer.class
我们发现我们的类继承自AbstractAnnotationConfigDispatcherServletInitializer

往顶层一直点去就会发现，实际上我们的类是WebApplicationInitializer的实现类

### 重写的method
#### 1. getRootConfigClasses

![img_3.png](img_3.png)
#### 2. getServletConfigClasses

![img_4.png](img_4.png)
#### 3. getServletMappings

![img_5.png](img_5.png)
由于SPI的存在，在运行springmvc启动时，我们会看到该类会去处理WebApplicationInitializer.class

