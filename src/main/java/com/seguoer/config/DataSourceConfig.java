package com.seguoer.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
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

