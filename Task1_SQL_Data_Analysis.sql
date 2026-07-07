-- Student Management Database
-- SQL Data Analysis Internship - Task 1
-- PostgreSQL
-- Created by: Miraj Vaghela

-- STEP 1: Create Table

CREATE TABLE Students (
StudentID SERIAL PRIMARY KEY,
StudentName VARCHAR(100) NOT NULL,
Gender CHAR(1) CHECK (Gender IN('M', 'F')),
Age INT CHECK (Age BETWEEN 15 AND 30),
Grade VARCHAR(2) NOT NULL,
MathScore INT CHECK (MathScore BETWEEN 0 AND 100),
ScienceScore INT CHECK (ScienceScore BETWEEN 0 AND 100),
EnglishScore INT CHECK (EnglishScore BETWEEN 0 AND 100)
);

-- STEP 2: Insert Data

INSERT INTO Students (StudentName, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
('Aarav Patel','M',18,'A',95,91,89),
('Diya Shah','F',17,'A',88,92,94),
('Vivaan Mehta','M',19,'B',76,81,79),
('Ananya Joshi','F',18,'A',91,87,93),
('Krish Desai','M',17,'C',64,71,68),
('Riya Patel','F',18,'B',83,85,88),
('Aditya Singh','M',19,'B',79,82,75),
('Meera Nair','F',18,'A',96,95,98),
('Rahul Verma','M',20,'C',58,63,61),
('Sneha Kapoor','F',19,'B',84,80,86),
('Yash Patel','M',18,'A',90,89,87),
('Kavya Sharma','F',17,'A',93,94,91),
('Arjun Rao','M',18,'B',72,74,70),
('Ishita Gupta','F',19,'A',89,90,92),
('Vaghela Miraj','M',18,'A',92,94,90);

-- Query 1: Display All Student Records

SELECT * FROM Students;

-- Query 2: Average Score in Each Subject

SELECT 
ROUND(AVG(MathScore), 2) AS Avg_MathScore,
ROUND(AVG(ScienceScore), 2) AS Avg_ScienceScore,
ROUND(AVG(EnglishScore), 2) AS Avg_EnglishScore
FROM Students;

-- Query 3: Top Performer (Highest Total Score)

SELECT StudentName,
       (MathScore + ScienceScore + EnglishScore) AS Total_Score
FROM Students
ORDER BY Total_Score DESC
LIMIT 1;

-- Query 4: Count Students Per Grade

SELECT Grade, 
       COUNT(*) AS Total_Students
FROM Students 
GROUP BY Grade;

-- Query 5: Average Score by Gender

SELECT Gender,  
       ROUND(AVG((MathScore + ScienceScore + EnglishScore)/3.0), 2) AS Avg_Score
FROM Students
GROUP BY Gender 
ORDER BY Avg_Score DESC;

-- Query 6: Students with Math Score Greater Than 80

SELECT StudentName, MathScore 
FROM Students 
WHERE MathScore > 80
ORDER BY MathScore DESC;

-- Query 7: Update a Student's Grade

UPDATE Students
SET Grade = 'A'
WHERE StudentName = 'Rahul Verma';

--- Verify

SELECT StudentName, Grade
FROM Students
WHERE StudentName = 'Rahul Verma';

-- Query 8: Highest Math score

SELECT StudentName, MathScore
FROM Students 
WHERE MathScore = ( SELECT MAX(MathScore) 
FROM Students );

-- Query 9: Lowest total score

SELECT StudentName, 
       (MathScore + ScienceScore + EnglishScore) AS Total_Score
FROM Students
ORDER BY Total_Score ASC
LIMIT 1;

-- Query 10: Students above the average Math score

SELECT StudentName, MathScore
FROM Students
WHERE MathScore > (SELECT AVG(MathScore)
    FROM Students);

-- Query 11: Average age by grade

SELECT Grade, ROUND(AVG(Age), 2) AS Avg_Age
FROM Students 
GROUP BY Grade
ORDER BY Grade ASC;

-- Query 12: Total score and percentage for each student

SELECT StudentName, 
       (MathScore + ScienceScore + EnglishScore) AS Total_Score,
       ROUND(((MathScore + ScienceScore + EnglishScore) / 300.0) * 100, 2) AS Percentage
FROM Students
ORDER BY Total_Score DESC;

-- Query 13: Total Number of Students

SELECT COUNT(*) AS Total_Students
FROM Students;
