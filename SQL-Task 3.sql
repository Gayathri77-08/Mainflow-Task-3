use studentmanagement;

#creating student Table
CREATE TABLE student (
   Student_id INT PRIMARY KEY,
   Name VARCHAR(50),
   Math_score INT,
   Science_score INT,
   English_Score INT
   );
   
#Inserting Values into Students Table 
INSERT INTO Student VALUES (1, "Virat", 92, 97, 93); 
INSERT INTO Student VALUES (2, "Anushka", 83, 87 , 81);
INSERT INTO Student VALUES (3, "Arjun", 78, 71 , 79);
INSERT INTO Student VALUES (4, "Sneha", 93, 97 , 91);
INSERT INTO Student VALUES (5, "Siddharth", 86, 82 , 85);
INSERT INTO Student VALUES (6, "Kiara", 73, 77 , 71);
INSERT INTO Student VALUES (7, "Tarak", 96, 97 , 92);
INSERT INTO Student VALUES (8, "Pranitha", 88, 81 , 84);
INSERT INTO Student VALUES (9, "Ritesh", 71, 77 , 75);
INSERT INTO Student VALUES (10, "Genelia", 92, 94 , 96);

# 1)  Identify Top Students by Total Scores

SELECT student_id, name, total_score
FROM (
    SELECT student_id, name, 
           (Math_score + Science_score + English_score) AS total_score
    FROM student
) AS subquery
ORDER BY total_score DESC
LIMIT 5;


# 2)  Use subqueries to filter and group data for average calculations
#Example-1 : Calculate the average score of students who scored above 70 in Math

SELECT AVG(Math_score) AS average_Math_score
FROM student
WHERE Math_score > 70;

#Example-2 : Calculate the average total score of students grouped by a specific condition

SELECT COUNT(student_id) AS student_count, 
       AVG(total_score) AS average_total_score
FROM (
    SELECT student_id, 
           (math_score + science_score + english_score) AS total_score
    FROM student
) AS subquery
WHERE total_score BETWEEN 200 AND 250;

# 3) Find Second-Highest Math Scores

SELECT MAX(math_score) AS second_highest_math_score
FROM student
WHERE math_score < (
    SELECT MAX(math_score) FROM student
);


   