/*
1.Most commonly used join type
2.FROM one table all of the rows and from other row only the matching one
3. We can use just "LEFT JOIN" instead of LEFT OUTER JOIN 
SELECT * FROM TableA
LEFT JOIN TableB
ON TableA.col1 = TableB.col1
*/

SELECT *
FROM aircrafts AS a
LEFT JOIN flights AS f
ON a.aircraft_code = f.aircraft_code
WHERE f.aircraft_code is null;

-- Challenge
Select count(*)
, s.seat_no
FROM seats AS s
FULL OUTER JOIN boarding_passes AS bp
ON s.seat_no = bp.seat_no
GROUP BY s.seat_no 
ORDER BY count(*) DESC;

Select count(*)
, RIGHT(S.seat_no,1)
FROM seats AS s
FULL OUTER JOIN boarding_passes AS bp
ON s.seat_no = bp.seat_no
GROUP BY RIGHT(s.seat_no,1)
ORDER BY count(*) DESC;
