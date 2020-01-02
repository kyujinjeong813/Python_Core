CREATE TABLE `authors` (
	`NAME` VARCHAR(50) NULL DEFAULT NULL,
	`address` VARCHAR(50) NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

# CRUD (insert into, select, update, delete) 문 사용
INSERT INTO `authors`(`NAME`, `address`) VALUES("대한이", "서울시");
INSERT INTO `authors`(`NAME`, `address`) VALUES("민국이", "대전시");
INSERT INTO `authors`(`NAME`, `address`) VALUES("만세", "충주시");

# 데이터베이스(외부 접속 단위), 테이블, 필드, 레코드
# * : 모두 다
# 명령어는 대소문자 구분하지 않고, " " 안에 있는 것만 대소문자 구분
SELECT * FROM authors;
SELECT * FROM authors WHERE NAME="대한이";
SELECT address FROM authors WHERE NAME="만세";

# update set
UPDATE AUTHORS SET NAME="대한민국" WHERE NAME = "대한이";

DELETE FROM AUTHORS WHERE NAME="만세";

# 문제 : 3인분의 성적을 students 테이블에 입력하고 출력해보시오
# 이름, 국어, 영어, 수학, 총점, 평균
studentsCREATE TABLE `students` (
	name VARCHAR(50) NULL DEFAULT NULL,
	kor INT(11) NULL DEFAULT NULL,
	eng INT(11) NULL DEFAULT NULL,
	math INT(11) NULL DEFAULT NULL,
	tot INT(11) NULL DEFAULT NULL,
	avg FLOAT NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
INSERT INTO students(name, kor, eng, math) VALUES("대한이", 90, 90, 90);
INSERT INTO students(name, kor, eng, math) VALUES("민국이", 80, 80, 81);
INSERT INTO students(name, kor, eng, math) VALUES("만세", 100, 100, 100);
SELECT SUM(kor, authorseng, math) WHERE NAME="대한이";