# Bank Tech Test

Practice for Tech Tests (OO Design and TDD)

## Setup

#### Getting started

- Clone or Download the Repository
- Run `bundle install` to get all the dependencies

#### Usage

- Open `IRB` in your terminal
- `load './lib/account.rb'`
- `account = Account.new`


#### Running tests

- Run `rspec` from your terminal


## Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).


### Acceptance criteria

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


## User Stories

```
I can make a Deposit in an account.
```
```
I can make a Withdrawal from an account.
```
```
I can't make a Withdrawal if the amount is bigger than the balance in the account.
```
```
I can print my bank statement and see all my transactions (date-credit-debit-balance).
```

## Domain Model & Approach

I am going to start working in a single class 'Account' that will take the main functionality.
It will evolve into a second class Transaction and then Statement.
Finally, if our app will need to manage several accounts, I will build a class Bank that manages all processes from every account.
The final Domain Model will look something similar to the one below, where the classes on the left side delegate on the right side ones.


| BANK            | ACCOUNT       | TRANSACTION    | STATEMENT       |
| :-------------- |:--------------|:---------------|:----------------|
| @account        | @balance = 0  | @deposit       |                 |
|                 | @trans_hist   | @withdrawal    |                 |
|                 | @trans        | @date          |                 |
|                 | @stat         |                |                 |
| --------------- |---------------|----------------|-----------------|
| #deposit()      | #deposit()    | #deposit()     | #generate_stat  |
| #withdrawal()   | #withdrawal() | #withdrawal()  |                 |
| #print_stat     | #generate_stat| #save_date     |                 |


## Final Product Functionality

![image](/images/irb_bank_app.png)
