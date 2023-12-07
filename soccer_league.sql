-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

CREATE TABLE leagues
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    start_data DATE,
    end_date DATE
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    league INTEGER REFERENCES leagues ON DELETE CASCADE,
    wins INTEGER DEFAULT 0,
    losses INTEGER DEFAULT 0
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team INTEGER REFERENCES teams ON DELETE CASCADE,
    
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home INTEGER REFERENCES teams ON DELETE CASCADE,
    away INTEGER REFERENCES teams ON DELETE CASCADE,
    
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    match INTEGER REFERENCES matches ON DELETE CASCADE,
    player INTEGER REFERENCES players ON DELETE CASCADE,

);

