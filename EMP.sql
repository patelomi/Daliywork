create database emp;
use emp;

CREATE TABLE permission (
    permissionid BIGINT(24) PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(80),
    slug VARCHAR(104),
    description TINYTEXT,
    type SMALLINT(8),
    active SMALLINT(8),
    createdAt DATETIME,
    updatedAt DATETIME,
    content TEXT
);
alter table permission add foreign key(employeeid) references employee(employee);
CREATE TABLE role_permission (
    rolepermissionid BIGINT(24),
    permissionid BIGINT(24),
    createdAt DATETIME,
    updatedAt DATETIME,
    primary key(rolepermissionid),
    foreign key(permissionid) references permission(permissionid)
);

CREATE TABLE role (
    roleid BIGINT(24) PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(80),
    slug VARCHAR(104),
    description TINYTEXT,
    type SMALLINT(8),
    active SMALLINT(8),
    createdAt DATETIME,
    updatedAt DATETIME,
    content TEXT
);

CREATE TABLE employee (
    employee BIGINT(24) PRIMARY KEY AUTO_INCREMENT,
    userid BIGINT(24),
    orgnizationid BIGINT(24),
    roleid BIGINT(24),
    createdBy BIGINT(24),
    updatedBy BIGINT(24),
    code VARCHAR(104),
    status SMALLINT(8),
    createdAt DATETIME,
    updatedAt DATETIME,
    startsAt DATETIME,
    endsAt DATETIME,
    notes TEXT,
    foreign key(roleid) references role(roleid),
    foreign key(userid) references user(userid),
    foreign key(orgnizationid) references orgnization(orgnizationid)
);

CREATE TABLE user (
    userid BIGINT(24) PRIMARY KEY AUTO_INCREMENT,
    roleid BIGINT(24),
    firstName VARCHAR(56),
    middleName VARCHAR(56),
    lastName VARCHAR(56),
    mobile VARCHAR(16),
    email VARCHAR(56),
    passwordHash VARCHAR(32),
    registeredAt DATETIME,
    lastLogin DATETIME,
    intro TINYTEXT,
    profile TEXT,
    foreign key(roleid) references role(roleid)
);

CREATE TABLE orgnization (
    orgnizationid BIGINT(24) PRIMARY KEY AUTO_INCREMENT,
    createdBy BIGINT(24),
    updatedBy BIGINT(24),
    title VARCHAR(80),
    metaTitle VARCHAR(104),
    slug VARCHAR(104),
    summary TINYTEXT,
    status SMALLINT(8),
    createdAt DATETIME,
    updatedAt DATETIME,
    profile TEXT,
    content TEXT
);

CREATE TABLE organization_meta (
    organizationmetaid BIGINT(24) PRIMARY KEY AUTO_INCREMENT,
    orgnizationId BIGINT(24),
    orkey VARCHAR(56),
    content TEXT
);

/*1.Get the users which are having permission id assigned as 2.*/

SELECT 
    u.firstName
FROM
    user u
        JOIN
    role r ON u.roleid = r.roleid
        JOIN
    role_permission rp ON r.roleid = rp.roleid
WHERE
    rp.permissionid = 2;

/*2.Get a list of users who are working in organization id 1 along with organization title.*/

SELECT 
    o.orgnizationid, o.title
FROM
    orgnization o
        CROSS JOIN
    user
WHERE
    orgnizationid = 1;

/*3.Get all the employee emails who are created in the last two dates and have permission id 1.*/

SELECT 
    u.email
FROM
    user u
        JOIN
    employee e ON u.userid = e.userid
        JOIN
    permission p ON e.employee = p.employeeid
WHERE
    p.permissionid = 1;


/*5.Get all the employee emails who were working last year.*/

SELECT 
    u.email
FROM
    user u
        JOIN
    employee e ON u.userid = e.userid
WHERE
    YEAR(e.startsAt) LIKE '2020%';

/*3.Get all the employee emails who are created in the last two dates and have permission id 1.*/
SELECT 
    u.email
FROM
    user u
        JOIN
    employee e ON u.userid = e.userid
        JOIN
    role_permission rp ON e.roleid = rp.roleid
WHERE
    DATE(CURRENT_DATE()) - DATE(e.createdAt) <= 2
        AND MONTH(CURRENT_DATE()) - MONTH(e.createdAt) = 0
        AND YEAR(CURRENT_DATE()) - YEAR(e.createdAt) = 0
        AND rp.permissionid = 1;
commit;