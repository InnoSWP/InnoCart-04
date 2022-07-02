# InnoCart project

[![License](https://img.shields.io/github/license/InnoSWP/InnoCart?color=violet&logoColor=red&style=for-the-badge)](https://github.com/InnoSWP/InnoCart-04/blob/master/LICENSE)

An application that connects Innopolis residents (customers) with people moving around Kazan (Angels). Customer can order some products (medics, food, ..) from Kazan and Angels would deliver it heading their way to Innopolis. 

Customers save time and money for the road & Angels make money while they are doing their own business.

## Implemented features
#### Common
* Log in/Log out
* Sign up as a customer/angel
#### As user
* Add an order
* View the order details
* Choose an angel
* View delivery status
#### As Angel
* Send a request
* View the order details
* View delivery status
* Confirm the order

##Figma design


## How to run?
First, clone the repository and go to the backend directory:
```bash
$ git clone git@github.com:ruca905/InnoCart.git
$ cd InnoCart/backend
```
Create venv environment and activate it:
```bash
$ python3 -m venv venv
$ source venv/bin/activate
```
Install all necessary dependencies and migrate the data base:
```bash
$ pip3 install -r requirements.txt
$ python3 manage.py migrate
```
Finally, you can run a server:
```bash
$ python3 manage.py runserver
```

## Technolohy stack
* Django
* Django Rest Framework
* Flutter
* Dart

## Pipeline stack
* GitHub Actions
* Linter
* SonarCloud

## Useful links
* [Wiki](https://github.com/InnoSWP/InnoCart-04/wiki)
* [REST API](https://app.swaggerhub.com/apis/Innopolis-University1/InnoCart/1.0.0-oas3)
* [Backlog](https://github.com/orgs/InnoSWP/projects/17)
* [Figma design](https://www.figma.com/file/uNcYX3G4SNXs85SRhC1si3/InnoCart-UI?node-id=0%3A1)



