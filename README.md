Swot allows you to identify whether a particular email address or domain
is associated with an academic institution providing higher education in
tertiary, quaternary or post-secondary education in any country in the
world.

# Why would you want to do that?

Student discounts baby. A growing number of companies offer discounts on their products/services to those in academia. It's not a hard problem to solve in America or the UK, but other countries don't have domain name restrictions.

## Pop quiz

How many of the following email addresses are associated with a university? Answers at the bottom.

nigel@stanford.edu, bawbag@cs.strath.ac.uk, lee@wunizar.es, terrence@ubishops.ca, philip@usask.ca, hans@hil.no, mila@unze.ba

# Usage

## Verify Email Addresses
```ruby
    Swot::is_academic?('lreilly@stanford.edu')           # true
    Swot::is_academic?('lreilly@slac.stanford.edu')      # true
    Swot::is_academic?('lreilly@strath.ac.uk')           # true
    Swot::is_academic?('lreilly@soft-eng.strath.ac.uk')  # true
    Swot::is_academic?('lee@ugr.es')                     # true
    Swot::is_academic?('lee@uottawa.ca')                 # true
    Swot::is_academic?('lee@leerilly.net')              # false
    Swot::is_academic?('lee@gmail.com')                 # false
    Swot::is_academic?('lee@stanford.edu.com')          # false
    Swot::is_academic?('lee@strath.ac.uk.com')          # false
```
## Verify Domain Names
```ruby
    Swot::is_academic?('harvard.edu')                    # true
    Swot::is_academic?('www.harvard.edu')                # true
    Swot::is_academic?('http://www.harvard.edu')         # true
    Swot::is_academic?('http://www.kink.com')            # false
    Swot::is_academic?('http://www.rangers.co.uk')       # false
```
# What is a swot?

[UrbanDictionary will fill you in](http://www.urbandictionary.com/define.php?term=swot) ಠ_ಠ

# Contributing to Swot

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Known Issues /

* You can search by email and domain names only. You cannot search by IP.
* Can't handle port numbers yet.
* You don't know if the email address is a student, faculty, staff, etc.

![](http://i.imgur.com/K8vsw.gif)

# Copyright

Copyright (c) 2012 Lee Reilly. See LICENSE.txt for
further details.

# Pop Quiz Answers

All of 'em.
