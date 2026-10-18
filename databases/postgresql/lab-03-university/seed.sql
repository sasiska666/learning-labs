INSERT INTO students (full_name, grp) VALUES
    ('Student A', 'GRP-1'), ('Student B', 'GRP-1'), ('Student C', 'GRP-2');

INSERT INTO courses (title, credits) VALUES
    ('Course Alpha', 5), ('Course Beta', 3);

INSERT INTO enrollments (student_id, course_id, grade) VALUES
    (1, 1, 85), (1, 2, 70),
    (2, 1, 92),
    (3, 2, NULL);
