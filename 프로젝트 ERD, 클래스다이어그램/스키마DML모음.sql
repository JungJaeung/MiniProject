use airline_02;


INSERT INTO USER(FIRST_NAME, LAST_NAME, FULL_NAME, PASSWORD, PHONE, EMAIL, ADDRESS, GENDER, USER_ROLE)
 VALUES('FIRSTNAME', 'LASTNAME', '관리자', '1234', '전화번호', '이메일', '주소', '성', '관리');
 
SELECT * FROM USER;

CREATE TABLE USER(
	USER_ID INT auto_increment default 1,
    LAST_NAME VARCHAR(45) NOT NULL,
    FIRST_NAME VARCHAR(45) NOT NULL,
    FULL_NAME VARCHAR(45),
    PASSUSER_IDWORD VARCHAR(45) NOT NULL,
    PHONE VARCHAR(45),
    EMAIL VARCHAR(45),
    ADDRESS VARCHAR(45),
    BIRTHDATE DATETIME,
    GENDER VARCHAR(45),
    USER_ROLE VARCHAR(45),
    primary key(USER_ID)
);

-- 제약 조건 제거 후 다시 제약조건 생성
ALTER TABLE airline_02.user MODIFY COLUMN USER_ID int auto_increment;

ALTER TABLE board drop constraint fk_board_user;
ALTER TABLE BOARD add CONSTRAINT fk_board_user foreign key(user_id) references user (user_id);
alter table reservation add constraint fk_reservation_user foreign key(user_id) references user (user_id);

DROP TABLE user;