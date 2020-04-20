# Bank Tech Test

Practice for Tech Tests (OO Design and TDD)

## Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date       || credit  || debit  || balance
14/01/2012 ||         || 500.00 || 2500.00
13/01/2012 || 2000.00 ||        || 3000.00
10/01/2012 || 1000.00 ||        || 1000.00
```


## Getting started

How to install it (what to clone, what to run to get all dependencies)

## Usage

How to run it (is it a command line tool? Do you have to load it into IRB? Is is a web application? What port needs to be used?)


## Running tests

How to run the tests

## Domain Model

I am going to start working in a single class 'Account' that will take the main functionality.
When the project starts getting more complex I will start refactoring to follow single responsability.
The final Domain Model should look something similar to the one below, where the classes on the left side delegate on the right side ones.


| BANK            | ACCOUNT      | TRANSACTION    | STATEMENT       |
| :-------------- |:-------------|:---------------|:----------------|
|                 | @balance = 0 | @date          |                 |
|                 | @trans = []  | @credit        |                 |
|                 |              | @debit         |                 |
|                 |              | @balance       |                 |
| --------------- |--------------|----------------|-----------------|
| #deposit()      | #deposit()   | #deposit()     | #generate_stat  |
| #withdrawal()   | #withdrawal()| #withdrawal()  |                 |
| #print_stat     |              |                |                 |
