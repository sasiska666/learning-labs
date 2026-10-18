-- 1. Books with their authors
SELECT b.title, a.full_name AS author, b.year
FROM books b JOIN authors a USING (author_id)
ORDER BY b.year;

-- 2. Books currently on loan (not returned)
SELECT b.title, m.full_name AS member, l.loaned_on
FROM loans l
JOIN books b   USING (book_id)
JOIN members m USING (member_id)
WHERE l.returned_on IS NULL;

-- 3. Number of books per author, including authors with zero loans
SELECT a.full_name, COUNT(b.book_id) AS books
FROM authors a LEFT JOIN books b USING (author_id)
GROUP BY a.full_name
ORDER BY books DESC, a.full_name;

-- 4. Available copies per book = copies minus active loans
SELECT b.title,
       b.copies - COUNT(l.loan_id) FILTER (WHERE l.returned_on IS NULL) AS available
FROM books b LEFT JOIN loans l USING (book_id)
GROUP BY b.book_id, b.title, b.copies
ORDER BY b.title;

-- 5. Most active member (window function)
SELECT full_name, loans_count
FROM (
    SELECT m.full_name,
           COUNT(*) AS loans_count,
           RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM loans l JOIN members m USING (member_id)
    GROUP BY m.full_name
) t
WHERE rnk = 1;
