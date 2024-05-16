--
-- File generated with SQLiteStudio v3.4.3 on Tue Jan 31 15:36:29 2023
--
-- Text encoding used: System
--


-- Table: comment_list
CREATE TABLE IF NOT EXISTS comment_list (

            `comment_id` INTEGER PRIMARY KEY AUTO_INCREMENT,

            `issue_id` INTEGER NOT NULL,

            `comment` TEXT NOT NULL,

            `user_id` INTEGER NOT NULL,

            `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP

        );
INSERT INTO comment_list (comment_id, issue_id, comment, user_id, date_created) VALUES (1, 1, 'Sample Comment 101', 4, '2021-09-11 08:10:40');
INSERT INTO comment_list (comment_id, issue_id, comment, user_id, date_created) VALUES (3, 1, 'We will fix this issue', 5, '2021-09-11 08:31:47');
INSERT INTO comment_list (comment_id, issue_id, comment, user_id, date_created) VALUES (4, 3, 'Sample Comment', 4, '2021-09-11 08:50:43');

-- Table: department_list
CREATE TABLE IF NOT EXISTS department_list (

            `name` TEXT NOT NULL,

            `description` TEXT NOT NULL,

            `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP

        );
INSERT INTO department_list (name, description, date_created) VALUES ('IT Department', 'Information Technology Department', '2021-09-11 03:33:10');
INSERT INTO department_list (name, description, date_created) VALUES ('Marketing', 'Marketing Department', '2021-09-11 05:35:38');
INSERT INTO department_list (name, description, date_created) VALUES ('Testing', 'Test the complete structure of the code', '2023-01-31 09:15:05');

-- Table: issue_list
CREATE TABLE IF NOT EXISTS issue_list (

            `issue_id` INTEGER PRIMARY KEY AUTO_INCREMENT,

            `title` TEXT NOT NULL,

            `description` TEXT NOT NULL,

            `department_id` INTEGER NOT NULL,

            `user_id` INTEGER NOT NULL,

            `status` INTEGER NOT NULL DEFAULT 0,

            `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

            `date_updated` TIMESTAMP NULL

        );
INSERT INTO issue_list (issue_id, title, description, department_id, user_id, status, date_created, date_updated) VALUES (1, 'Sample Issue', 'This is only a sample issue.', 2, 4, 1, '2021-09-11 07:24:13', '2023-01-31 09:34:14');
INSERT INTO issue_list (issue_id, title, description, department_id, user_id, status, date_created, date_updated) VALUES (4, 'Database Connection Failed', 'I have tried so many times to figure but i cant solve the error ', 1, 4, 1, '2023-01-31 09:33:51', '2023-01-31 09:34:14');

-- Table: user_list
CREATE TABLE IF NOT EXISTS user_list (

            `user_id` INTEGER PRIMARY KEY AUTO_INCREMENT,

            `fullname` TEXT NOT NULL,

            `email` TEXT NOT NULL,

            `contact` TEXT NOT NULL,

            `username` TEXT NOT NULL,

            `password` TEXT NOT NULL,

            `department_id` INTEGER,

            `type` INTEGER,

            `designation` TEXT NOT NULL,

            `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP

        );
INSERT INTO user_list (user_id, fullname, email, contact, username, password, department_id, type, designation, date_created) VALUES (2, 'Adminganesh', 'admin@gmail.com', '6478809012', 'issueadmin', '21232f297a57a5a743894a0e4a801fc3', 1, 1, 'System Administrator', '2021-09-11 05:40:48');
INSERT INTO user_list (user_id, fullname, email, contact, username, password, department_id, type, designation, date_created) VALUES (4, 'Madhavan', 'maddy@gmail.com', '6547484841', 'maddy', '2d235ace000a3ad85f590e321c89bb99', 1, 2, 'Programmer', '2021-09-11 06:38:39');

-- Trigger: updatedTime
CREATE TRIGGER IF NOT EXISTS updatedTime AFTER UPDATE on `issue_list`

        BEGIN

            UPDATE `issue_list` SET date_updated = CURRENT_TIMESTAMP where issue_id = issue_id;

        END;

COMMIT TRANSACTION;
-- PRAGMA foreign_keys = on;
