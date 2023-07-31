CREATE TABLE departments (
    dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(25) NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(6) NOT NULL PRIMARY KEY,
    title VARCHAR(25) NOT NULL
);

CREATE TABLE employees (
    emp_no INTEGER NOT NULL PRIMARY KEY,
    emp_title VARCHAR(6) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles (title_id),
    birth_date date,
    first_name VARCHAR(50),
    last_name VARCHAR (50),
    sex VARCHAR(1),
    hire_date date
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    emp_no INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE salaries (
    emp_no INTEGER NOT NULL PRIMARY KEY ,
    salary INTEGER
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);