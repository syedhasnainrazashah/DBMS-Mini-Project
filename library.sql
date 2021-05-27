CREATE DATABASE ‘library’;

CREATE TABLE `admin` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(30) NOT NULL,
  `name` TEXT NOT NULL,
  `password` TEXT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `book` (
  `book_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(300) NOT NULL,
  `author` VARCHAR(300) NOT NULL,
  `availability` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`book_id`)
);

CREATE TABLE `issue_book` (
  `issue_id` INT(11) NOT NULL AUTO_INCREMENT,
  `book_id` INT(11) NOT NULL,
  `stud_id` INT(11) NOT NULL,
  `issue_date` VARCHAR(30) NOT NULL,
  `return_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`issue_id`)
);

CREATE TABLE `student` (
  `stud_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(300) NOT NULL,
  `phone_number` VARCHAR(30) NOT NULL,
  `address` TEXT NOT NULL,
  PRIMARY KEY (`stud_id`)
);


SELECT book_id,NAME,author FROM book
WHERE availability='YES'


SELECT book_id, NAME
FROM book
WHERE book_id NOT IN (SELECT book_id FROM issue_book);


SELECT stud_id,NAME
FROM student
WHERE stud_id NOT IN (SELECT stud_id FROM issue_book);

SELECT issue_book.issue_id,issue_book.book_id, student.name,issue_book.issue_date,issue_book.return_date
FROM issue_book
JOIN student ON issue_book.stud_id=student.stud_id;


SELECT issue_book.issue_id,issue_book.stud_id, book.name,issue_book.issue_date,issue_book.return_date 
FROM issue_book 
JOIN book ON issue_book.book_id=book.book_id;


