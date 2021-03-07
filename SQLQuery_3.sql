SELECT

ias.First_Name,
ias.Last_Name,
cs.Class_Name,
cap.Grade,
pcc.Card_number,
rch.Department

FROM

Instructors_Students AS ias

INNER JOIN Class_People AS cap

ON ias.Ins_Student_ID = cap.Ins_Student_ID

INNER JOIN Classes as cs

ON cs.Class_ID = cap.Class_ID

INNER JOIN People_Credit_Card as pcc

ON pcc.Ins_Student_ID = ias.Ins_Student_ID

INNER JOIN Research_Class as rcl

ON rcl.Class_ID = cs.Class_ID

INNER JOIN Research as rch

ON rch.Research_ID = rcl.Research_ID

WHERE

cap.Grade > 2.00
AND
ias.Title = 'Instructor'

GROUP BY

ias.First_Name,
ias.Last_Name,
cs.Class_Name,
cap.grade,
pcc.Card_number,
rch.Department;