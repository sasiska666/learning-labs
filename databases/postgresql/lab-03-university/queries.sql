-- 1. Average grade per course (NULL grades are ignored by AVG)
SELECT c.title, ROUND(AVG(e.grade), 1) AS avg_grade, COUNT(e.grade) AS graded
FROM courses c LEFT JOIN enrollments e USING (course_id)
GROUP BY c.title
ORDER BY c.title;

-- 2. Student ranking inside each group by average grade
SELECT grp, full_name, avg_grade,
       RANK() OVER (PARTITION BY grp ORDER BY avg_grade DESC NULLS LAST) AS place
FROM (
    SELECT s.grp, s.full_name, AVG(e.grade) AS avg_grade
    FROM students s LEFT JOIN enrollments e USING (student_id)
    GROUP BY s.student_id, s.grp, s.full_name
) t
ORDER BY grp, place;

-- 3. Students without any grade yet
SELECT s.full_name
FROM students s
WHERE NOT EXISTS (
    SELECT 1 FROM enrollments e WHERE e.student_id = s.student_id AND e.grade IS NOT NULL
);

-- 4. Total credits earned (grade >= 50)
SELECT s.full_name, COALESCE(SUM(c.credits), 0) AS credits_earned
FROM students s
LEFT JOIN enrollments e ON e.student_id = s.student_id AND e.grade >= 50
LEFT JOIN courses c ON c.course_id = e.course_id
GROUP BY s.student_id, s.full_name
ORDER BY credits_earned DESC, s.full_name;
