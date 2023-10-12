package com.seguoer.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan(basePackages = {"com.seguoer.service","com.seguoer.dao"})
@Import({AppConfig.class})
public class MyRootConfig {
}
