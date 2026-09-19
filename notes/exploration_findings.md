studentInfo table:
looking at the class distribution of the final_result column, (whether enrollments passed, failed or withdrew from their module/course)
1. fail: 7052 
2. withdrawn: 10156
3. distinction: 3024 (distinction means passing with honors)
4. pass: 12361

17,208 enrollments received bad outcomes (withdrew or failed) while only 15,385 enrollments received good out comes (pass or distinction).
52.7% of enrollments ended in failure or withdrawal.

studentRegistration table:
date_unregistration (distribution of enrollments that were unregistered before a session (code_presentation) and after or right when a session began)
1. total number of unregistered enrollments: 10072
2. unregistered on or after session began: 7394
3. unregistered before session: 2678

of the 10,072 about 27% of enrollments that were unregistered did so before a session began. 
the total number of withdrawals from date_unregistered in studentRegistration do not match with from the final_result from studentInfo table (gap of 84). This could mean that some students that marked withdrawal have a null unregistration date.


studentVle table:
date range:
1. total days: 294
2. start date:-25 (negative means how many days before the start of the semester(code_presentation))
3. end date: 269

clicks/engagement (sum_click):
1. minimum: 1
2. max: 6977
frequency of top 5 clicks (sum_click) (most common sum_click value for the entire studentVle table):
- 1(5113910 entries)
- 2(1929023 entries)
- 3(965277 entries)
- 4(612858 entries)
- 5(415139 entries)
the sum_click value of 1 has the highest frequency (5,113,910 entries). As the value of sum_click increases, the frequency appears to decrease sharply.
The click(sum_click) distribution is heavily right skewed which will affect how engagement is aggregated and visualized.


Assessment table:
With this table I want to define the window that counts as early engagement. 
After making a query in 01_explore.sql I found that the majority of subjects (code_module)
have their earliest assessments from 18-25 days with some outliers being sooner or later.
The earliest assessments in code_module GGG are 61 days across all sessions(code_presentation). The first four weeks lands around the first_assessment cluster of days 18

conclusion: day 0 -> 28 is the time frame I'll define that counts as the early window. 

I will classify "Fail" and "Withdrawn" as an at risk student and classify "Pass" and "Distinction" as not at risk.
I'm only concerned about student retention during the session (code_presentation) so I'll have to clean the data to disregard students who withdrew before day 0 to avoid inflated results. 

students who unregister right when the session (code_presentation) have a short real engagement window which could still cause bias. One way of suppressing the bias is adding a condition where I drop students who unregistered in the first 5-7days of the session (code_presentation). For now, I won't drop any students but I'll do a comparison later on.

current conditions 09/18/26:
students that have a date_unregistration less than 0 will be dropped.






