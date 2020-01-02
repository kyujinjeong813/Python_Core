INSERT INTO goods values(1,"냉장고", 2, 850000);
INSERT INTO goods VALUES(2,"세탁기", 3, 550000);
INSERT INTO goods VALUES(3,"전자레인지", 2, 350000);
INSERT INTO goods VALUES(4,"HDTV", 3, 1500000);

# name = not null
#INSERT INTO goods(CODE, su, dan) VALUES(4,3, 1500000);
# primary key = code (기본값이 0이라서 하나는 들어가고, 그담부터 안들어감)
#INSERT INTO goods(NAME, su, dan) VALUES('py',3,1500000);

SELECT * FROM goods;
INSERT INTO goods(CODE, NAME, su) VALUES(5, '드론',1);
UPDATE goods SET dan = 1000000 WHERE CODE = 5; # 중복없이 데이터 입력
DELETE FROM goods WHERE CODE = 5;
INSERT INTO goods VALUES(5, 'VR기기', 2, 1440000);
INSERT INTO goods VALUES(6, 'Drone', 1, 890000);
INSERT INTO goods(CODE, NAME, su) VALUES(7, '고성능컴퓨터',3);
SELECT * FROM goods;

# 이름이 냉장고이고 단가가 75000이상인 데이터 출력
SELECT * FROM goods WHERE NAME = '냉장고' AND dan >= 75000;
# 단가가 75000 이하인 제품 출력
SELECT * FROM goods WHERE dan <= 75000;
# 단가가 50000 이상이고 1200000 이하인 제품 출력
SELECT * FROM goods WHERE dan >= 50000 AND dan <= 1200000;
# 판매수량이 3개 이상인 제품명과 단가의 출력
SELECT NAME, dan FROM goods WHERE su >= 3;

