# Pup Walks

We want to create an app to help us keep track of **which floof-walker is walking which floof on which day**. Our floofs don't get along whatsoever, and walking a floof is hard work, so **floof-walkers only walk one floof on any given day** (imagine trying to walk one of AmyLynn's cochroaches at the same time as one of Casi's cats!).

## Part 1
  * For Part 1 we are going to focus on building our database and our models.

  Create the migrations to build a schema, and models to represent the following data and object relationships:

    ```
    #### Pups

    * A pup must have a unique name
    * A pup can have many walks

    #### Walkers

    * Must have a unique name

    #### Walks

    * Must have a day
    * Must belong to one pup
    * Must belong to one walker
```

## Part 2
* Seed your development database with a Seeds file!  open up your app and poke around and make sure it works as you expect

## Part 3
  * Modify the backend to use our database for the show, index, and new pages already set up in `/app/views`
