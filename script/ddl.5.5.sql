CREATE DATABASE sseip
  CHAR SET utf8
  COLLATE utf8_general_ci;

GRANT ALL ON sseip.* TO wa@localhost;

USE sseip;

CREATE TABLE `group` (
  id          INT PRIMARY KEY AUTO_INCREMENT,
  name        VARCHAR(128),
  description TEXT(512)
)
  ENGINE innodb;

CREATE TABLE user (
  id        INT PRIMARY KEY AUTO_INCREMENT,
  username  CHAR(64)  NOT NULL UNIQUE,
  password  CHAR(128) NOT NULL,
  real_name VARCHAR(64),
  age       INT(3),
  id_number CHAR(20),
  address   TEXT(512),
  phone     DECIMAL(32),
  added     DATETIME,
  role      INT,
  group_id  INT,
  CONSTRAINT fk_user_group_id_group_id FOREIGN KEY (group_id) REFERENCES `group` (id)
    ON DELETE SET NULL
)
  ENGINE innodb;

/*CREATE TABLE customer (
  id                INT PRIMARY KEY AUTO_INCREMENT,
  name              VARCHAR(128),
  sex               TINYINT(1),
  age               INT,
  address           TEXT,
  symptom           TEXT,
  email             VARCHAR(254),
  tel               VARCHAR(32),
  website           SMALLINT,
  disease_type      SMALLINT,
  access_point_type SMALLINT,
  faraway           TINYINT(1)      DEFAULT FALSE,
  emergency         TINYINT(1)      DEFAULT FALSE,
  added             DATETIME        DEFAULT current_timestamp,
  user_id           INT,
  owner_user_id     INT,
  group_id          INT,
  CONSTRAINT fk_customer_user_id_user_id FOREIGN KEY (user_id) REFERENCES user (id),
  CONSTRAINT fk_customer_owner_user_id_user_id FOREIGN KEY (owner_user_id) REFERENCES user (id),
  CONSTRAINT fk_customer_group_id_group_id FOREIGN KEY (group_id) REFERENCES `group` (id),
  INDEX idx_customer_added (added)
);
*/

USE sseip;
DROP TABLE IF EXISTS country;
CREATE TABLE country (
  id      INT PRIMARY KEY AUTO_INCREMENT,
  `name`  VARCHAR(64),
  memo    TEXT(512),
  updated DATETIME,
  a2_code CHAR(4)
)
  ENGINE innodb;

CREATE TABLE website (
  id   INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(64),
  url  VARCHAR(128)
)
  ENGINE innodb;

CREATE TABLE disease_type (
  id     INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(64)
)
  ENGINE innodb;

/*CREATE TABLE access_point_type (
  id     INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(16)
);
*/
CREATE TABLE user_role (
  id      INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  role    INT,
  CONSTRAINT fk_user_role_user_id_user_id FOREIGN KEY (user_id) REFERENCES user (id)
)
  ENGINE innodb;

CREATE TABLE user_logon (
  id            INT PRIMARY KEY AUTO_INCREMENT,
  user_id       INT,
  last_sign_in  DATETIME,
  last_mac_addr VARCHAR(6),
  last_ip       VARCHAR(39),
  CONSTRAINT fk_user_logon_user_id_user_id FOREIGN KEY (user_id) REFERENCES user (id)
    ON DELETE CASCADE
)
  ENGINE innodb;

DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
  id                 INT PRIMARY KEY AUTO_INCREMENT,
  sex                TINYINT(1),
  age                INT,

  liaison_name       VARCHAR(128),
  liaison_address    VARCHAR(128),
  relationship       VARCHAR(128),

  patient_name       VARCHAR(128),
  patient_address    VARCHAR(128),
  symptom            TEXT,
  hospitalization    TINYINT(1),

  emergency          TINYINT(1)      DEFAULT FALSE,
  email              VARCHAR(254),
  tel                VARCHAR(32),

  liaison_country_id INT,
  patient_country_id INT,
  disease_type_id    INT,
  website_id         INT,

  added              DATETIME,
  updated            DATETIME,

  memo               TEXT,
  contact_records    TEXT,

  discard            TINYINT(1)      DEFAULT FALSE,

  stars              TINYINT(1),
  valid              TINYINT(1),
  user_id            INT,
  owner_user_id      INT,
  group_id           INT,

  if_report          TINYINT(1),
  source_website     VARCHAR(2000),

  CONSTRAINT fk_customer_liaison_country_id_country_id FOREIGN KEY (liaison_country_id) REFERENCES country (id)
    ON DELETE SET NULL,
  CONSTRAINT fk_customer_patient_country_id_country_id FOREIGN KEY (patient_country_id) REFERENCES country (id)
    ON DELETE SET NULL,
  CONSTRAINT fk_customer_website_id_website_id FOREIGN KEY (website_id) REFERENCES website (id)
    ON DELETE SET NULL,
  CONSTRAINT fk_customer_user_id_user_id FOREIGN KEY (user_id) REFERENCES user (id)
    ON DELETE SET NULL,
  CONSTRAINT fk_customer_owner_user_id_user_id FOREIGN KEY (owner_user_id) REFERENCES user (id)
    ON DELETE SET NULL,
  CONSTRAINT fk_customer_group_id_group_id FOREIGN KEY (group_id) REFERENCES `group` (id)
    ON DELETE SET NULL
)
  ENGINE innodb;

TRUNCATE customer;

