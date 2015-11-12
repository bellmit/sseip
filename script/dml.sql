INSERT INTO country (name, a2_code) VALUE (#{name}, #{a2Code});
INSERT INTO country (name, a2_code) VALUE ('abc', 'abc');

DROP TABLE country;

UPDATE country
SET name = #{name}, a2_code = #{a2Code}
WHERE id = #{id};

SELECT
  id,
  `name`,
  a2_code
FROM country
WHERE id = 1;

SELECT
  id,
  `name`,
  a2_code
FROM country
ORDER BY name DESC
LIMIT #{offset}, #{size};

ALTER TABLE customer MODIFY COLUMN source_website VARCHAR(2000);

ALTER TABLE customer MODIFY COLUMN contact_records LONGTEXT;

ALTER TABLE customer ADD COLUMN revisit_date DATETIME;

ALTER TABLE customer MODIFY COLUMN revisit_date DATE;

