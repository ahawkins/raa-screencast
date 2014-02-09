# Notes

The point of this screencast is give the viewer a complete overview of
what it's like to build an application using my techniques. The
choosen application must be complicated enough to illustrate the core
concepts & provide headroom for other demonstrations.

The screencast will cover creating an invoicing application. I've
choosen this application because most viewers will be familiar with
the concepts and business objects. It's complex enough to demonstrate
associations with the repository and show off other common use cases.

The screencast should show off everything in the JoD series plus other
stuff from radium & saltside. The posts cover:

* delivery mechanisms with sinatra
* json serialization
* middleware
* logicless views
* mounting and composing applications
* error handling
* writing form objects
* creating use cases
* using the repository
* writing validators
* constructing test suites

So I need to cover all that stuff at least plus more.

## Use Cases

The application will implement the following interactions:

* signup for the system
  * create a user account
  * send a confirmation email
  * click the confirmation email to confirm the account
  * possible oauth integration?
* send an invoice
  * can demonstrate composiblity with signup for account & create
    invoice
  * can demonstrate a more complex form (create invoice + customer)
  * how to handle complex nested data with forms like line items
  * send an email -- more on the email boundary
* record a payment - logicless view
  * client gets a link to a payment screen
  * implement some sort of payment service/boundary
  * send an email to the user letting them know the payment's been
    made
* get invoices w/some sort of query parameters
* get clients w/some sort of query parmeters

## Implementation Stages

1. Create and implement all the use cases
2. Implement the delivery mechanism
3. Implement real services
5. Refactor to use chassis
