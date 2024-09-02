# Copyright (c) 2024 StudSpace
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

FROM maven:3.9.9-eclipse-temurin-21-alpine

ARG DB_URL=localhost:5432
ARG DB_USERNAME=user
ARG DB_PASSWORD=root

WORKDIR /app

COPY pom.xml ./pom.xml
COPY src ./src
EXPOSE 8080

RUN mvn verify --fail-never

ENV DB_URL=${DB_URL}
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}

CMD [ "mvn", "--batch-mode", "spring-boot:run", "-Dspring-boot.run.profiles=dev" ]
