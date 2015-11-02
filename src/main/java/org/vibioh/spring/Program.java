package org.vibioh.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import java.io.InputStream;
import java.io.OutputStream;

@SpringBootApplication
@Configuration
@ComponentScan(value = "org.vibioh.spring.impl")
public class Program implements CommandLineRunner {
  @Autowired
  private Process inverse;

  @Override
  public void run(final String... strings) throws Exception {
    inverse.execute();
  }

  @Bean
  public InputStream getInput() {
    return System.in;
  }

  @Bean
  public OutputStream getOuput() {
    return System.out;
  }

  public static void main(final String[] args) {
    SpringApplication.run(Program.class, args);
  }
}
