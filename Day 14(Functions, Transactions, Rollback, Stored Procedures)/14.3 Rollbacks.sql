/*
ROLLBACK:
1. Undoing everything within the current transaction that has not been committed yet,
'cause once we have committed that it is committed, and we cannot undo it anymore.
2. After rollback we are not in transation anymore.

SAVEPOINT:
1. we can set them, and then we can rollback to exactly this savepoint.
The savepoint works only within a current transaction
if we want, delete that savepoint, by using RELEASE SAVEPOINT
2. 2. After SAVEPOINT we are still in transaction
*/


BEGIN;
SELECT * FROM acc_balance

UPDATE acc_balance
SET amount = amount - 100
WHERE id = 1;

SAVEPOINT s1;

DELETE FROM acc_balance
WHERE id = 2;

ROLLBACK TO SAVEPOINT s1;
UPDATE acc_balance
SET amount = amount + 100
WHERE id = 2;

ROLLBACK;

COMMIT;