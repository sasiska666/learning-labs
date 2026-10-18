DROP TABLE IF EXISTS loans, books, authors, members CASCADE;

CREATE TABLE authors (
    author_id   SERIAL PRIMARY KEY,
    full_name   TEXT NOT NULL UNIQUE
);

CREATE TABLE books (
    book_id     SERIAL PRIMARY KEY,
    title       TEXT NOT NULL,
    author_id   INTEGER NOT NULL REFERENCES authors(author_id),
    year        INTEGER CHECK (year BETWEEN 1400 AND 2100),
    copies      INTEGER NOT NULL DEFAULT 1 CHECK (copies >= 0)
);

CREATE TABLE members (
    member_id   SERIAL PRIMARY KEY,
    full_name   TEXT NOT NULL,
    joined_on   DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE loans (
    loan_id     SERIAL PRIMARY KEY,
    book_id     INTEGER NOT NULL REFERENCES books(book_id),
    member_id   INTEGER NOT NULL REFERENCES members(member_id),
    loaned_on   DATE NOT NULL,
    returned_on DATE,
    CHECK (returned_on IS NULL OR returned_on >= loaned_on)
);

CREATE INDEX idx_loans_member ON loans(member_id);
CREATE INDEX idx_books_author ON books(author_id);
