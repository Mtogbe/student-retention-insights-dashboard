--query for final_result (pass,withdrawn,distinction,fail) class distribution. 
SELECT final_result, COUNT(*) AS total_count FROM oulad.studentInfo GROUP BY final_result

--query for how many students unregistered from their course before the session (code_presentation) began
SELECT COUNT(*) AS unregistered_before_start FROM oulad.studentRegistration WHERE date_unregistration < 0 

--query for how many students unregistered from their course on or after the session (code_presentation) began
SELECT COUNT(*) AS unregistered_before_start FROM oulad.studentRegistration WHERE date_unregistration >= 0 

--query for looking at the end date of student engagement in studentVLE
SELECT MAX(studentVle.date) AS end_date FROM oulad.studentVle 
--query for looking at the start date of student engagement in studentVLE
SELECT MIN(studentVle.date) AS start_date FROM oulad.studentVle 
--query for looking at the max number of clicks (sum_click) or engagement in studentVLE
SELECT MAX(sum_click) AS max_clicks FROM oulad.studentVle 
--query for looking at the min number of clicks (sum_click) or engagement in studentVLE. 
SELECT MIN(sum_click) AS min_clicks FROM oulad.studentVle 
--query to check the frequency of each number of clicks (sum_click) across all the days in studentVLE. click value 1 appears 5.1M times 
SELECT sum_click, COUNT(sum_click) AS click_frequency FROM oulad.studentVle GROUP BY sum_click ORDER BY sum_click ASC, click_frequency DESC