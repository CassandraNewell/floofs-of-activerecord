# Floof Walks

We want to create an app to help us keep track of **which floof-walker is walking which floof on which day**. Our floofs don't get along whatsoever, so **floof-walkers only walk one floof at a time** (imagine trying to walk one of AmyLynn's cochroaches at the same time as one of Casi's cats!).

## Part 1
Create the migrations to build a schema and the models to represent the following data and object relationships:

#### Floofs

* A floof must have a name
* A floof can have many walks
* A floof should be able to bark (have a bark method in the model that returns "bark")

#### Walkers

* Must have a name
* A walker can have many walks

#### Walks

* Must have a day
* Must belong to one floof
* Must belong to one walker

## Part 2
Seed your development database with a Seeds file! Open up your app and poke around and make sure it works as you expect

## Part 3
Modify the backend to use our database for the show, index, and new pages already set up in `/app/views`
