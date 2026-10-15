/*
SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.col1 = TableB.col1


SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.col1 = TableB.col1
WHERE TableB.anycolumn is null
*/

--Challenge
ECT * 
FROM boarding_passes
FULL OUTER JOIN tickets
ON boarding_passes.ticket_no = tickets.ticket_no
WHERE boarding_passes.ticket_no is null