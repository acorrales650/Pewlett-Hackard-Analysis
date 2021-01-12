-- Retrieve emp_no, first name, and last from employees
SELECT em.emp_no,
em.first_name,
em.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO employee_database
FROM employees as em
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (ed.emp_no) ed.emp_no,
ed.first_name,
ed.last_name,
ed.title
INTO updated_database
FROM employee_database as ed
ORDER BY ed.emp_no, ed.to_date DESC;

-- Count number of employees retiring by title
SELECT COUNT(ud.emp_no), ud.title
INTO retiring_titles
FROM updated_database as ud
GROUP BY ud.title
ORDER BY count DESC;



-- Mentorship Eligibility 
SELECT DISTINCT ON(em.emp_no) em.emp_no,
em.first_name,
em.last_name,
em.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_elig
FROM employees as em
INNER JOIN dept_emp as de
ON (em.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no;