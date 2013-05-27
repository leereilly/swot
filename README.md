# Swot :apple:

Swot allows you to identify whether a particular email address or domain name is associated with an academic institution providing higher education in tertiary, quaternary or post-secondary education in any country in the world.

**Why would you want to do that?** A growing number of companies offer discounts on their products/services to those in academia. It's not a hard problem to solve in America or the UK (you can just whitelist `.edu` and `.ac.uk` domains), but what about the other countries out there?

**Pop quiz:** How many of the following email addresses are associated with a university? Answers at the bottom.

`joe@stanford.edu`, `tom@cs.strath.ac.uk`, `lee@wunizar.es`, `bob@ubishops.ca`, `ally@usask.ca`, `hans@hil.no`, `mila@unze.ba`

### Usage

#### Verify Email Addresses

```ruby
Swot::is_academic? 'lreilly@stanford.edu'           # true
Swot::is_academic? 'lreilly@strath.ac.uk'           # true
Swot::is_academic? 'lreilly@soft-eng.strath.ac.uk'  # true
Swot::is_academic? 'pedro@ugr.es'                   # true
Swot::is_academic? 'lee@uottawa.ca'                 # true
Swot::is_academic? 'lee@leerilly.net'               # false
```

#### Verify Domain Names

```ruby
Swot::is_academic?('harvard.edu')               # true
Swot::is_academic?('www.harvard.edu')           # true
Swot::is_academic?('http://www.harvard.edu')    # true
Swot::is_academic?('http://www.github.com')     # false
Swot::is_academic?('http://www.rangers.co.uk')  # false
```

#### Find School Names

```ruby
Swot::scool_name 'lreilly@cs.strath.ac.uk'
# => "University of Strathclyde"

Swot::scool_name 'lreilly@stanford.edu'
# => "Stanford University"
```

### What is a swot?

[UrbanDictionary will fill you in](http://www.urbandictionary.com/define.php?term=swot) ಠ_ಠ

### Contributing to Swot

#### Data Contributions

* All of the school data is stored in a simple filesystem data structure under `lib/domains`.
* Every directory name in here is a [TLD](http://en.wikipedia.org/wiki/Top-level_domain) (Top Level Domain) e.g. `edu`.
* Every file in these directories is named after the school's [SLD](http://en.wikipedia.org/wiki/Second-level_domain) (Second Level Domain) e.g `stanford`.
* The contents of that file are simply the school name e.g. `Stanford University`.
* The [working example for Stanford University](https://github.com/leereilly/swot/blob/master/lib/domains/edu/stanford) :eyes:
* Here's what the data structure looks like:

```
[-] lib
    [-] domains
        [-] ac.uk
            [+] strath
        [-] edu
            [+] harvard
            [+] stanford

```

##### Adding a School

Let's say you want to add the [University of Strathclyde](http://www.strath.ac.uk/). We know the TLD is `ac.uk` and the SLD is `strath`. We'd simply create a file at `lib/domains/ac.uk/strath` containing the text `University of Strathcylde`. You can safely ignores subdomain like `www`, `cis`, whatever. You can see the actual file [here](https://github.com/leereilly/swot/blob/master/lib/domains/ac.uk/strath).

#### Updating a School Name

Change the file contents of the appropriate file.

#### Deleting a School Name

A simple `git rm` on the approriate file will do the trick.

#### Code Contributions

This was literally my first Ruby gem, so please keep that in mind when you're looking at the code :trollface:

* Check out the latest [master](https://github.com/leereilly/swot/tree/master).
* Take a look through the [open pull requests](https://github.com/leereilly/swot/issues) in case someone else has already contributed something similar.
* Fork the project.
* Start a topic branch of your own.
* Commit and push away. Don't forget the tests!
* Submit a pull request.
* :boom: You've contributed to open source!

```
     ____________________________________________________
    |.==================================================,|
    ||  I WILL MERGE AND REVIEW PULL REQUESTS QUICKLY   ||
    ||  I WILL MERGE AND REVIEW PULL REQUESTS QUICKLY   ||
    ||  I WILL MERGE AND REVIEW PULL REQUESTS QUICKLY   ||
    ||  I .----.ERG,                                    ||
    ||   / ><   \  /                                    ||
    ||  |        |/\                                    ||
    ||   \______//\/                                    ||
    ||   _(____)/ /                                     ||
    ||__/ ,_ _  _/______________________________________||
    '===\___\_) |========================================'
         |______|
         |  ||  |
         |__||__|
         (__)(__)
```

### Copyright

Copyright (c) 2012 Lee Reilly. See LICENSE.txt for further details.

### Pop Quiz Answers

All of 'em.

### Known Issues / Bugs / "Features"

* You can search by email and domain names only. You cannot search by IP.
* You don't know if the email address belongs to a student, faculty, staff member, etc.
* There may be a few false positives, missing institutions... maybe even a couple of typos. Contributons welcome!

![](http://i.imgur.com/K8vsw.gif)
