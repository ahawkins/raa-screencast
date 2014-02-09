1. Create failing test case
  * Gemfile
  * Rakefile
  * Add test case

2. Writing failing acceptance test
  * Rename file
  * include rack test methods
  * Note about test naming
    - Not sure what to call it. Just use a place holder for now. The
      goal of the test is not the name, but to provide direction.
  * Test fails because app is not defined

3. Starting to make the test pass.
  * At this point, it's unclear where to actually begin. In a brand
    new repository there is no structure, there is nothing, so there
    is a lot of foundational work going on. We also started by doing
    the acceptance test first. This test goes through the delivery
    mechanism. There cannot be a delivery mechanism without the domain
    objects. So it seems that's a natural place to start. Question is:
    where do we start in that space? Do we write a failing test for
    some objects that don't exist yet? What would that test even be?
    In these situations I think it's good to look at what the core
    objects are going to be. There is always some sort of "god" object
    in an application. This is usually the user/account object because
    everything needs to be associated or go through the user in some
    way. We know this application will have users, contacts, and
    invoices. Here we are faced with a question: how do we build up
    this application? If we know that invoices will be associated with
    users do we start there or do we work by building up the invoicing
    use cases and then bolt on use accounts? I think it's best to
    start by building up the invoicing use cases first then work out
    from there. Why? Because this feels more iterative to me. There is
    less work to do in this case. If we think about what constitutes
    an invoice, it's simply a bill. It contains the amount, some
    description of the charges, and someone to deliver it to. We don't
    need contacts are uses to do that. Naturally once the system can
    send invoices, a stakeholder will want to "save" their invoices
    under an account with some sort of contact list as well. So intead
    of trying to get all of that happening form the beginning let's
    begin by building up what this appplication is all about: sending
    invoices. So I think it's safe to rename the test to soemthing
    like "sends an invoice." We can work backward from there.
  * Now that we've decided what the test should be let's look at
    what's required to make it pass. An invoice requires an amount,
    someone who should pay it, who it's from, and what it's for.
    Naturally the invoice should be delivered via email. Note there is
    nothing about databases or anything else in that description. It's
    simply enough to get off the ground. We already know that the
    general application structure. There is a delivery mechanism,
    forms, and use cases. None of these objects exist yet. So with
    that in mind, let's start by writing tests that will flesh out the
    objects required to make the tests pass.
  * It is ok to write a flunking test now. The point is not to get the
    test write from the beginning, but use the tests as a guide to
    fill in parts of the system. I perfer to use "flunk" for these
    cases beacuse I don't know what should go in them yet, but I want
    them to fail and not skip. This is like my TODO list.
    We know the use case will have at least one collaborator in the
    beginning: the form object. So the test will instantiate the form
    object assign some values, then run the use case. So if we write
    that in the test, we'll need to create tests for the form. This is
    nice because it requires us to think about what data is required
    before continuing. So let's add a reference to the form, the test
    will fail, then we can move on with tests for the form.
  * Now that we have a flunking test we need to think about what
    should go in there. Think back to what the form object it supposed
    to do. It's just is to santizie and make user input the correct
    type. So now we think of the data required. We know that we'll
    need a name, email, amount, and description. Amount is a number
    and the rest are string primitives. So the first step is to test
    that these values can be assigned and read back.
  * Time to make the tests pass. Obviously we need to declare these
    classes somewhere. I like to have one file called `app`. It
    requires all the other files. For now let's create an `app`
    directory that contains `send_invoice_form.rb`. We'll reorganize
    this directory once we have more files.
  * Now we have a passing test! There is more work to do on the form
    however. The form must coerce input as well. This means we need to
    call `to_s` or `to_f` to ensure we have the correct types to work
    with. This is important because the form is the entry point into
    the application. Once data makes it through the form it will never
    be checked again. So it's ok to do some grunt work here to make
    sure everything is ok. So it's easy to write these tests. We need
    an object that is not the type we want and responds to `to_s` or
    `to_f`. We can use symbols for the string tests and strings for
    the amount tests.
