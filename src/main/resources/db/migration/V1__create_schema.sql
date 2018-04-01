CREATE TYPE gender AS ENUM('m', 'f');

CREATE TABLE employee (
    id          SERIAL,
    emp_id      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      gender 		    NULL,
    hire_date   DATE            NOT NULL,
    is_deleted  BOOLEAN,
    PRIMARY KEY (id),
    UNIQUE(emp_id, is_deleted)
);

CREATE TABLE department (
    id          SERIAL,
    dept_id     CHAR(4)         NOT NULL,
    name        VARCHAR(40)     NOT NULL,
    is_deleted  BOOLEAN,
    PRIMARY KEY (id),
    UNIQUE   	(name),
    UNIQUE      (dept_id, is_deleted)
);

CREATE TABLE dept_manager (
    id          SERIAL,
    dept_id     CHAR(4)         NOT NULL,
    emp_id      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    is_deleted  BOOLEAN,
    FOREIGN KEY (emp_id, is_deleted)  REFERENCES employee (emp_id, is_deleted),
    FOREIGN KEY (dept_id, is_deleted) REFERENCES department (dept_id, is_deleted),
    PRIMARY KEY (id)
);

CREATE INDEX dept_manager_dept_id_idx ON dept_manager(dept_id);

CREATE TABLE dept_emp (
    id      SERIAL,
    emp_id      INT             NOT NULL,
    dept_id     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    is_deleted  BOOLEAN,
    FOREIGN KEY (emp_id, is_deleted)  REFERENCES employee   (emp_id, is_deleted),
    FOREIGN KEY (dept_id, is_deleted) REFERENCES department (dept_id, is_deleted),
    PRIMARY KEY (id)
);

CREATE INDEX dept_emp_dept_no_idx ON dept_emp(dept_id);

CREATE TABLE title (
    id          SERIAL,
    emp_id      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    is_deleted  BOOLEAN,
    FOREIGN KEY (emp_id, is_deleted) REFERENCES employee (emp_id, is_deleted),
    PRIMARY KEY (id)
);


CREATE TABLE salary (
    id          SERIAL,
    emp_id      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    is_deleted  BOOLEAN,
    FOREIGN KEY (emp_id, is_deleted) REFERENCES employee (emp_id, is_deleted),
    PRIMARY KEY (id)
);