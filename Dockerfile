FROM 3.9.4-amazoncorretto-17

WORKDIR /frontend
COPY . .
RUN mvn clean install

CMD mvn spring-boot:run

