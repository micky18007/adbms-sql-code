Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:

psql (17.5)
WARNING: Console code page (850) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

postgres=# create table Authors( author_id INT Primary Key, name VARCHAR(50), country VARCHAR(50));
CREATE TABLE
postgres=# create table Books(book_id INT Primary Key, title VARCHAR(100), author_id INT, Foreign key (author_id) references Authors(author_id));
CREATE TABLE
postgres=#
postgres=# insert into Authors(author_id, name, country) values (1, 'George Orwell', 'UK'), (2, 'Haruki Murakami', 'Japan'), (3, 'Jane Austen', 'UK');
INSERT 0 3
postgres=#
postgres=# insert into Books(book_id, title, author_id) Values(101, '1984', 1), (102, 'Animal Farm', 1), (103, 'Norwegian Wood', 2), (104, 'Pride and Prejudice', 3), (105, 'Emma', 3);
INSERT 0 5
postgres=#
postgres=# select B.title AS Book_Title, A.name AS Author_Name, A.country AS Author_Country FROM Books B INNER JOIN Authors A ON B.author_id = A.author_id;
ERROR:  column b.author_idÿ does not exist
LINE 1: ...thor_Country FROM Books B INNER JOIN Authors A ON B.author_i...
                                                             ^
HINT:  Perhaps you meant to reference the column "b.author_id".
postgres=# select b.title AS Book_Title, A.name AS Author_Name, A.country AS author_Country FROM Books B INNER JOIN Aothors A ON b.author_id = A.author_id;
ERROR:  relation "aothors" does not exist
LINE 1: ...country AS author_Country FROM Books B INNER JOIN Aothors A ...
                                                             ^
postgres=# select b.title As Book_Title, A.name AS Author_Nmae, A.country As author_Country FROM Book B INNER JOIN Authors A ON b.author_id = A.author_id;
ERROR:  relation "book" does not exist
LINE 1: ... AS Author_Nmae, A.country As author_Country FROM Book B INN...
                                                             ^
postgres=# select B.title AS Book_Title, A.name AS Author_Name, A.country AS Author_Country FROM Books B INNER JOIN Authors A ON b.author_id = A.author_id;
ERROR:  column b.author_idÿ does not exist
LINE 1: ...thor_Country FROM Books B INNER JOIN Authors A ON b.author_i...
                                                             ^
HINT:  Perhaps you meant to reference the column "b.author_id".
postgres=# yes