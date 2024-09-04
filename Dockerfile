# Copyright (c) 2024 StudSpace
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

FROM maven:3.9.9-eclipse-temurin-21-alpine AS build

WORKDIR /app
COPY pom.xml ./pom.xml
COPY src ./src

# Create jar file
RUN mvn --batch-mode clean package

FROM eclipse-temurin:21-jre-alpine AS runner

WORKDIR /app

# Copy the target jar
COPY --from=build /app/target/studspace-api-*.jar ./api.jar

ENV DB_URL=localhost:5432
ENV DB_USERNAME=user
ENV DB_PASSWORD=root
EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "./api.jar" ]
