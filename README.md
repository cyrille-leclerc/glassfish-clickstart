#  GlassFish clickstart

This clickstart sets up a build service, repository and a basic GlassFish app with continuous deployment.
All built by maven. 

<imc src="https://d3ko533tu1ozfq.cloudfront.net/clickstart/glassfish_icon.png"/>

<a href="https://grandcentral.cloudbees.com/?CB_clickstart=https://raw.github.com/CloudBees-community/glassfish-clickstart/master/clickstart.json"><img src="https://d3ko533tu1ozfq.cloudfront.net/clickstart/deployInstantly.png"/></a>

Launch this clickstart and glory could be yours too ! Use it as a building block if you like.
You can launch this on Cloudbees via a clickstart automatically, or follow the instructions below. 

This is based on the GlassFish stack that you can read more about <a href="https://github.com/CloudBees-community/glassfish3-clickstack">here.</a>


# Deploying manually: 

## Include mysql-connector jar in `${war_home}/META-INF/lib`

Maven sample:

```xml

<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-dependency-plugin</artifactId>
    <version>2.7</version>
    <executions>
        <execution>
            <id>copy</id>
            <phase>prepare-package</phase>
            <goals>
                <goal>copy</goal>
            </goals>
            <configuration>
                <artifactItems>
                    <artifactItem>
                        <groupId>mysql</groupId>
                        <artifactId>mysql-connector-java</artifactId>
                        <version>5.1.24</version>
                        <type>jar</type>
                    </artifactItem>
                </artifactItems>
                <outputDirectory>${project.build.directory}/appserver-dependency</outputDirectory>
            </configuration>
        </execution>
    </executions>
</plugin>
```

## Create a Glassfish3 container

```
bees app:deploy -a my-glassfish3-app -t glassfish3 path/to/my/app.war
```


## Create a MySQL Database

```
bees db:create my-glassfish3-db
```

## Bind the MySQL Database to the Glassfish container

```
bees app:bind -a my-glassfish3-app -db my-glassfish3-db -as mydb
```

Supported JNDI names:

 * `jdbc/mydb` : unqualified relative JNDI name is **OK**
 * `java:comp/env/jdbc/mydb`: qualified private name is **OK**
 * <del><code>java:jdbc/mydb</code></del> and <del><code>java:/jdbc/mydb</code></del>: qualified relative names are **KO**
 * <del><code>java:global/env/jdbc/mydb</code></del>: qualified global name is **KO**

Samples:

```java
Context ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup("jdbc/mydb");
DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mydb");
```

## Restart Glassfish

```
bees app:restart -a my-glassfish3-app
```

## Jenkins Job

Create a new Maven project in Jenkins, changing the following:

* Add this git repository (or yours, with this code) on Jenkins
* Also check "Deploy to CloudBees" with those parameters:

        Applications: First Match
        Application Id: MYAPP_ID
        Filename Pattern: target/*.war

where `MYAPP_ID`is the name of your application.


