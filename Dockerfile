FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:8
WORKDIR /app
COPY --from=build /app/target/springboot-mongo.jar /app/springboot-mongo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","springboot-mongo.jar"]
