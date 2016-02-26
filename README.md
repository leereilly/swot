# swot

JetBrains uses this **swot** repository to grant free licenses for JetBrains tools to students and teachers worldwide. If your email is in one of the domains listed in this repository, you are entitled to request your free license from JetBrains. Visit http://jetbrains.com/student to request!

There is `lib/domains` directory which contains hierarcicaly structured list of email domains belonged to various educational institutions. The domains are mostly owned by colleges and universities, and also by groups of schools united together because they are sharing the same email domains between several institutions, such as Township High School District 211 of Cook County, Illinois.

If you know a school, college or university which is not in this list, feel free to submit a pull request to add it.

## Which educational institutions can be added to the repository?

Your pull request for adding a new email domain to the repository will be satisfied if all of the conditions below are met:
1. The domain is used by an educational institution, which offers at least one long-term course (one year or longer), and the course is somehow related to IT (it is in computer science, software engineering, statistics, bioinformatics, etc.)
2. The educational institution has a physically existing location, where students attend classes in classrooms, not over the Internet. In general, we do not include online universities to this repository. 

**NOTE:** If an organization provides primary and secondary education only (i.e., no high or higher education programs), it shall not be included into the list. Primary and secondary school students usually do not need professional developer tools, and in case they learn some programming, we are glad to offer them Community versions of the tools, which are free to everybody, such as PyCharm Community Edition, etc.

## How to add a domain to this repository

To add a domain, make a pull request. You must be familiar with git tool or GitHub user interface in order to make a pull request.
We review your request and merge it (i.e., accept it) if it meets the following rules:

1. Each domain is represented by a single `.txt` file in the repository. If there is a file `lib/domains/edu/mit.txt`, it means that e-mail domain `mit.edu` is included into the repository. Please note that the repository uses reverse order of the name components, and also note that **.txt extension is mandatory**.

Example: add file `/lib/domains/ng/edu/unaab.txt` to add a domain `unaab.edu.ng` to the repository.

2. Pull request can include one or more files which you wish to add.

3. Each file in the repository has to contain a name of the university, which the domain represented by the file belongs to. For example, a file `/lib/domains/ng/edu/unaab.txt` has to contain a line in it: *"Federal University of Agriculture, Abeokuta"*.
First line of the file has to contain an official name of the educational organization.
Other lines can contain other known names of the university. A university in a non-English speaking country can have a line containing the university name in their native language, and another line with the name in English.

4. If the domain is shared among several institutions, such a school district domain, please add the last line starting with dot (`.`) followed by a word "group". Example:
`.group`

## How to change a domain to this repository

If a university changes its email domain or name, you can submit a pull request with necessary changes.

## FAQ
#### There are many domains in my university, how can I add all of them?
If all the domains used for teachers' and students' email are in the same upper-level domain, you can add the upper-level domain. For example, if there is a domain `joedoe.org` owned by a university, and there are subdomains such as `stud.joedoe.org` and `prof.joedoe.org`, you can add joedoe.org domain, and both students and teachers will be able to request their free licenses.

However, if the upper-level domain is also used by alumni, research staff, and other people who do not participate in education directly, we encourage you to add separate subdomains, if it is possible.

#### Some universities have their names duplicated in the first and the second line in respective .txt file. Shall I put the university name twice in my .txt file to have the domain added?
No. We have no idea why they put two identical lines into .txt file, it does not make any sense in this repository. However, nothing bad happens if you do it, don't worry. It does not affect our decision on your request. 
