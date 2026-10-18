DROP TABLE IF EXISTS enrollments, courses, students CASCADE;

CREATE TABLE students (
    student_id  SERIAL PRIMARY KEY,
    full_name   TEXT NOT NULL,
    grp         TEXT NOT NULL
);

CREATE TABLE courses (
    course_id   SERIAL PRIMARY KEY,
    title       TEXT NOT NULL UNIQUE,
    credits     INTEGER NOT NULL CHECK (credits BETWEEN 1 AND 10)
);

CREATE TABLE enrollments (
    student_id  INTEGER NOT NULL REFERENCES students(student_id) ON DELETE CASCADE,
    course_id   INTEGER NOT NULL REFERENCES courses(course_id),
    grade       INTEGER CHECK (grade BETWEEN 0 AND 100),
    PRIMARY KEY (student_id, course_id)
);
