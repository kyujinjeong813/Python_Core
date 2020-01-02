-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.11-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- jeju 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jeju` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jeju`;

-- 테이블 jeju.authors 구조 내보내기
CREATE TABLE IF NOT EXISTS `authors` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `test` int(11) DEFAULT NULL,
  `test2` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.authors:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` (`name`, `address`, `test`, `test2`) VALUES
	('대한민국', '서울시', NULL, NULL),
	('민국이', '대전시', NULL, NULL);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;

-- 테이블 jeju.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `code` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `su` int(11) DEFAULT NULL,
  `dan` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='primary key : 중복이 불가능, 외부에서 참조가 가능한 키';

-- 테이블 데이터 jeju.goods:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`code`, `name`, `su`, `dan`) VALUES
	(1, '냉장고', 2, 850000),
	(2, '세탁기', 3, 550000),
	(3, '전자레인지', 2, 350000),
	(4, 'HDTV', 3, 1500000),
	(5, 'VR기기', 2, 1440000),
	(6, 'Drone', 1, 890000),
	(7, '고성능컴퓨터', 3, NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 jeju.purchase 구조 내보내기
CREATE TABLE IF NOT EXISTS `purchase` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `userID` char(3) DEFAULT NULL,
  `prodName` varchar(20) DEFAULT NULL,
  `groupName` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.purchase:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES
	(1, 'KBS', '운동화', '전자', 30, 2),
	(2, 'KBS', '노트북', '전자', 1000, 1),
	(3, 'JYP', '모니터', '전자', 200, 1),
	(4, 'BBK', '모니터', '전자', 200, 5),
	(5, 'KBS', '청바지', '의류', 50, 3),
	(6, 'BBK', '메모리', '전자', 80, 10),
	(7, 'SSK', '책', '서적', 15, 5),
	(8, 'EJW', '책', '서적', 15, 2),
	(9, 'EJW', '청바지', '의류', 50, 1),
	(10, 'BBK', '운동화', '전자', 30, 2),
	(11, 'EJW', '책', '서적', 15, 1),
	(12, 'BBK', '운동화', '서적', 30, 2);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;

-- 테이블 jeju.school 구조 내보내기
CREATE TABLE IF NOT EXISTS `school` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `schoolname` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `schoolcode` char(10) NOT NULL,
  `studentcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`schoolcode`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='varchar : 가변적\r\nchar : (10) 자리로 고정\r\nkey : 중복을 불허함\r\nauto_increment : 입력하지 않고 자동으로 입력됨';

-- 테이블 데이터 jeju.school:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`no`, `schoolname`, `address`, `schoolcode`, `studentcount`) VALUES
	(1, '충주여자고등학교', '충주시', 'CH00000001', 300),
	(2, '신성여자고등학교', '제주시', 'IC00000001', 560),
	(3, '종로여자고등학교', '종로구', 'JR00000001', 300),
	(4, '제주여자고등학교', '제주시', 'SE00000001', 300);
/*!40000 ALTER TABLE `school` ENABLE KEYS */;

-- 테이블 jeju.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `bunho` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `kor` tinyint(4) DEFAULT NULL,
  `mat` tinyint(4) DEFAULT NULL,
  `eng` tinyint(4) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL,
  `grade` char(2) DEFAULT NULL,
  `schoolcode` char(10) DEFAULT NULL,
  PRIMARY KEY (`bunho`),
  KEY `schoolcode` (`schoolcode`),
  CONSTRAINT `FK__school` FOREIGN KEY (`schoolcode`) REFERENCES `school` (`schoolcode`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.student:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`bunho`, `name`, `kor`, `mat`, `eng`, `total`, `average`, `grade`, `schoolcode`) VALUES
	(1, '전공인', 82, 83, 92, 257, 85.67, 'B', 'SE00000001'),
	(2, '전공이', 83, 83, 83, 249, 83, 'B', 'SE00000001'),
	(3, '팔전공', 83, 83, 83, 249, 83, 'B', 'CH00000001'),
	(4, '전공사', 93, 102, 102, 297, 99, 'A', 'CH00000001'),
	(5, '고려인', 102, 102, 102, 306, 102, 'A', 'CH00000001'),
	(6, '종로구', 102, 83, 83, 268, 89.33, 'B', 'IC00000001'),
	(7, '김만덕', 102, 83, 73, 258, 86, 'B', 'IC00000001'),
	(8, '김제주', 102, 102, 102, 306, 102, 'A', 'IC00000001');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- 테이블 jeju.student2 구조 내보내기
CREATE TABLE IF NOT EXISTS `student2` (
  `num` int(11) NOT NULL,
  `name` varchar(12) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `addr` varchar(15) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='20120001, ''고길동'', ''m'', 27, ''선박'', ''seoul'', ''010-0000-4152'', 5000\r\n원래 전공/직업은 code화해야 함! (ex. 역사 2, 선박 1, ...)';

-- 테이블 데이터 jeju.student2:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student2` DISABLE KEYS */;
INSERT INTO `student2` (`num`, `name`, `sex`, `age`, `major`, `addr`, `tel`, `money`) VALUES
	(20120001, '고길동', 'm', 27, '선박', 'seoul', '010-000-4512', 5000),
	(20120002, '최둘리', 'm', 22, '역사', 'busan', '010-999-9999', 4500),
	(20120003, '도우너', 'w', 15, '역사', 'daegu', '010-555-5555', 6500),
	(20120004, '김만덕', 'w', 15, '역사', 'mokpo', '010-555-7777', 7000),
	(20120005, '류현진', 'm', 22, '컴퓨터공학', 'seoul', '010-122-2222', 8000),
	(20120006, '손흥민', 'm', 22, '컴퓨터공학', 'seoul', '010-999-9999', 8000);
/*!40000 ALTER TABLE `student2` ENABLE KEYS */;

-- 테이블 jeju.students 구조 내보내기
CREATE TABLE IF NOT EXISTS `students` (
  `name` varchar(50) DEFAULT NULL,
  `kor` int(11) DEFAULT NULL,
  `eng` int(11) DEFAULT NULL,
  `math` int(11) DEFAULT NULL,
  `tot` int(11) DEFAULT NULL,
  `avg` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.students:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`name`, `kor`, `eng`, `math`, `tot`, `avg`) VALUES
	('대한이', 90, 90, 90, NULL, NULL),
	('민국이', 80, 80, 81, NULL, NULL),
	('만세', 100, 100, 100, NULL, NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;

-- 프로시저 jeju.student_insert 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_insert`(
	IN `name` VARCHAR(50),
	IN `kor` INT,
	IN `mat` INT,
	IN `eng` INT,
	IN `schoolcode` CHAR(10),
	OUT `result` INT
)
BEGIN
	DECLARE exit handler for SQLEXCEPTION
	BEGIN
	 ROLLBACK;
	 SET RESULT = -1;
	END;
	START TRANSACTION;
	 INSERT INTO student(name, kor, mat, eng, schoolcode)
	 VALUE(name, kor, mat, eng, schoolcode);
	COMMIT;
	SET RESULT = 0;
END//
DELIMITER ;

-- 프로시저 jeju.student_select 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_select`()
BEGIN
	SELECT * FROM STUDENT;
END//
DELIMITER ;

-- 프로시저 jeju.student_sum 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_sum`()
BEGIN
	DROP TABLE IF EXISTS sungjuk_hab;
	CREATE TABLE sungjuk_hab(korhab float, mathab float, enghab float) as
		select sum(kor) as korhab, sum(mat) as mathab, sum(eng) as enghab from student;
	insert into sungjuk_hab(korhab, mathab, enghab)
		select round(avg(kor),2), round(avg(mat),2), round(avg(eng),2) from student;
	select * from sungjuk_hab;
END//
DELIMITER ;

-- 프로시저 jeju.student_updatename 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_updatename`(
	IN `oldname` VARCHAR(20),
	IN `newname` VARCHAR(20),
	OUT `result` INT




)
BEGIN
	DECLARE cnt int default 0;
	select count(*) into cnt from student where name = oldname;
	
	if cnt > 0 then
		update student set name = newname where name = oldname;
		set result := 0;
			
	else set result := -1;
	end if;
END//
DELIMITER ;

-- 프로시저 jeju.student_updateone 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_updateone`()
BEGIN
	# 모든 데이터에 1점씩 추가 ㅇ_ㅇ!
	DECLARE _done INT DEFAULT FALSE; # 무한루프의 종료조건
	DECLARE name_var VARCHAR(20); # 하나의 데이터를 처리하기 위한 변수
	DECLARE kor_var INT;
	DECLARE mat_var INT;
	DECLARE eng_var INT;
	# cursor : 데이터를 가리키는 위치
	DECLARE CURSOR_STUDENT CURSOR FOR SELECT name, kor, mat, eng FROM student;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET _done = TRUE;
	OPEN CURSOR_STUDENT;
	REPEAT
		FETCH CURSOR_STUDENT INTO name_var, kor_var, mat_var, eng_var;
		IF NOT _done THEN # 거짓을 부정 (=참)
			UPDATE student SET kor = kor_var+1, mat = mat_var+1, eng = eng_var+1 WHERE name = name_var;
			SET _done = FALSE;
		END IF;
	UNTIL _done
	END REPEAT;
	CLOSE CURSOR_STUDENT; 
END//
DELIMITER ;

-- 테이블 jeju.sungjuk_hab 구조 내보내기
CREATE TABLE IF NOT EXISTS `sungjuk_hab` (
  `korhab` float DEFAULT NULL,
  `mathab` float DEFAULT NULL,
  `enghab` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.sungjuk_hab:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sungjuk_hab` DISABLE KEYS */;
INSERT INTO `sungjuk_hab` (`korhab`, `mathab`, `enghab`) VALUES
	(733, 705, 704),
	(91.63, 88.13, 88);
/*!40000 ALTER TABLE `sungjuk_hab` ENABLE KEYS */;

-- 테이블 jeju.userinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `userinfo` (
  `userID` char(3) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `addr` varchar(20) DEFAULT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(8) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `mDate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.userinfo:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` (`userID`, `name`, `birthYear`, `addr`, `mobile1`, `mobile2`, `height`, `mDate`) VALUES
	('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2003'),
	('EJW', '은지원', 1972, '경북', '011', '88888888', 176, '2008'),
	('JKW', '조관우', 1965, '경기', '018', '99999999', 176, '1990'),
	('JYP', '조용필', 1950, '경기', '011', '44444444', 176, '2001'),
	('KBS', '김범수', 1979, '경남', '011', '22222222', 176, '2004'),
	('KKH', '김경호', 1971, '전남', '019', '33333333', 176, '1993'),
	('LJB', '임재범', 1963, '서울', '016', '66666666', 176, '1991'),
	('LSG', '이승기', 1989, '서울', '011', '11111111', 176, '1992'),
	('SSK', '성시경', 1979, '서울', NULL, NULL, 186, '1989'),
	('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '1995');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;

-- 트리거 jeju.student_before_insert 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_insert` BEFORE INSERT ON `student` FOR EACH ROW BEGIN -- OLD : 입력된 값, NEW 새롭게 만들어질 데이터
	SET NEW.total = NEW.kor + NEW.mat + NEW.eng;
	SET NEW.average = round(NEW.total/3,2);
	
	IF NEW.average >= 90 THEN SET NEW.grade='A';
	ELSEIF NEW.average >= 80 THEN SET NEW.grade='B';
	ELSEIF NEW.average >= 70 THEN SET NEW.grade='C';
	ELSEIF NEW.average >= 60 THEN SET NEW.grade='D';
	ELSE SET NEW.grade='F';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 jeju.student_before_update 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_update` BEFORE UPDATE ON `student` FOR EACH ROW BEGIN
	SET NEW.total = NEW.kor + NEW.mat + NEW.eng;
	SET NEW.average = round(NEW.total/3,2);
	
	IF NEW.average >= 90 THEN SET NEW.grade='A';
	ELSEIF NEW.average >= 80 THEN SET NEW.grade='B';
	ELSEIF NEW.average >= 70 THEN SET NEW.grade='C';
	ELSEIF NEW.average >= 60 THEN SET NEW.grade='D';
	ELSE SET NEW.grade='F';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
