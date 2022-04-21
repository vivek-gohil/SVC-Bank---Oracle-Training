SET SERVEROUTPUT ON;

DECLARE
	v_result NUMBER;
BEGIN
	v_result := 1 / 0;
	EXCEPTION
		WHEN ZERO_DIVIDE THEN
			DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

DECLARE 
	l_total_salse NUMBER(15,2);
	l_credit_limit NUMBER(10,0);
	l_contact_name VARCHAR(255);
BEGIN
	NULL;
END;
/

DECLARE 
	l_product_name VARCHAR(110) := 'Laptop';
BEGIN
	NULL;
END;
/

-- It is equivalent to 

DECLARE 
	l_product_name VARCHAR(110) DEFAULT 'Laptop';
BEGIN
	NULL;
END;
/


BEGIN
	GOTO second_message;

	<<first_message>>
	DBMS_OUTPUT.PUT_LINE('Hello');
	GOTO the_end;

	<<second_message>>
	DBMS_OUTPUT.PUT_LINE('PL/SQL GOTO Demo');
	GOTO first_message;

	<<the_end>>
	DBMS_OUTPUT.PUT_LINE('and good bye..');

END;
/

BEGIN
	<<first_message>>
	DBMS_OUTPUT.PUT_LINE('Hello');
	GOTO the_end;


	<<second_message>>
	DBMS_OUTPUT.PUT_LINE('PL/SQL GOTO Demo');
	GOTO first_message;


	GOTO second_message;
	GOTO the_end;

	<<the_end>>
	DBMS_OUTPUT.PUT_LINE('and good bye..');

END;
/



BEGIN
	<<first_message>>
	DBMS_OUTPUT.PUT_LINE('Hello');


	<<second_message>>
	DBMS_OUTPUT.PUT_LINE('PL/SQL GOTO Demo');
	GOTO first_message;


	GOTO second_message;
	GOTO the_end;

	<<the_end>>
	DBMS_OUTPUT.PUT_LINE('and good bye..');

END;
/



DECLARE 
	n_sales NUMBER;
	n_tax NUMBER;
BEGIN
	GOTO inside_if_statement;
	IF n_sales > 0 THEN
		<<inside_if_statement>>
		n_tax := n_sales * 0.1;
END;
/

DECLARE
	l_counter NUMBER := 0;
BEGIN
	LOOP
		l_counter := l_counter + 1;
		IF l_counter > 3 THEN
			EXIT;
		END IF;
	DBMS_OUTPUT.PUT_LINE('Inside loop ' || l_counter);
	END LOOP;
	-- control resumes here after exit
	DBMS_OUTPUT.PUT_LINE('After loop ' || l_counter);
END;
/

DECLARE
	l_i NUMBER := 0;
	l_j NUMBER := 0;
BEGIN
	<<outer_loop>>
	LOOP
		l_i := l_i + 1;
		EXIT outer_loop WHEN l_i > 2;
		DBMS_OUTPUT.PUT_LINE('Outer counter ' || l_i);
	
		-- reset the inner loop
		l_j := 0;
			<<inner_loop>> LOOP
				l_j := l_j + 1;
				EXIT inner_loop WHEN l_j > 3;
				DBMS_OUTPUT.PUT_LINE('Inner counter ' || l_j);

			END LOOP inner_loop;
	END LOOP outer_loop;
END;
/

BEGIN
	FOR l_counter IN 5..1
	LOOP
		DBMS_OUTPUT.PUT_LINE(l_counter);
	END LOOP;
END;
/

BEGIN
	FOR l_counter IN 5..1
	LOOP
		DBMS_OUTPUT.PUT_LINE(l_counter);
	END LOOP;
END;
/


BEGIN
	FOR l_counter IN REVERSE 1..5
	LOOP
		DBMS_OUTPUT.PUT_LINE(l_counter);
	END LOOP;
END;
/


DECLARE
	n_counter NUMBER := 1;
BEGIN
	WHILE n_counter <= 5
	LOOP
		DBMS_OUTPUT.PUT_LINE(n_counter);
		n_counter := n_counter + 1;
		EXIT WHEN n_counter = 3;
	END LOOP;	
END;
/

BEGIN
	FOR n_index IN 1 .. 10
	LOOP
		-- skip the odd numbers
		IF MOD(n_index , 2) = 1 THEN
			CONTINUE;
		END IF;
		DBMS_OUTPUT.PUT_LINE(n_index);
	END LOOP;
END;
/


DECLARE
	n_counter NUMBER := 1;
BEGIN
	WHILE n_counter <= 5 LOOP
		IF MOD(n_counter , 2) = 0 THEN
			CONTINUE;
		END IF;
	DBMS_OUTPUT.PUT_LINE(n_counter);
	n_counter := n_counter + 1;				
	END LOOP;
END;
/



DECLARE
	n_counter NUMBER := 0;
BEGIN
	WHILE n_counter <= 5 LOOP
		n_counter := n_counter + 1;	
		IF MOD(n_counter , 2) = 0 THEN
			CONTINUE;
		END IF;
	DBMS_OUTPUT.PUT_LINE(n_counter);
	END LOOP;
END;
/


DECLARE
	n_counter NUMBER := 0;
BEGIN
	WHILE n_counter <= 5 LOOP
		n_counter := n_counter + 1;	
		IF MOD(n_counter , 2) = 1 THEN
			CONTINUE;
		END IF;
	DBMS_OUTPUT.PUT_LINE(n_counter);
	END LOOP;
END;
/



DECLARE
	n_counter NUMBER := 0;
BEGIN
	WHILE n_counter <= 5 LOOP
		n_counter := n_counter + 1;	
		-- IF MOD(n_counter , 2) = 1 THEN
		-- 	CONTINUE;
		-- END IF;
		CONTINUE WHEN	 MOD(n_counter , 2) = 1;
	DBMS_OUTPUT.PUT_LINE(n_counter);
	END LOOP;
END;
/

DECLARE
	c_grade CHAR(1);
	c_rank VARCHAR(20);
BEGIN
	c_grade := 'B';
	CASE c_grade
	WHEN 'A' THEN
		c_rank := 'Excellent';
	WHEN 'B' THEN
		c_rank := 'Very Good';
	WHEN 'C' THEN
		c_rank := 'Good';
	WHEN 'D' THEN
		c_rank := 'Fair';
	WHEN 'E' THEN
		c_rank := 'Poor';
	ELSE
		c_rank := 'No such grade';
	END CASE;
	DBMS_OUTPUT.PUT_LINE(c_rank);
END;
/


DECLARE
	c_grade CHAR(1);
	c_rank VARCHAR(20);
BEGIN
	-- c_grade := 'B';
	c_grade := &grade;
	CASE c_grade
	WHEN 'A' THEN
		c_rank := 'Excellent';
	WHEN 'B' THEN
		c_rank := 'Very Good';
	WHEN 'C' THEN
		c_rank := 'Good';
	WHEN 'D' THEN
		c_rank := 'Fair';
	WHEN 'E' THEN
		c_rank := 'Poor';
	ELSE
		c_rank := 'No such grade';
	END CASE;
	DBMS_OUTPUT.PUT_LINE(c_rank);
END;
/



DECLARE 
	d_date DATE := TO_DATE('&date', 'DD-MM-YYYY');
	d_date_name VARCHAR(20) := RTRIM (TO_CHAR(d_date, 'DAY'));
BEGIN
	IF d_date_name IN('SATURDAY','SUNDAY') THEN
		DBMS_OUTPUT.PUT_LINE('The day of the given date is '|| d_date_name || ' and it falls on weekend');
	ELSE
		DBMS_OUTPUT.PUT_LINE('The day of the given date is '|| d_date_name || ' and it is a weekday');
	END IF;
END;
/

CREATE TABLE employee_details (
	employee_id NUMBER(10,2) PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	salary NUMBER(10,2) NOT NULL
);

INSERT INTO employee_details VALUES(101,'Vivek','Gohil',1000);
INSERT INTO employee_details VALUES(102,'Samarth','Patil',1000);
INSERT INTO employee_details VALUES(103,'Gurubux','Gill',1000);

COMMIT;

SELECT * FROM employee_details;

DECLARE
	l_employee_id employee_details.employee_id%TYPE;
	l_first_name employee_details.first_name%TYPE;
	l_last_name employee_details.last_name%TYPE;
	l_salary employee_details.salary%TYPE;
BEGIN
	-- get all the details of employee id 101 and assign to all variables
	SELECT * INTO l_employee_id , l_first_name , l_last_name , l_salary 
	FROM employee_details WHERE employee_id = 101;	

	-- show the values
	DBMS_OUTPUT.PUT_LINE('Employee Id : '|| l_employee_id);
	DBMS_OUTPUT.PUT_LINE('First Name : '|| l_first_name);
	DBMS_OUTPUT.PUT_LINE('Last Name : '|| l_last_name);
	DBMS_OUTPUT.PUT_LINE('Salary : '|| l_salary);
END;
/


DECLARE
	l_employee_row employee_details%ROWTYPE;

BEGIN
	-- get all the details of employee id 101 and assign to variable
	SELECT * INTO l_employee_row
	FROM employee_details WHERE employee_id = 101;	

	-- show the values
	DBMS_OUTPUT.PUT_LINE('Employee Id : '|| l_employee_row.employee_id);
	DBMS_OUTPUT.PUT_LINE('First Name : '|| l_employee_row.first_name);
	DBMS_OUTPUT.PUT_LINE('Last Name : '|| l_employee_row.last_name);
	DBMS_OUTPUT.PUT_LINE('Salary : '|| l_employee_row.salary);
END;
/
DECLARE
	l_employee_row employee_details%ROWTYPE;
	l_employee_id employee_details.employee_id%TYPE := &employee_id;
BEGIN
	-- get all the details of employee id 101 and assign to variable
	SELECT * INTO l_employee_row
	FROM employee_details WHERE employee_id = l_employee_id;	

	-- show the values
	DBMS_OUTPUT.PUT_LINE('Employee Id : '|| l_employee_row.employee_id);
	DBMS_OUTPUT.PUT_LINE('First Name : '|| l_employee_row.first_name);
	DBMS_OUTPUT.PUT_LINE('Last Name : '|| l_employee_row.last_name);
	DBMS_OUTPUT.PUT_LINE('Salary : '|| l_employee_row.salary);
END;
/

DECLARE
	l_employee_row employee_details%ROWTYPE;
	l_employee_id employee_details.employee_id%TYPE := &employee_id;
BEGIN
	-- get all the details of employee id 101 and assign to variable
	SELECT * INTO l_employee_row
	FROM employee_details WHERE employee_id = l_employee_id;	

	-- show the values
	DBMS_OUTPUT.PUT_LINE('Employee Id : '|| l_employee_row.employee_id);
	DBMS_OUTPUT.PUT_LINE('First Name : '|| l_employee_row.first_name);
	DBMS_OUTPUT.PUT_LINE('Last Name : '|| l_employee_row.last_name);
	DBMS_OUTPUT.PUT_LINE('Salary : '|| l_employee_row.salary);

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Employee with employee id: '|| l_employee_id || ' dose not exist');
END;
/


DECLARE
	l_employee_row employee_details%ROWTYPE;
	l_employee_salary employee_details.salary%TYPE := &salary;
BEGIN
	-- get all the details of employee id 101 and assign to variable
	SELECT * INTO l_employee_row
	FROM employee_details WHERE salary = l_employee_salary;	

	-- show the values
	DBMS_OUTPUT.PUT_LINE('Employee Id : '|| l_employee_row.employee_id);
	DBMS_OUTPUT.PUT_LINE('First Name : '|| l_employee_row.first_name);
	DBMS_OUTPUT.PUT_LINE('Last Name : '|| l_employee_row.last_name);
	DBMS_OUTPUT.PUT_LINE('Salary : '|| l_employee_row.salary);

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Employee with Salary: '|| l_employee_salary || ' dose not exist');
END;
/

DECLARE
	e_salary_too_high EXCEPTION;
	PRAGMA EXCEPTION_INIT(e_salary_too_high , -20001);
	l_max_salary employee_details.salary%TYPE;
	l_employee_id employee_details.employee_id%TYPE := &employee_id;
	l_new_salary employee_details.salary%TYPE := &salary;
BEGIN
	-- get the max salary from employee_details table
	SELECT MAX(salary) INTO l_max_salary FROM employee_details;

	-- check if input salary is greater than the max salary
	IF l_new_salary > l_max_salary THEN
		-- RAISE e_salary_too_high EXCEPTION
		RAISE e_salary_too_high;
	END IF;

	-- if not , update the salary
	UPDATE employee_details SET salary = l_new_salary
	WHERE employee_id = l_employee_id;

	COMMIT;
END;
/
DECLARE
	e_salary_too_high EXCEPTION;
	PRAGMA EXCEPTION_INIT(e_salary_too_high , -20001);
	l_max_salary employee_details.salary%TYPE;
	l_employee_id employee_details.employee_id%TYPE := &employee_id;
	l_new_salary employee_details.salary%TYPE := &salary;
BEGIN
	-- get the max salary from employee_details table
	SELECT MAX(salary) INTO l_max_salary FROM employee_details;

	-- check if input salary is greater than the max salary
	IF l_new_salary > l_max_salary THEN
		-- RAISE e_salary_too_high EXCEPTION
		RAISE e_salary_too_high;
	END IF;

	-- if not , update the salary
	UPDATE employee_details SET salary = l_new_salary
	WHERE employee_id = l_employee_id;

	COMMIT;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Employee with employeeId: '|| l_employee_id || ' dose not exist');

		WHEN e_salary_too_high THEN
			DBMS_OUTPUT.PUT_LINE('Database returns more than one employees');
END;
/

DECLARE
	e_salary_too_high EXCEPTION;
	PRAGMA EXCEPTION_INIT(e_salary_too_high , -20001);
	l_max_salary employee_details.salary%TYPE;
	l_employee_id employee_details.employee_id%TYPE := &employee_id;
	l_new_salary employee_details.salary%TYPE := &salary;
BEGIN
	-- get the max salary from employee_details table
	SELECT MAX(salary) INTO l_max_salary FROM employee_details;

	-- check if input salary is greater than the max salary
	IF l_new_salary > l_max_salary THEN
		-- RAISE e_salary_too_high EXCEPTION
		-- RAISE e_salary_too_high;
		raise_application_error(-20001,'Salary is too high');
	END IF;

	-- if not , update the salary
	UPDATE employee_details SET salary = l_new_salary
	WHERE employee_id = l_employee_id;

	COMMIT;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Employee with employeeId: '|| l_employee_id || ' dose not exist');

		WHEN e_salary_too_high THEN
			DBMS_OUTPUT.PUT_LINE('Salary too high for selected employee!');
END;
/


DECLARE
	e_salary_too_high EXCEPTION;
	PRAGMA EXCEPTION_INIT(e_salary_too_high , -20001);
	l_max_salary employee_details.salary%TYPE;
	l_employee_id employee_details.employee_id%TYPE := &employee_id;
	l_new_salary employee_details.salary%TYPE := &salary;
BEGIN
	-- get the max salary from employee_details table
	SELECT MAX(salary) INTO l_max_salary FROM employee_details;

	-- check if input salary is greater than the max salary
	IF l_new_salary > l_max_salary THEN
		-- RAISE e_salary_too_high EXCEPTION
		-- RAISE e_salary_too_high;
		raise_application_error(-20001,'Salary is too high');
	END IF;

	-- if not , update the salary
	UPDATE employee_details SET salary = l_new_salary
	WHERE employee_id = l_employee_id;

	COMMIT;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Employee with employeeId: '|| l_employee_id || ' dose not exist');

		-- WHEN e_salary_too_high THEN
		--	DBMS_OUTPUT.PUT_LINE('Salary too high for selected employee!');
END;
/
