FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend__s_t_s___b_u_s___v_1_6__36 backend__s_t_s___b_u_s___v_1_6__36
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend__s_t_s___b_u_s___v_1_6__36/target/_s_t_s___b_u_s___v_1_6_-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar _s_t_s___b_u_s___v_1_6_-0.0.1-SNAPSHOT.jar"]