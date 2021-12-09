CREATE TABLE articles 
  (
  id SERIAL,
  user_id SERIAL,
  title VARCHAR(30) NOT NULL,
  content VARCHAR(300) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  PRIMARY KEY(id)
  );

CREATE TABLE comments 
  (
  id SERIAL,
  user_id SERIAL NOT NULL,
  article_id SERIAL NOT NULL,
  content VARCHAR(300) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  PRIMARY KEY(id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (article_id) REFERENCES articles (id)
  );

CREATE TABLE users 
 (
  id SERIAL,
  username VARCHAR(30) NOT NULL,
  password VARCHAR(30) NOT NULL,
  email VARCHAR(30) NOT NULL,
  PRIMARY KEY(id)
  );

INSERT INTO users (username, password, email)
Values('Test','Testtest','Test@test.test');

INSERT INTO users (username, password, email)
Values('Test1','Testtest1','Test1@test.test');

INSERT INTO users (username, password, email)
Values('Test2','Testtest2','Test2@test.test');

INSERT INTO articles (user_id, title, content)
Values(1,'Testtest3','TestTestTestTestTest');

INSERT INTO articles (user_id, title, content)
Values(1,'Testtest4','TestTestTestTestTest');

INSERT INTO articles (user_id, title, content)
Values(2,'Testtest5','TestTestTestTestTest');

INSERT INTO articles (user_id, title, content)
Values(3,'Testtest6','TestTestTestTestTest');

INSERT INTO comments (user_id, article_id, content)
VALUES (2, 1, 'Test!');

INSERT INTO comments (user_id, article_id, content)
VALUES (1, 2, 'Test?');

INSERT INTO comments (user_id, article_id, content)
VALUES (1, 1, 'Test...');

UPDATE articles
SET content = 'Not Test!!!' WHERE content = 'TestTestTestTestTest';

UPDATE users
SET email = 'NotTest123@gmail.com' WHERE id = 2;

UPDATE comments
SET content = 'Looks like test' WHERE user_id = 2;

ALTER TABLE articles
ADD updated_at TIMESTAMP NOT NULL 
DEFAULT NOW();

SELECT * FROM users;
SELECT * FROM articles;
SELECT * FROM comments;

SELECT COUNT(*) AS First_count FROM articles
WHERE user_id = 1;

SELECT email, comments.content, articles.content, title  FROM comments
LEFT JOIN users
ON comments.user_id = users.id
LEFT JOIN articles
ON users.id = articles.user_id;













