--1
SELECT * FROM Employee;
--2
SELECT salary FROM Employee;
--3
SELECT DISTINCT job_name FROM Employee;
--4
SELECT emp_name,salary * 1.15 AS increased_salary_in_dollars FROM employee;
--5
SELECT emp_name + ' & ' + job_name AS employee_and_job FROM employee;
--6
SELECT emp_name + '(' + job_name + ')' AS Employee FROM employee;
--7
SELECT emp_id, emp_name,salary,hire_date FROM Employee WHERE FORMAT(hire_date, 'MMMM d, yyyy') = 'February 22, 1991';
--8
SELECT LEN(emp_name) AS EmpNameLenght,emp_name FROM Employee;
--9
SELECT emp_id,salary,commission FROM employee;
--10
SELECT DISTINCT dep_id,job_name FROM Employee AS E
--11
SELECT * FROM Employee WHERE dep_id <> 2001;
--12
SELECT * FROM Employee WHERE dep_id  < 1991;
--13
SELECT AVG(salary) AS AverageSalary FROM Employee WHERE job_name='analyst';
--14
SELECT * FROM Employee WHERE emp_name ='BLAZE';
--15
SELECT * FROM Employee WHERE commission > salary;
--16
SELECT * FROM Employee WHERE ( salary + (salary *2.5)) > 3000;
--17
SELECT emp_name FROM Employee WHERE LEN(emp_name) = 6;
--18
SELECT * FROM Employee WHERE MONTH(hire_date) = 1;
--19
SELECT e.emp_name + ' works for ' + m.emp_name AS relationship 
FROM Employee e 
JOIN Employee m 
ON e.manager_id = m.emp_id;
--20
SELECT * FROM Employee WHERE job_name ='CLERK';
--21
SELECT * FROM Employee WHERE DATEDIFF(YEAR, hire_date, GETDATE()) > 27;
--22
SELECT * FROM Employee WHERE salary  < 3500;
--23
SELECT emp_name,job_name,salary FROM Employee WHERE job_name ='ANALYST';
--24
SELECT * FROM Employee WHERE YEAR(hire_date)  = '1991';
--25
SELECT emp_id,emp_name,hire_date,salary FROM Employee WHERE hire_date < '1991-04-01';
--26
 SELECT emp_name, job_name
 FROM Employee
WHERE manager_id IS NULL OR manager_id = '';
--27
SELECT * FROM Employee WHERE hire_date  = '1991-05-01';
--28
SELECT emp_id,emp_name,salary,DATEDIFF(YEAR,hire_date,GETDATE()) AS Experience
FROM Employee WHERE manager_id = '68319';
--29
SELECT emp_id,emp_name,salary,DATEDIFF(DAY,hire_date,GETDATE()) AS Experience
FROM Employee WHERE (salary/30)>100;
--30
SELECT emp_name FROM Employee WHERE hire_date <= '2012-01-01' AND DATEDIFF(YEAR,hire_date,GETDATE()) >= 8;
--31
SELECT * FROM Employee WHERE salary % 2 <>0;
--32
SELECT * FROM Employee WHERE LEN(CAST(salary AS VARCHAR)) = 3;
--33
SELECT * FROM Employee WHERE MONTH(hire_date) = 4;
--34
SELECT *FROM Employee WHERE DAY(hire_date) < 19;
--35
SELECT *FROM Employee WHERE job_name = 'SALESMAN' AND DATEDIFF(MONTH,hire_date,GETDATE()) > 10;
--36
SELECT *FROM Employee WHERE dep_id = '3001' OR dep_id = '1001' AND YEAR(hire_date) = '1991';
--37
SELECT *FROM Employee WHERE dep_id = '2001' OR dep_id = '1001';
--38
SELECT *FROM Employee WHERE dep_id = '2001' AND job_name = 'CLERK';
--39(a)
SELECT emp_id,emp_name,salary,job_name FROM Employee WHERE commission < salary AND (salary+commission)<34000;
--39(b)
SELECT emp_id,emp_name,salary,job_name FROM Employee WHERE job_name = 'SALESMAN' AND dep_id = '3001';
--40
SELECT emp_id,emp_name,salary,job_name FROM Employee WHERE job_name = 'CLERK' OR job_name ='MANAGER';
--41
SELECT * FROM Employee WHERE MONTH(hire_date)<>2;
--42
SELECT * FROM Employee WHERE YEAR(hire_date) = 1991;
--43
SELECT * FROM Employee WHERE YEAR(hire_date) = 1991 AND MONTH(hire_date) = 6;
--44
SELECT * FROM Employee WHERE salary * 12 BETWEEN 24000 AND 50000;
--45
SELECT * FROM Employee WHERE hire_date IN ('1991-05-01', '1991-02-20', '1991-12-03');
--46
SELECT * FROM Employee WHERE manager_id IN (63679, 68319, 66564, 69000);
--47
SELECT * FROM Employee WHERE hire_date > '1991-06-30' AND YEAR(hire_date) = 1991;
--48
SELECT * FROM Employee WHERE YEAR(hire_date) BETWEEN 1990 AND 1999;
--49
SELECT * FROM Employee WHERE job_name = 'MANAGER' AND dep_id IN (1001, 2001);
--50
SELECT * FROM Employee WHERE MONTH(hire_date) = 2 AND salary BETWEEN 1001 AND 2000;
--51
SELECT * FROM Employee WHERE YEAR(hire_date) <> 1991;

--52
SELECT e.emp_id, e.emp_name, e.job_name, e.manager_id, e.hire_date, e.salary, e.commission, d.dep_id, 
d.dep_name FROM Employee e INNER JOIN Department d ON e.dep_id = d.dep_id;
--53
SELECT emp_name, job_name, salary * 12 AS Annual_Salary, dep_id, S.grade 
FROM employee ,Salary_grade AS S 
WHERE salary * 12 >= 60000 OR job_name != 'ANALYST';
--54
SELECT e.emp_name, e.job_name, e.manager_id, e.salary, m.emp_name AS manager_name, m.salary AS manager_salary FROM Employee e INNER JOIN Employee m ON e.manager_id = m.emp_id WHERE e.salary > m.salary;

--55
SELECT emp_name, E.dep_id, salary, commission FROM Employee AS E 
JOIN Department AS D ON E.dep_id=D.dep_id 
WHERE salary BETWEEN 2000 AND 5000 AND  dep_location = 'PERTH';

--56
SELECT S.grade, emp_name FROM employee AS E,Salary_grade AS S
WHERE (dep_id IN (1001, 3001) AND S.grade != 4 AND hire_date < '1992-12-31');

--57
SELECT e.emp_id, e.emp_name, e.job_name, e.manager_id, e.hire_date, e.salary, e.dep_id, m.emp_name AS manager_name FROM Employee e INNER JOIN Employee m ON e.manager_id = m.emp_id WHERE m.emp_name = 'JONAS';

--58
SELECT emp_name, salary FROM employee WHERE salary = (SELECT MAX(salary) FROM employee WHERE salary = (SELECT salary FROM employee WHERE emp_name = 'FRANK'));

--59
SELECT * FROM employee WHERE (job_name IN ('MANAGER', 'ANALYST') AND salary BETWEEN 2000 AND 5000 AND commission IS NULL);
--60
SELECT emp_id, emp_name,E.dep_id, salary, dep_location 
FROM Employee AS E
JOIN department ON E.dep_id = department.dep_id 
WHERE  dep_location  IN ('PERTH', 'MELBOURNE') 
AND DATEDIFF(MONTH, hire_date, GETDATE()) > 10;

--61
SELECT emp_id, emp_name, E.dep_id, salary, dep_location
FROM Employee AS E
JOIN Department AS D ON D.dep_id = E.dep_id 
WHERE YEAR(E.hire_date) = 1991
  AND (dep_location = 'SYDNEY' OR dep_location = 'MELBOURNE')
  AND E.salary BETWEEN 2000 AND 5000;
--62
SELECT E.dep_id,emp_id,emp_name,salary,dep_name,dep_location,S.grade
FROM Employee AS E,Department AS D,Salary_grade AS S
WHERE dep_name='MARKETING' 
AND (dep_location ='MELBOURNE' OR dep_location ='PERTH')
AND grade IN(3,4,5)
AND DATEDIFF(YEAR,hire_date,GETDATE())>=25;
--63
SELECT E.* FROM Employee AS E 
JOIN Employee AS M ON E.manager_id=M.emp_id
WHERE E.hire_date>M.hire_date;
--64
SELECT E.*,S.grade,salary FROM Employee AS E ,Salary_grade AS S
WHERE grade=4 
AND salary BETWEEN S.max_salary AND S.min_salary;
--65
SELECT emp_name FROM Employee AS E 
JOIN Department AS D ON E.dep_id = D.dep_id
WHERE YEAR(hire_date) = 1991  
AND emp_name NOT IN ('MARKER', 'ADELYN')
  AND dep_name NOT IN ('PRODUCTION', 'AUDIT');
  --66
SELECT * FROM Employee 
ORDER BY salary ASC;
--67
SELECT * FROM Employee 
ORDER BY dep_id ASC, job_name DESC;
--68
SELECT DISTINCT job_name FROM Employee 
ORDER BY job_name DESC;
--69
SELECT 
  emp_id,
  emp_name,
  salary AS monthly_salary,
  salary / 30 AS daily_salary,
  12 * salary AS annual_salary
FROM Employee
ORDER BY annual_salary ASC;
--70
SELECT *
FROM Employee
WHERE job_name IN ('CLERK', 'ANALYST')
ORDER BY job_name DESC;
--71
SELECT dep_location
FROM Employee
JOIN Department ON Employee.dep_id = Department.dep_id
WHERE emp_name = 'CLARE';
--72
SELECT *
FROM Employee
WHERE hire_date IN ('1991-05-01', '1991-12-03', '1990-01-19')
ORDER BY hire_date ASC;
--73
SELECT *
FROM Employee
WHERE salary < 1000
ORDER BY salary ASC;
--74
SELECT *
FROM Employee
ORDER BY salary ASC
--75
SELECT *
FROM Employee
ORDER BY job_name ASC, emp_id DESC;
--76
SELECT DISTINCT job_name
FROM Employee
WHERE dep_id IN (2001, 3001)
ORDER BY job_name DESC;
--77
SELECT *
FROM Employee
WHERE job_name NOT IN ('PRESIDENT', 'MANAGER')
ORDER BY salary ASC;
--78
SELECT *
FROM Employee
WHERE 12 * salary < 25000
ORDER BY salary ASC;
--79
SELECT emp_id, emp_name, 12 * salary AS annual_salary, salary / 30 AS daily_salary
FROM Employee
WHERE job_name = 'SALESMAN'
ORDER BY annual_salary ASC;
--80
SELECT emp_id, emp_name, hire_date, GETDATE() AS currentDate, DATEDIFF(YEAR,hire_date,GETDATE()) AS experience
FROM Employee
ORDER BY experience ASC;
--81
SELECT *
FROM Employee
WHERE hire_date >= '1991-07-01'
ORDER BY job_name ASC;
--82
SELECT e.*, d.dep_location
FROM Employee e
JOIN Department d ON e.dep_id = d.dep_id
WHERE d.dep_name IN ('FINANCE', 'AUDIT')
ORDER BY d.dep_id ASC;
--83
SELECT E.*,S.grade FROM Employee AS E, Salary_grade AS S
ORDER BY S.grade ASC;
--84
SELECT emp_name,job_name,dep_id,salary,S.grade 
FROM Employee AS E, Salary_grade AS S
ORDER BY dep_id ASC;
--85
SELECT emp_name,job_name,D.dep_name,salary,S.grade 
FROM Employee AS E, Salary_grade AS S, Department AS D
WHERE emp_name<>'CLERK'
ORDER BY salary DESC;
--86
SELECT emp_name,job_name,D.dep_name,salary,S.grade 
FROM Employee AS E, Salary_grade AS S, Department AS D
WHERE emp_name<>'CLERK'
ORDER BY salary DESC;

--87
SELECT e.*, d.dep_name, d.dep_location
FROM Employee e
JOIN Department d ON e.dep_id = d.dep_id;
--88
SELECT E.* FROM Employee AS E 
JOIN Employee AS M ON E.manager_id=M.emp_id
WHERE E.hire_date>M.hire_date;
--89
SELECT emp_id, emp_name, salary, dep_id
FROM Employee
WHERE dep_id = 1001
ORDER BY salary ASC;
--90
SELECT MAX(salary) AS highest_salary
FROM Employee;
--91
SELECT job_name,
       AVG(salary) AS average_salary,
       AVG(salary + COALESCE(commission, 0)) AS average_total_remuneration
FROM Employee
GROUP BY job_name;
--92
SELECT job_name,
       SUM(12 * salary) AS total_annual_salary
FROM Employee
WHERE YEAR(hire_date) = 1991
GROUP BY job_name;
--93
SELECT e.emp_id, e.emp_name, e.dep_id, d.dep_location
FROM Employee e
JOIN Department d ON e.dep_id = d.dep_id;
--94
SELECT e.emp_id, e.emp_name, e.dep_id, d.dep_location, d.dep_name
FROM Employee e
JOIN Department d ON e.dep_id = d.dep_id
WHERE e.dep_id IN (1001, 2001);
--95
SELECT emp_id, emp_name, salary, S.grade
FROM Employee AS E , Salary_grade AS S
WHERE salary BETWEEN S.max_salary AND S.min_salary;
--96
SELECT manager_id, COUNT(*) AS num_employees
FROM Employee
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY manager_id ASC;
--97
SELECT e.dep_id, e.job_name, COUNT(*) AS num_employees
FROM Employee e
GROUP BY e.dep_id, e.job_name;
--98
SELECT dep_id, COUNT(*) AS num_employees
FROM Employee
GROUP BY dep_id
HAVING COUNT(*) >= 2;
--99
SELECT S.grade,COUNT(E.emp_id)AS Numbes_OF_Employees,MAX(salary) AS MAX_Salary
FROM Salary_grade AS S,Employee AS E 
GROUP BY S.grade;
--100
SELECT dep_name,S.grade,COUNT(emp_id)AS Numbes_OF_Employees
FROM Salary_grade AS S, Employee AS E,Department AS D
WHERE E.job_name = 'SALESMAN'
GROUP BY D.dep_name, S.grade
HAVING COUNT(*) >= 2;










