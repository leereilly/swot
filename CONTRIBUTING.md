# Contributing to Swot

#### Data Contributions

* All of the school data is stored in a simple filesystem data structure under `lib/domains`.
* The directories are nested to match domain parts, starting with the [TLD](http://en.wikipedia.org/wiki/Top-level_domain) (Top Level Domain), then [SLDs](http://en.wikipedia.org/wiki/Second-level_domain) (Second Level Domains) beneath them, etc.
* There's a text file named after the school's domain, nested below the appropriate directory, e.g. `strath.ac.uk` would be listed as `lib/domains/uk/ac/strath.txt`.
* The contents of that file are simply the school name, e.g. `University of Strathclyde`.
* The [working example for University of Strathclyde](https://github.com/leereilly/swot/blob/master/lib/domains/uk/ac/strath.txt) :eyes:
* Here's what the data structure looks like:

```
[-] lib
    [-] domains
        [-] edu
            [+] harvard
            [+] stanford
        [-] uk
            [-] ac
                [+] strath
```

##### Adding a School

Let's say you want to add the [Stanford University](http://www.stanford.edu/). We'd simply create a file at `lib/domains/edu/stanford.txt` containing the text `Stanford University`. You can safely ignores subdomain like `www`, `cis`, whatever. You can see the actual file [here](https://github.com/leereilly/swot/blob/master/lib/domains/edu/stanford.txt).

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
