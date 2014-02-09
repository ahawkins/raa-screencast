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
