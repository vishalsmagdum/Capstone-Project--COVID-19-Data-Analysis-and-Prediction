## Vishal Subhash Magdum- Capstone Project- MySQL Queries ##


-- Q1. Find the number of corona patients who faced shortness of breath.

SELECT COUNT(ID) as No_of_patients_with_shortness_of_breathe
FROM covid_modified
WHERE Test_result = 'positive' AND 
Shortness_of_breath = 'True';
# We have 1,164 'Covid Positive' patients who faced 'Shortness of breath'.


-- Q2. Find the number of negative corona patients who have fever and sore_throat. 

SELECT COUNT(ID) as No_of_patients_with_fever_sore_throat
FROM covid_modified
WHERE Test_result = 'negative' AND 
Fever = 'True' AND Sore_throat= 'True';
# There are 142 'Covid Negative' participants who experienced 'Fever' and 'Sore Throat'.


-- Q3. Group the data by month and rank the number of positive cases.

SELECT MID(Test_date, 4, 2) AS Test_Month, COUNT(ID) AS Total_positive_cases
FROM covid_modified
WHERE Test_result = 'positive'
GROUP BY Test_Month
ORDER BY COUNT(ID) DESC;
# There are a greater number of 'Covid Positive' cases found in month of 'April' i.e., 8,881
# compared to month of 'March' where there are 5,848 positive cases.


-- Q4. Find the female negative corona patients who faced cough and headache.

SELECT COUNT(ID) AS No_of_females_with_cough_headache
FROM covid_modified
WHERE Sex = 'female' AND 
Test_result = 'negative' AND
Cough_symptoms = 'True' AND 
Headache= 'True';
# There are 69 'Female Covid Negative patients' who experienced 'Cough' and 'Headache'.


-- Q5. How many elderly corona patients have faced breathing problems?

SELECT COUNT(ID) AS No_of_senior_citizen_with_breating_issues
FROM covid_modified
WHERE Age_60_above = 'Yes' AND 
Test_result = 'positive' AND
Shortness_of_breath = 'True';
# There are 263 'Elderly Covid Patients (60 years and older) who faced 'Breathing Problem'.


-- Q6. Which three symptoms were more common among COVID positive patients?

# Method 1 :-
SELECT
  COUNT(CASE WHEN Headache = 'True' THEN 1 END) AS Headache,
  COUNT(CASE WHEN Shortness_of_breath = 'True' THEN 1 END) AS Shortness_of_breath,
  COUNT(CASE WHEN Sore_throat = 'True' THEN 1 END) AS Sore_throat,
  COUNT(CASE WHEN Fever = 'True' THEN 1 END) AS Fever,
  COUNT(CASE WHEN Cough_symptoms = 'True' THEN 1 END) AS Cough_symptoms
FROM covid_modified
WHERE Test_result = 'positive';

# Method 2 :-
SELECT 'Headache' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Headache = 'True'
UNION ALL
SELECT 'Shortness_of_breath' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Shortness_of_breath = 'True'
UNION ALL
SELECT 'Sore_throat' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Sore_throat = 'True'
UNION ALL
SELECT 'Fever' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Fever = 'True'
UNION ALL
SELECT 'Cough_symptoms' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Cough_symptoms = 'True'
Order BY count desc;
# LIMIT 3;
# After comparing values, Top 3 symptoms which are common in 'Covid Positive Patients' are- 1. Cough(6,584), 2. Fever(5,559), 3. Headache(2,235).


-- Q7. Which symptom was less common among COVID negative people?

SELECT 'Headache' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'negative' AND Headache = 'True'
UNION ALL
SELECT 'Shortness_of_breath' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'negative' AND Shortness_of_breath = 'True'
UNION ALL
SELECT 'Sore_throat' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'negative' AND Sore_throat = 'True'
UNION ALL
SELECT 'Fever' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'negative' AND Fever = 'True'
UNION ALL
SELECT 'Cough_symptoms' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'negative' AND Cough_symptoms = 'True'
Order BY count;
# 'Least common' symptom among 'Covid Negative' participants is = Headache (179 participants)


-- Q8. What are the most common symptoms among COVID positive males whose known contact was abroad? 


SELECT 'Headache' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Headache = 'True' AND Sex = 'male' and Known_contact = 'Abroad'
UNION ALL
SELECT 'Shortness_of_breath' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Shortness_of_breath = 'True' AND Sex = 'male' and Known_contact = 'Abroad'
UNION ALL
SELECT 'Sore_throat' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Sore_throat = 'True' AND Sex = 'male' and Known_contact = 'Abroad'
UNION ALL
SELECT 'Fever' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Fever = 'True' AND Sex = 'male' and Known_contact = 'Abroad'
UNION ALL
SELECT 'Cough_symptoms' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Cough_symptoms = 'True' AND Sex = 'male' and Known_contact = 'Abroad'
Order BY count desc;
# 'Most common' symptoms among 'Covid Negative Males' whose known contact was 'Abroad' are = 1. Cough(532), 2. Fever(407), 3. Headache(129).