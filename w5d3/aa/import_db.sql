

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies; 
DROP TABLE IF EXISTS questions_follows; 
DROP TABLE IF EXISTS questions; 
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL, 
  lname VARCHAR(255) NOT NULL
);

INSERT INTO 
  users (fname, lname)
VALUES ('bob', 'bob');

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  author INTEGER NOT NULL,
  FOREIGN KEY (author) REFERENCES users(id)
);

INSERT INTO questions (title, body, author)
VALUES ('my question', 'this is a good answer', 1);

CREATE TABLE questions_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO questions_follows (user_id, question_id)
VALUES (1, 1);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body VARCHAR(255),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN Key (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)

);

INSERT INTO replies (question_id, parent_id, user_id, body)
VALUES (1, null, 1, 'another answer');

CREATE TABLE question_likes (
  user_id INTEGER NOT NULL, 
  question_id INTEGER NOT NULL, 
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO question_likes (user_id, question_id)
VALUES (1, 1);




