Select e.emp_no, e.first_name, e.last_name, tit.title, tit.from_date, tit.to_date
Into Ret_empby_tit
From titles as tit
Join employees as e
on e.emp_no = tit.emp_no
Where e.birth_date Between '1952-01-01' AND '1955-12-31'
Order By e.emp_no


select Distinct On(emp_no) emp_no, first_name, last_name, title
INTO Unique_Titles
From Ret_empby_tit
where to_date = '9999-01-01'
Order By emp_no, to_date DESC


select Count(title), title
INTO retiring_titles
From unique_titles
Group by title
Order By Count(title) Desc


Select Distinct On (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
From dept_emp AS de
INNER JOIN employees as e
ON e.emp_no = de.emp_no
INNER JOIN titles as t
on e.emp_no = t.emp_no
where t.to_date = '9999-01-01'
AND e.birth_date <= '1965-12-31'
AND e.birth_date >= '1965-01-01'
Order By emp_no