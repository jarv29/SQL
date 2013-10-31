-- When you run this query, it will prompt you for two user profile names
-- It will return a full join of all roles between two users
-- If a user doesn't have a role that the other user has, there will be a null value in the user column.

SELECT A.ROLEUSER AS "User 1",
       B.ROLEUSER AS "User 2",
       NVL(A.ROLENAME,B.ROLENAME) AS "Role Name",
       C.DESCR AS "Role Description"
FROM
  (SELECT ROLEUSER,ROLENAME FROM PSROLEUSER WHERE ROLEUSER='&USER1') A
FULL OUTER JOIN
  (SELECT ROLEUSER,ROLENAME FROM PSROLEUSER WHERE ROLEUSER='&USER2') B
ON A.ROLENAME=B.ROLENAME
LEFT JOIN
  (SELECT DESCR,ROLENAME FROM PSROLEDEFN) C
ON NVL(A.ROLENAME,B.ROLENAME)=C.ROLENAME;