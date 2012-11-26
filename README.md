#  Glassfish clickstart

This clickstart sets up a build service, repository and a basic glass fish app with continuous deployment.
All built by maven. 

<imc src="https://d3ko533tu1ozfq.cloudfront.net/clickstart/glassfish_icon.png"/>

<a href="https://grandcentral.cloudbees.com/?CB_clickstart=https://raw.github.com/CloudBees-community/glassfish-clickstart/master/clickstart.json"><img src="https://d3ko533tu1ozfq.cloudfront.net/clickstart/deployInstantly.png"/></a>

Launch this clickstart and glory could be yours too ! Use it as a building block if you like.
You can launch this on Cloudbees via a clickstart automatically, or follow the instructions below. 

This is based on the glassfish stack that you can read more about <a href="https://github.com/CloudBees-community/glassfish3-clickstack">here.</a>


# Deploying manually: 


## To build and deploy this on CloudBees, follow those steps:

Create application:

    bees app:create MYAPP_ID -t glassfish3


Create a new Maven project in Jenkins, changing the following:

* Add this git repository (or yours, with this code) on Jenkins
* Also check "Deploy to CloudBees" with those parameters:

        Applications: First Match
        Application Id: MYAPP_ID
        Filename Pattern: target/*.war

