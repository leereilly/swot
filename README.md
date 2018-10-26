[![official JetBrains project](http://jb.gg/badges/official.svg)](https://confluence.jetbrains.com/display/ALL/JetBrains+on+GitHub)
# swot

JetBrains uses this **swot** repository to grant free licenses for JetBrains tools to students and teachers worldwide. If your email is in one of the domains listed in this repository, you may request your free license from JetBrains. Visit http://jetbrains.com/student to request!

There is `lib/domains` directory which contains a hierarchically structured list of email domains belonging to various educational institutions. The domains are mostly owned by colleges and universities, and also by groups of schools united together because they are sharing the same email domain between several institutions, such as Township High School District 211 of Cook County, Illinois.

If you know a school, college or university which is not on this list, feel free to submit a pull request to add it.

## Which educational institutions can be added to the repository?

Your pull request for adding a new email domain to the repository will be satisfied if all of the conditions below are met:

1. The domain is used by an educational institution, which offers at least one long-term course (one year or longer), and the course is somehow related to IT (it is in computer science, software engineering, statistics, bioinformatics, etc.)

2. The educational institution is a physical entity with student attendance and recognized as providing a learning curriculum for the educational system, or the institution is an accredited online educational organization providing their students with: (1) online courses with a curriculum at least one year long, (2) a dedicated email address which is provided to students only until their graduation.

**NOTE:** If an organization provides primary or secondary education only (i.e., no high or higher education programs), it will not be included in the list. Primary and secondary school students do not usually need access to professional developer tools, and if they learn some programming, we are glad to offer them Community versions of the tools, such as PyCharm Community Edition, to use which are free to everybody.

If you represent a primary or secondary school and you are certain of the necessity of a professional version of a JetBrains tool for your school, please contact JetBrains sales team via https://www.jetbrains.com/support/sales/

## How to add a domain to this repository

To add a domain, make a pull request. You must be familiar with git tool or GitHub user interface in order to make a pull request.
We will review your request, and if we accept that it meets all the following conditions then we will merge it:

1. Each domain is represented by a single `.txt` file in the repository. If there is a file `lib/domains/edu/mit.txt`, it means that an email domain `mit.edu` is included in the repository. Please note that the repository reverses the order of the name components, and also note that **.txt extension is mandatory**. Example: add file `/lib/domains/ng/edu/unaab.txt` to add a domain `unaab.edu.ng` to the repository.

2. Pull requests can include one or more files which you wish to add.

3. Each file in the repository has to contain the name of the university, which the domain represented by the file belongs to. For example, a file `/lib/domains/ng/edu/unaab.txt` has to contain a line in it: *"Federal University of Agriculture, Abeokuta"*.
The first line of the file has to contain the official name of the educational organization.
Other lines can contain other names the university is known by. A university in a non-English speaking country can have a line containing the university name in their native language, and another line with the name in English.

4. If the domain is shared by several institutions, such a school district domain, please add the last line starting with a dot (`.`) followed by the word "group". Example:
`.group`

#### How to add the domain quicker
> We merge pull requests manually and check the information which you have provided us with before merging it.
> Thus, if you wish to make the verification process easier for us and therefore much quicker, please mention the following in your comment to the request:
> * the university official website URL, if it is different from the domain you are submitting
> * a URL of a page on the official website where a long-term (>1 year) IT related course is offered by the university
> * a URL of a page or some other proof (.pdf or a screenshot are OK) showing that the university recognizes the domain which you are submitting as an official email domain for the enrolled students.

## How to change a domain in this repository
If a university changes its email domain or name, you can submit a pull request with the necessary changes.

## Additional references
Please refer to the `CONTRIBUTING.md` file in this repository to read more about the repository structure and contributing rules.

## FAQ
#### There are many domains in my university, how can I add all of them?
If all the domains used for teachers' and students' email are in the same upper-level domain, you can add the upper-level domain. For example, if there is a domain `joedoe.org` owned by a university, and there are subdomains such as `stud.joedoe.org` and `prof.joedoe.org`, used by the students and the teachers respectively, you can add `joedoe.org` domain only, and both students and teachers will be able to request their free licenses.

However, if the upper-level domain is also used by alumni, research staff, and other people who do not participate in education directly, we encourage you to add separate subdomains, if it is possible.

If the university uses several email domains in different upper-level domains (for example, `euroacademia.ee` and `euroacademia.eu`), please submit several files with different paths and the same content (i.e., same name of the university) in your pull request.

#### Some universities have their names duplicated in the first and the second line in the respective .txt file in this repository. Shall I put the university name twice in my .txt file to have the domain added?
No, it's not needed. However, nothing bad happens if you do it, don't worry. It does not affect our decision on your request. 
