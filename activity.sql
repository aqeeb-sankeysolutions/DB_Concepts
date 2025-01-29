CREATE PROCEDURE INSERTEMPLOYEE (
	IN P_EMP_ID INTEGER,
	IN P_EMP_NAME VARCHAR(50),
	IN P_DATE_OF_BIRTH DATE,
	IN P_SALARY DECIMAL(10, 2),
	IN P_DEPARTMENT_ID INT,
	IN P_JOINING_DATE TIMESTAMP,
	IN P_OPTED_IN_FOR_EMAILS BOOLEAN
) 
LANGUAGE PLPGSQL 
AS $$ 
BEGIN
	INSERT INTO employees (emp_id, emp_name, date_of_birth, salary, department_id, joining_date, opted_in_for_emails) 
	VALUES (p_emp_id,p_emp_name,p_date_of_birth,p_salary,p_department_id,p_joining_date,p_opted_in_for_emails); 
END; 
$$;

CALL INSERTEMPLOYEE (
	101,
	'Rahul Singh',
	'1990-05-21',
	75000.90,
	1,
	'2022-03-15 10:30:00',
	TRUE)
CALL INSERTEMPLOYEE (
	102,
	'Aqeeb Ansari',
	'1999-11-09',
	75000.90,
	1,
	'2022-03-15 10:30:00',
	TRUE
)
CALL INSERTEMPLOYEE (
	103,
	'Shradha Khapra',
	'1987-05-21',
	150000,
	4,
	'2008-06-25 11:00:00',
	FALSE
)
CALL INSERTEMPLOYEE (
	104,
	'Ayesha Khan',
	'2001-09-12',
	50000.00,
	6,
	'2022-09-30 10:45:54',
	TRUE
)
CALL INSERTEMPLOYEE (
	105,
	'Ravi Patel',
	'1999-09-11',
	45000.00,
	5,
	'2020-01-01 11:00:00',
	TRUE
)
SELECT
	*
FROM
	EMPLOYEES;

CREATE PROCEDURE UPDATE_EMPLOYEES (IN P_EMP_ID INTEGER, IN P_SALARY NUMERIC(9, 2)) 
LANGUAGE PLPGSQL 
AS $$ 
BEGIN
	UPDATE employees SET salary=p_salary WHERE emp_id=p_emp_id;
END;
$$;

CALL UPDATE_EMPLOYEES (102, 65000.89)

CALL UPDATE_EMPLOYEES (102, 65000.89)

CREATE PROCEDURE DELETE_EMPLOYEE(IN P_EMPLOYEEID INT)
LANGUAGE plpgsql
AS $$
BEGIN
	DELETE FROM employees WHERE emp_id=p_employeeid;
END;
$$;

CALL DELETE_EMPLOYEE(103);
SELECT * FROM EMPLOYEES;