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
