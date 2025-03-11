# -------Stage 1 ---------
FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests=true

# --------Stage 2 --------
FROM openjdk:17-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar /app/expenseapp.jar

EXPOSE 8080

CMD ["java", "-jar", "expenseapp.jar"]
