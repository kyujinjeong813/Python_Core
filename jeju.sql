INSERT INTO userinfo(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, 2013-05-05),
('EJW', '은지원', 1972, '경북', '011', '88888888', 176, 2014-03-03),
('JKW', '조관우', 1965, '경기', '018', '99999999', 176, 2010-10-10),
('JYP', '조용필', 1950, '경기', '011', '44444444', 176, 2009-04-04),
('KBS', '김범수', 1979, '경남', '011', '22222222', 176, 2012-04-04),
('KKH', '김경호', 1971, '전남', '019', '33333333', 176, 2007-07-07),
('LJB', '임재범', 1963, '서울', '016', '66666666', 176, 2009-09-09),
('LSG', '이승기', 1989, '서울', '011', '11111111', 176, 2008-08-08);
INSERT INTO userinfo(userID, name, birthYear, addr, height, mDate) VALUES
('SSK', '성시경', 1979, '서울', 186, 2013-12-12),
('YJS', '윤종신', 1969, '경남', 170, 2005-05-05);


INSERT INTO purchase(userID, prodName, groupName, price, amount)
VALUES('KBS', '운동화', '전자', 30, 2),
('KBS', '노트북', '전자', 1000, 1),
('JYP', '모니터', '전자', 200, 1),
('BBK', '모니터', '전자', 200, 5),
('KBS', '청바지', '의류', 50, 3),
('BBK', '메모리', '전자', 80, 10),
('SSK', '책', '서적', 15, 5),
('EJW', '책', '서적', 15, 2),
('EJW', '청바지', '의류', 50, 1),
('BBK', '운동화', '전자', 30, 2),
('EJW', '책', '서적', 15, 1),
('BBK', '운동화', '서적', 30, 2);

SELECT * FROM purchase;
SELECT * FROM userinfo;


# BBK가 구매한 데이터를 출력하시요 
SELECT * FROM purchase WHERE userID like 'BBK';

# 김씨인 사람 중 이름과 키를 기준으로 이름, 키 주소를 내림차순으로 출력하시요 ( 이름 뒤에는 '님'을 붙여서 출력)
SELECT concat(NAME,'님'), height, addr FROM userinfo WHERE NAME LIKE '김%' ORDER BY NAME, height DESC;


# user를 출생년도별 오름차순으로 이름, 주소, 키, 출생년도를 출력하시요( 이름은 성을 빼고 출력) 
SELECT substr(NAME,2) AS '이름', addr AS '주소', height AS '키', birthYear AS '출생년도'  FROM userinfo ORDER BY birthYear ASC;

# 모바일 번호가 011로 시작하는 사람이 몇명인지 출력하시요 
SELECT COUNT(*) FROM userinfo WHERE mobile1 LIKE '011';

# 출생년도가 1960년에서 1979년까지 태어난 사람들이 구매한 품목을 출력하시요 
SELECT pc.prodName FROM purchase pc INNER JOIN userinfo us on (us.birthYear BETWEEN 1960 AND 1979) AND pc.userID = us.userID;

# UserID별로 구매한 price, amount합계를 출력하시요 ( 이 때 userID는 name으로 출력하시요 )
SELECT us.name, SUM(pc.price) AS 'price합', SUM(pc.amount) AS 'amount합' 
FROM purchase pc INNER JOIN userinfo us on pc.userID = us.userID GROUP BY pc.userID;

# 주소가 서울인 사람이 구매한 총액을 구하시요
SELECT sum(pc.amount*pc.price) AS '구매총액' FROM purchase pc INNER JOIN userinfo us ON us.userID = pc.userID AND us.addr LIKE '서울';
# 계산 잘 되었나 확인 SELECT pc.amount, pc.price FROM purchase pc INNER JOIN userinfo us ON us.userID = pc.userID AND us.addr LIKE '서울';

# 품목별 판매 총액을 출력하시요
SELECT prodName, SUM(price*amount) AS '판매총액'  FROM purchase GROUP BY prodName;

# 출생년도가 1970년도 이상인 사람을 대상으로 구매한 갯수가 2개 이상인 것의 판매 총합계를 구하시요 
SELECT SUM(pc.price*pc.amount) AS '판매총합계' FROM purchase pc INNER JOIN userinfo us ON us.userID = pc.userID AND pc.amount >= 2 AND us.birthYear >= 1970;

# 모든 유저를 출력하시요 (이름 중에 김씨와 조씨는 모두 컬씨로 바꾸어 출력)
SELECT NAME, if (name LIKE '김%', CONCAT('컬',SUBSTR(name,2)), name) AS '바뀐이름' FROM userinfo
# 바뀐이름만 출력
SELECT if (name LIKE '김%' OR name LIKE '조%', CONCAT('컬',SUBSTR(name,2)), name) AS '바뀐이름' FROM userinfo

SELECT case when name LIKE '김%' OR name like '조%' then CONCAT('컬', SUBSTR(name,2))
		ELSE name END name FROM userinfo ;

# 책을 구매한 사람의  이름과 출생년도와 주소를 출력하시요 
SELECT us.name, us.birthYear, us.addr FROM userinfo us INNER JOIN purchase pc ON us.userID = pc.userID AND prodName LIKE '책'
GROUP BY us.name;
# 중복을 제거하기위해서 그룹바이