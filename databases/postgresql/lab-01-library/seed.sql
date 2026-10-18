INSERT INTO authors (full_name) VALUES
    ('Author One'), ('Author Two'), ('Author Three');

INSERT INTO books (title, author_id, year, copies) VALUES
    ('Sample Book A', 1, 2001, 2),
    ('Sample Book B', 1, 2010, 1),
    ('Sample Book C', 2, 1999, 3),
    ('Sample Book D', 3, 2020, 1);

INSERT INTO members (full_name, joined_on) VALUES
    ('Member A', '2025-01-10'),
    ('Member B', '2025-03-05');

INSERT INTO loans (book_id, member_id, loaned_on, returned_on) VALUES
    (1, 1, '2025-04-01', '2025-04-15'),
    (2, 1, '2025-05-02', NULL),
    (3, 2, '2025-05-10', '2025-05-20'),
    (1, 2, '2025-06-01', NULL);
