--query for final_result (pass,withdrawn,distinction,fail) class distribution. 
SELECT final_result, COUNT(*) AS total_count FROM oulad.studentInfo GROUP BY final_result

--query for how many students unregistered from they're course before the session (code_presentation) began
SELECT COUNT(*) AS unregistered_before_start FROM oulad.studentRegistration WHERE date_unregistration < 0 

--query for how many students unregistered from they're course on or after the session (code_presentation) began
SELECT COUNT(*) AS unregistered_before_start FROM oulad.studentRegistration WHERE date_unregistration >= 0 