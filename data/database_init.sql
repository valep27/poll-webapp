# Create user and db
CREATE USER golang WITH PASSWORD 'golang';
CREATE DATABASE polldb;

# rights
GRANT ALL PRIVILEGES ON DATABASE polldb TO golang;


# table creation, these should be run as user golang

CREATE TABLE polls(
    poll_id SERIAL,
    title VARCHAR(1000) NOT NULL,

    PRIMARY KEY( poll_id )
);

CREATE UNIQUE INDEX poll_id_idx ON polls(poll_id);

CREATE TABLE answer(
    id INTEGER NOT NULL,
    poll_id INTEGER REFERENCES polls( poll_id ),
    title VARCHAR(1000) NOT NULL,
    other BOOLEAN NOT NULL,

    PRIMARY KEY( poll_id, id )
);

CREATE INDEX answer_id_idx ON answer(poll_id);

CREATE TABLE votes(
    answer_id INTEGER NOT NULL,
    poll_id INTEGER REFERENCES polls( poll_id ),
    vote_time TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX vote_id_idx ON votes(poll_id);
