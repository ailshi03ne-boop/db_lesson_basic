Q1
CREATE TABLE departments (department_id INT UNSIGNED AUTO_INCREMENT 
PRIMARY KEY,name VARCHAR(20) 
NOT NULL,created_at 
TIMESTAMP DEFAULT CURRENT_TIMESTAMP,updated_at 
TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE departments
MODIFY updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

Q2
ALTER TABLE people 
ADD department_id 
INT UNSIGNED 
AFTER email;

Q3
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name,email,department_id,age,gender)
VALUES
('神里あやか','kamisato@gizumo.jp',1,52,2),
('長野原よいみや','naganohara@gizumo.jp',1,54,2),
('雷電えい','raiden@gizumo.co.jp',1,50,2),
('八重みこ','yae@gizumo.jp',2,51,2),
('九条さら','kujo@gizumo.jp',2,52,2),
('珊瑚宮ここみ','sangonomiya@gizumo.jp',2,61,2),
('鹿野院へいぞう','shikanoin@gizumo.jp',2,28,1),
('久岐しのぶ','kuki@gizumo.jp',3,22,2),
('荒瀧いっと','arataki@gizumo.jp',4,32,1),
('夢見月みずき','yumemizuki@gizumo.jp',5,54,2);

INSERT INTO reports (person_id,content)
VALUES
(7,'日報登録2026年1月22日'),
(8,'今日は会社の情報修正をした'),
(9,'今日は浜田に新人研修を行った'),
(10,'今日はフジテレビまで出張にいった'),
(11,'今日はテレ朝で仕事をし、12時までに終わらせた'),
(12,'今日は病院で健康診断をした'),
(13,'今日は岩槻でソフトボールした'),
(14,'今日は埼玉スタジアムで、スポーツ観戦した'),
(15,'今日はスタジオでリハーサルをした'),
(16,'今日は渋谷で説明会をした');

Q4
UPDATE people 
SET department_id = 2 
WHERE department_id 
IS NULL;

Q5
SELECT name,age 
FROM people 
WHERE gender = 1 
ORDER BY age DESC;

Q6
テーブル名peopleより
レコード名`department_id` = 1(営業)の
カラム名name,email,ageを
作製された順に表示します。

Q7
SELECT name 
FROM people 
WHERE age 
between 20 AND 29 AND gender = 2
UNION
SELECT name 
FROM people 
WHERE age 
between 40 AND 49 AND gender = 1;

Q8
SELECT name 
FROM people 
WHERE department_id = 1 
ORDER BY age ASC;

Q9
SELECT AVG(age) 
AS average_age 
FROM people 
WHERE department_id = 2 
AND gender = 2;

Q10
SELECT people.name,departments.name,reports.content 
FROM people
INNER JOIN departments
ON people.department_id = departments.department_id
INNER JOIN reports
ON people.person_id = reports.person_id;

Q11
SELECT name 
FROM people
LEFT OUTER JOIN reports
ON people.person_id = reports.person_id
WHERE reports.content IS NULL;