<cfquery datasource="cfdb">
    create table if not exists employees (
        id int primary key AUTO_INCREMENT,
        name varchar(50) not null,
        role varchar(50) not null,
        phone varchar(50) not null,
        email varchar(50) not null unique
    );
</cfquery>

table created successfully