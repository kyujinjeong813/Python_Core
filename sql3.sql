INSERT INTO student VALUES(20120001, '고길동', 'm', 27, '선박', 'seoul', '010-000-4512', 5000),
(20120002, '최둘리', 'm', 22, '역사', 'busan', '010-999-9999', 4500),
(20120003, '도우너', 'w', 15, '역사', 'daegu', '010-555-5555', 6500),
(20120004, '김만덕', 'w', 15, '유아', 'mokpo', '010-555-7777', 7000),
(20120005, '류현진', 'm', 22, '컴퓨터공학', 'seoul', '010-122-2222', 8000),
(20120006, '손흥민', 'm', 22, '컴퓨터공학', 'seoul', '010-999-9999', 8000);

# 직업별로 급여의 합계를 내시오
SELECT major, SUM(money) FROM student GROUP BY major;
# 전체 인원수를 세시오
SELECT COUNT(*) FROM student;
# 최씨로 시작하는 사람 출력
SELECT * FROM student WHERE NAME LIKE '최%';
# 서울이 주소이고 고씨인 사람 출력
SELECT * FROM student WHERE addr like 'seoul'AND NAME LIKE '고%';
# 함수 이용
SELECT COUNT(*) "전체행수", COUNT(money) "급여건수", MAX(money) "최대급여",
MIN(money) 최소급여, ROUND(AVG(money),2) 평균급여 FROM student;

SELECT COUNT(*) , COUNT(money) , MAX(money) ,
MIN(money) , ROUND(AVG(money),2) FROM student;


select MAX(money) - MIN(money) AS 급여구간 FROM student;
# money 에 대하여 min-max 정규화를 실행하시오
# 그룹 함수이기 때문에 그룹값을 상수화해야 정상적으로 계산됨 (그래서 아래꺼는 틀림)
SELECT (money - MIN(money)) / (MAX(money) - MIN(money)) AS 정규화 FROM student;

# 프로그램으로 변경 (사용자변수 @, 시스템변수 @@)
SELECT MIN(money) INTO @minvalue FROM student; SELECT @minvalue;
SELECT Max(money) - min(money) INTO @rangevalue FROM student; SELECT @rangevalue;
SELECT (money-@minvalue)/@rangevalue AS 정규화값 FROM student;

INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES("충주여자고등학교", "충주시", "CH00000001", 300);
INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES("신성여자고등학교", "제주시", "IC00000001", 560);
INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES("종로여자고등학교", "종로구", "JR00000001", 300);
INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES("제주여자고등학교", "제주시", "SE00000001", 300);

INSERT INTO student(NAME, kor, mat, eng, schoolcode) VALUES("전공인", 81, 81, 81, "SE00000001"),
("전공이", 81, 81, 81, "SE00000001"),
("전공삼", 81, 81, 81, "CH00000001"),
("전공사", 91, 100, 100, "CH00000001"),
("고려인", 100, 100, 100, "CH00000001"),
("종로구", 100, 81, 81, "IC00000001"),
("김만덕", 100, 81, 71, "IC00000001");

SELECT * FROM school;
SELECT * FROM student;
SELECT * FROM school WHERE schoolcode = 'CH00000001';
SELECT * from student where NAME='고려인';
SELECT NAME, kor, eng, mat FROM student WHERE NAME = '전공인';
SELECT NAME AS '이름', kor AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME = '전공이';

# 서브 쿼리 
SELECT NAME, kor, mat, eng FROM student WHERE schoolcode
	IN (SELECT schoolcode FROM school WHERE schoolname = '신성여자고등학교');
	
SELECT NAME, kor, mat, eng FROM student WHERE NAME LIKE '전공%';
SELECT NAME, kor, mat, eng FROM student WHERE NAME LIKE '%공%';
SELECT NAME, kor, mat, eng FROM student WHERE NAME LIKE '_려_';

SELECT * FROM student WHERE kor>90 AND mat>90 AND eng>90;
SELECT * FROM student WHERE kor>90 OR mat>90 OR eng>90;
SELECT * FROM student WHERE kor>80 AND kor<90;
SELECT * FROM student WHERE kor BETWEEN 80 AND 100;

# group by, having, order by, limit
SELECT * FROM student LIMIT 1;

SELECT * FROM student ORDER BY NAME DESC; # descending 내림차순
SELECT * FROM student ORDER BY NAME ASC; # ascending 오름차순

SELECT sc.schoolname, sc.schoolcode, st.name, st.average FROM student st INNER JOIN school sc # 두개의 조건이 만족
ON st.schoolcode = sc.schoolcode;

# outer >> left / right / (full)

SELECT NAME AS '이름', kor AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME = '전공이';
SELECT CONCAT(NAME,'님') AS '이름', kor AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME = '전공인';
SELECT CONCAT(NAME,'님') AS '이름', LPAD(kor, 10, '*') AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME='전공삼';
SELECT REPLACE(CONCAT(NAME,'님'), '님', '형') AS '이름', LPAD(kor, 10, '*') AS '국어', mat AS '수학', eng AS '영어'
	FROM student WHERE NAME='전공삼';
SELECT SUBSTR(REPLACE(CONCAT(NAME,'님'),'님','형'),1,2) AS '이름', LPAD(kor, 10, '*') AS '국어', mat AS '수학', eng AS '영어'
	FROM student WHERE NAME='전공삼';
SELECT LENGTH(SUBSTR(REPLACE(CONCAT(NAME, '님'),'님','형'),1,2)) AS '이름', LPAD(kor, 10, '*') AS '국어', mat AS '수학', eng AS '영어'
	FROM student WHERE NAME = '전공이';

# 문제
-- 전공인의 국어 : 80, 영어 : 90 으로 변경하고 합계와 평균 그리고 grade를 수정 (계산을 수동으로 하고, 변화만 적용하시오)
UPDATE student SET kor = 80, eng = 90, total = 215, average = 83.67, grade = 'B' WHERE NAME = '전공인';
# insert trigger 만 있어서 따로 계산을 해줘야함 (challenge! update trigger)
UPDATE student SET kor = 80, eng = 90 WHERE NAME = '전공인';
UPDATE student SET total = 90+80+90, average = ROUND((90+80+90)/3,2), grade = 'B' WHERE NAME = '전공인';

UPDATE student SET total=kor+mat+eng, average = ROUND((kor+mat+eng)/3,2),
	grade =
	(case when (average >= 90) then 'A'
	when (average >= 80) then 'B'
	when (average >= 70) then 'C'
	when (average >= 60) then 'D'
	ELSE 'F'
	END)
	WHERE NAME = '전공인';

SELECT * FROM student;
-- student 중 kor, mat 점수만 출력하시오
SELECT kor, mat FROM student;
-- student 중 average 가 90이상인 사람의 name, schoolname 을 출력하시오
SELECT st.name, sc.schoolname FROM student st inner join school sc on st.average >= 90 and st.schoolcode = sc.schoolcode;
-- student 중 eng 점수를 출력하되 그 이름을 '영어'로 하시오
SELECT NAME, eng AS '영어' FROM student;
-- 이름 가운데 자가 '공'인 사람을 모두 출력하시오
SELECT * FROM student WHERE NAME LIKE '%공%';
-- 학교 이름이 충주 여자 고등학교인 사람의 name 과 total을 출력하시오
SELECT st.name, st.total FROM student st INNER JOIN school sc ON sc.schoolcode = st.schoolcode AND sc.schoolname='충주여자고등학교';
SELECT st.name, st.total FROM student st INNER JOIN school sc ON sc.schoolname='충주여자고등학교' AND sc.schoolcode = st.schoolcode;
-- student 에서 total을 이용하여 정렬하고 상위 2사람만 출력하시오
SELECT * FROM student ORDER BY total DESC LIMIT 2;

# 순서 : where, group by, having, order by, limit
# join은 from절에 오는거! (위 순서랑 상관없음)

# 저장루틴
# 저장 프로시져 연습 (서버 측에서 테스트하는 것 call)
CALL student_select();
CALL student_insert('제주도', 100, 100, 100, 'IC00000001', @res);
SELECT @res;

# 문제
# 이름을 변경하는 프로시져를 작성하시오
CALL student_name_change('제주도', '김제주', @res);
SELECT @res;
CALL student_select();

CALL student_updatename(' ', '팔전공', @res);
SELECT @res;
CALL student_select();

CALL student_updatename('전공삼', '팔전공', @res);
SELECT @res;
CALL student_select();

CALL student_sum();

CALL student_updateone();
CALL student_select();