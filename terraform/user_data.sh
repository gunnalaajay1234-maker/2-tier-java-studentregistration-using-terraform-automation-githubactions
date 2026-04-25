#!/bin/bash

# Update system
apt update -y

# Install dependencies
apt install -y openjdk-17-jdk maven git

# Create app directory
mkdir -p /home/ubuntu/employee-api
cd /home/ubuntu/employee-api

# Create project structure
mkdir -p src/main/java/com/example/employeeapi/{model,repository,controller}
mkdir -p src/main/resources/static

# Set DB ENV VARIABLES
cat <<EOF >> /etc/environment
DB_HOST=${db_host}
DB_PORT=5432
DB_NAME=${db_name}
DB_USER=${db_user}
DB_PASSWORD=${db_password}
EOF

# Load environment
export $(grep -v '^#' /etc/environment | xargs)

# Create simple Spring Boot app (minimal)
cat <<EOF > pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.example</groupId>
  <artifactId>employee-api</artifactId>
  <version>1.0</version>

  <dependencies>
    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
      <version>2.7.5</version>
    </dependency>
  </dependencies>

  <build>
    <plugins>
      <plugin>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-maven-plugin</artifactId>
        <version>2.7.5</version>
      </plugin>
    </plugins>
  </build>
</project>
EOF

# Sample App
cat <<EOF > src/main/java/com/example/employeeapi/App.java
package com.example.employeeapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class App {
    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
EOF

# Build project
mvn clean package -DskipTests

# Run app
nohup java -jar target/*.jar > app.log 2>&1 &