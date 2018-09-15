-- Create a new postgres user named has_many_user
CREATE user has_many_user;

-- Create a new database named has_many_blogs owned by has_many_user
CREATE database has_many_blogs WITH owner = has_many_user;

-- Before each create table statement, add a drop table if exists statement.
-- In has_many_blogs.sql Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill the requirements of the has_many_blogs schema below.
DROP TABLE IF EXISTS users;
CREATE TABLE users 
(
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) NULL DEFAULT NULL,
  last_name VARCHAR(90) NULL DEFAULT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts 
(
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(180) NULL DEFAULT NULL,
  url VARCHAR(510) NULL DEFAULT NULL,
  content text NULL DEFAULT NUll,
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
)

DROP TABLE IF EXISTS comments;
CREATE TABLE comments
(
  id SERIAL PRIMARY KEY NOT NULL,
  body VARCHAR(510) NULL DEFAULT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP 
)

-- users Has Many Posts
ALTER TABLE posts ADD COLUMN user_id integer NOT NULL;
ALTER TABLE posts ADD FOREIGN KEY (user_id) REFERENCES users(id);

-- users Has Many comments
ALTER TABLE comments ADD COLUMN user_id integer NOT NULL;
ALTER TABLE comments ADD FOREIGN KEY (user_id) REFERENCES users(id);

-- posts Has Many comments
ALTER TABLE comments ADD COLUMN post_id integer NOT NULL;
ALTER TABLE comments ADD FOREIGN KEY (post_id) REFERENCES posts(id);







