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
  * Now that tests pass there is something unsetteling about that
    code. It's obviously sub optimal because it's very boiler plate.
    There will come a time when we have pain maintaining these things.
    Right now it's fine. There is a prying thought in the back of our
    mind: we should be using a libary for this. In fact you've
    probably already picked on out and are itching to refactor this
    code. But check yourself. It's not important right now. What would
    adding a library do? Remove a few lines of code? We have bigger
    fish to fry. We can come back to this when we've reached
    **unbearable** pain. So what's next? We should turn our attention
    back to the failing use case tests. Now that we have the form we
    can instantiate it and call the use case.
  * So now we've reached the point where we need functionality. The
    test case is calling `run!` but the method is undefined. What goes
    on in this method? Well all the things to be honest. Right now
    we're only focused on sending email. This is the point where we
    need to start looking at gems. It doesn't make sense for us to
    implement our own email delivery thing. We need something that
    allows different behavior per environment. Natrually we don't want
    to send emails in the test environment, only assert that an email
    has crossed over the boundary. We could implement this all
    ourselves, but I think that would require writing a bunch of
    classes that would undoubtably be replced with a library. I don't
    like to introduce gems so early in an application's development
    but it seems this is best option. The `mail` gem is perfect for
    us. So let's get to it by writing some failing tests. For now we
    only need to test that generated email has been delivered. Let's
    punt on `run!` and figure out what kind of assertions we need.
    this keeps the test failing while working on making assertions
    pass. For now I think it's safe enough for us to test that the
    email contains all the information about the invoice.
  * Now we can implement a bit of functionality to get the next
    failing assertion. We work towards failing assertions and nothing
    else. It's enough to punt on the `run!` method again to get to
    this point. Let's stub it to return a new mail object to get to
    the failing assertion.
  * Time to get down and dirty writing some code. There are four
    failing assertions in front of us. They are related to the email's
    content. There is nothing complicated to do here. All we need to
    do is assign the right things on the email. There is some tests to
    rewrite here because we didn't understand the mail interface here.
    That's no problem since we have the tests to guide us. It's easy
    to get past these assertions and make it to the delivery one.
  * Now for the last hurrah of this test. All we need to do is
    deliver the email. Just use mail's interface for that and we're
    off to the races.
  * Oh crap! we have two problems. First off, this test is trying to
    to use SMTP. We definitely don't want that at all! We need to
    configure mail to use its test mailer. Secondly the exception says
    we haven't sent a from address. It's right! How did we forget
    that? We probably need to do add something to the form to handle
    this, but let's punt on that for now to keep working inside this
    test. Let's just stub the `from` address to be from our
    application's domain. Add a failing assertion above the final one
    to as a regression test. This ensures we never get this bug again.
    Once we do that we can move onto configuring the delivery system.
  * Configuring mail is easy. We jsut need to drop a snippet in
    `test_helper.rb`. Now the test passes, but for some reason the
    tests have slowed down **significantly.**
  * Wow! Now we've completed our first red-green cycle. Now it's time
    to refactor the code a bit. There's not so much to do, but there
    are a few things to take care. First off the use case test has a
    problem. We haven't done anything to clean up the state from the
    test. We haven't cleared out any possible deliveries. This is an
    easy fix. We simply need to call `clear` in `setup` or `teardown`.
    Next there there is something we can do in the form test. Every
    test declares a new form instance. We can move that up into a
    `setup` block and use an `attr_reader` instead.

