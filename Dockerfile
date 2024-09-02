# Copyright (c) 2024 StudSpace
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

FROM maven:3.9.9-eclipse-temurin-21-alpine

WORKDIR /app

COPY pom.xml ./pom.xml
COPY src ./src
EXPOSE 8080

RUN mvn verify --fail-never

ENV DB_URL=localhost:5432
ENV DB_USERNAME=user
ENV DB_PASSWORD=root

CMD [ "mvn", "--batch-mode", "spring-boot:run", "-Dspring-boot.run.profiles=dev" ]
