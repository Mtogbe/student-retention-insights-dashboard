studentInfo table:
looking at the class distribution of the final_result column, (whether enrollments passed, failed or withdrew from their module/course)
1. fail: 7052 students
2. withdrawn: 10156
3. distinction: 3024 (distinction means passing with honors)
4. pass: 12361

17,208 enrollments received bad outcomes (withdrew or failed) while only 15,385 enrollments received good out comes (pass or distinction).
52.7% of enrollments ended in failure or withdrawl.

studentRegistration table:
date_unregistration (distribution of enrollments that were unregistered before a session (code_presentation) and after or right when a session began)
1. total number of unregistered enrollments: 10072
2. unregistered on or after session began: 7394
3. unregistered before session: 2678

of the 10,072 about 27% of enrollments that were unregistered did so before a session began. 
the total number of withdrawls from date_unregistered in studentRegistration do not match with from the final_result from studentInfo table. This could mean that some students that marked withdrawl have a null unregistration date.