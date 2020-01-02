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

