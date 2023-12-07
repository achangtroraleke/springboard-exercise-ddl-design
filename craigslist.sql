-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    preferred_region INTEGER REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    user INTEGER REFERENCES users ON DELETE CASCADE,
    location TEXT NOT NULL,
    region INTEGER REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
);

CREATE TABLE post_categorie_rel
(
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE CASCADE

);
