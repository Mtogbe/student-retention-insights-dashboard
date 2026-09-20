--This file builds the analysis table that will be used for the Tableau dashboard.
--one row per enrollment with early engagement (days 0-28),
-- final outcome, and an at-risk label (Fail/Withdrawn = At Risk).
-- Excludes pre-start withdrawals (unregistered before day 0) as engagement artifacts.
CREATE TABLE retention_analysis AS SELECT si.code_module, si.code_presentation, si.id_student, COALESCE(SUM(svle.sum_click), 0) AS total_engagement, sr.date_unregistration, si.final_result,
CASE -- Collapse the four outcomes into a binary at-risk flag for the dashboard
    WHEN si.final_result = 'Withdrawn' THEN 'At Risk'
    WHEN si.final_result = 'Fail' THEN 'At Risk'
    ELSE 'Not At Risk'
END AS risk_status
FROM oulad.studentInfo si
LEFT JOIN oulad.studentVle svle
    ON si.code_module = svle.code_module 
    AND si.code_presentation = svle.code_presentation
    AND si.id_student = svle.id_student
    AND date >= 0 and date <= 28 --added this condition to the ON clause because WHERE gets rid of the NULL values which I want to keep
LEFT JOIN oulad.studentRegistration sr 
    ON si.id_student = sr.id_student
    AND si.code_module = sr.code_module
    AND si.code_presentation = sr.code_presentation
WHERE sr.date_unregistration IS NULL OR sr.date_unregistration >= 0 -- Keep students who never withdrew (NULL) or withdrew on/after day 0
GROUP BY si.code_module, si.code_presentation, si.id_student, si.final_result

COPY oulad.retention_analysis TO 'destination/path' (HEADER, DELIMITER ','); --copies analysis table and sends csv to defined file path