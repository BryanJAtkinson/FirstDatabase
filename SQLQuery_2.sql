SELECT

ias.First_Name,
ias.Last_Name,
AVG(cap.Grade) GPA

FROM

Instructors_Students AS ias

INNER JOIN Class_People AS cap

ON ias.Ins_Student_ID = cap.Ins_Student_ID

WHERE

cap.Grade > 2.00
AND
ias.Title = 'Student'

GROUP BY

ias.First_Name,
ias.Last_Name

HAVING

AVG(cap.Grade) > 3.00;