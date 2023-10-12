# 如何从0创建一个自己的博客

## 一.创建新项目

在创建新项目时如果勾选该选项会出现一些不给ignore的东西（个人估计是在勾选后自动生成了一些配置来不让ignore去忽略这些东西）

自己创建的可以去.idea的.gitignore里面忽略
![img.png](img%2Fimg.png)

新建之后首先我们要构建Spring和Mybatis的联系，以后统称为SpMy。方便我们在代码中拿到数据库的内容。

## 二.SpMy结合

### (一)首先引入依赖

```xml

<dependencis>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
        <version>3.1.3</version>
    </dependency>
    <dependency>
        <groupId>com.alibaba</groupId>
        <artifactId>druid</artifactId>
        <version>1.2.15</version>
    </dependency>
    <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis-spring</artifactId>
        <version>3.0.2</version>
    </dependency>
    <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis</artifactId>
        <version>3.5.13</version>
    </dependency>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>8.0.28</version>
    </dependency>
</dependencis>
```
### （二）初始化
我们要实现融合，下面是Spring Container处理过程
![img1.png](img%2Fimg1.png)
由图我们可以知道，我们需要给Spring容器提供配置文件（左）
以及原材料（上，图中名为pojo）
![img_1.png](img%2Fimg_1.png)
如图创建以下几个包
#### 1.Config 
```java
@Configuration
@Import({DataSourceConfig.class, MybatisConfig.class})
@PropertySource({"classpath:application.properties"})
public class AppConfig {
}
```
```java
@Configuration
public class DataSourceConfig {
    @Value("${spring.datasource.driverClassname}")
    private String driver;
    @Value ("${spring.datasource.url}")
    private String url;
    @Value ("${spring.datasource.username}")
    private String username;


    @Bean
    DataSource getDataSource(){
        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setUrl(url);
        druidDataSource.setDriverClassName(driver);
        druidDataSource.setUsername(username);
        return druidDataSource;
    }
}
```
这个Config中的注释@Value中的参数
![img_2.png](img%2Fimg_2.png)
如果数据库有密码的话记得加一个密码的相关配置
```java
@Configuration
public class MybatisConfig {
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setTypeAliasesPackage("com.seguoer.po");
        return sqlSessionFactoryBean.getObject();
    }

    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setBasePackage("com.seguoer.mapper");
        return mapperScannerConfigurer;
    }
}
```
![img_3.png](img%2Fimg_3.png)
其他文件基本都是空壳，要根据自己需求的内容来填充。例如User的state要对应自己数据库中User表的column name


其中在给mapper加方法时，对应的xml也要写入对应的方法
![img_4.png](img%2Fimg_4.png)
在把自己需要的功能写好之后，就可以进行下一步了（这里验证代码是否出错可以用springtest和test）

## 三.SSM（把spring-web结合到SpMy去）
![img_6.png](img%2Fimg_6.png)
这里的RootConfig对应的就是ViewResolver的一些设置，WebConifg来控制Controllers
![img_5.png](img%2Fimg_5.png)
其中核心
```java
public class MyWebApplicationInitalizer extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{MyRootConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{MyWebConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}
```
在启动Servlet Container（我这里用的是Tomcat），就会去调用这个类。
简单来说就是由于SPI让其去调用一个类然后这个类会处理我们写的这个类，具体详见
[SS.md](SS%2FSS.md)

由此我们可以根据这个自己去搭建框架，这里就不过多赘述了。
