SELECT
    id,
    (CASE 
        WHEN id % 2 = 0 THEN (LAG(student) OVER (ORDER BY id))
        WHEN id % 2 != 0 AND (LEAD(student) OVER (ORDER BY id) is null) THEN student
        WHEN id % 2 != 0 THEN LEAD(student) OVER (ORDER BY id)
        ELSE student
    END
    ) as student
FROM
    Seat
