# graphql-java-spring-boot-example
This is a fork of the tutorial on how build a GraphQL Server article from pluralsight. The changes made to this example are:
- Build with Gradle instead of maven
- Put this in a docker container for easier deployment
- Modification of mutators to support java optional data type for Java 8


# Original Text

Sample app for my tutorial [Building a GraphQL Server with Spring Boot](https://www.pluralsight.com/guides/java-and-j2ee/building-a-graphql-server-with-spring-boot). 

Clone this repo and execute the following commands from the project root:
- docker build --tag=bookgraphql .
- docker run -p 8080:8080 bookgraphql

You can go to [http://localhost:8080/h2-console/login.jsp](http://localhost:8080/h2-console/login.jsp) and enter the following information:
- JDBC URL: jdbc:h2:mem:testdb
- User Name: sa
- Password: <blank>

To check the database or to [http://localhost:8080/graphiql](http://localhost:8080/graphiql) to start executing queries. For example:
```
{
  findAllBooks {
    id
    isbn
    title
    pageCount
    author {
      firstName
      lastName
    }
  }
}
```

Or:
```
mutation {
  newBook(
    title: "Java: The Complete Reference, Tenth Edition", 
    isbn: "1259589331", 
    author: 1) {
      id title
  }
}
```

# TODO
- Add additional tests
- Resolve Illegal reflective access operation for reflectasm library in Spring boot integration test
- Generate docker file from gradle

# License
MIT
