CREATE TABLE authorities
(
    username VARCHAR(50) NOT NULL,
    authority VARCHAR(50) NOT NULL
);

CREATE TABLE persistent_logins
(
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) PRIMARY KEY NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL
);

CREATE TABLE users
(
    username VARCHAR(50) PRIMARY KEY NOT NULL,
    password VARCHAR(70) NOT NULL,
    enabled BOOL NOT NULL
);

ALTER TABLE authorities ADD FOREIGN KEY (username) REFERENCES users (username);
CREATE UNIQUE INDEX ix_auth_username ON authorities (username, authority);