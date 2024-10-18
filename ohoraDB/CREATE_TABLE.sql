/* 회원 */
CREATE TABLE SCOTT.O_USER (
	USER_ID NUMBER NOT NULL, /* 회원 ID */
	MEM_ID NUMBER, /* 멤버십 ID */
	AUTH_ID NUMBER, /* 권한 ID */
	USER_LOGIN_ID VARCHAR2(20) NOT NULL, /* 아이디 */
	USER_PASSWORD VARCHAR2(100) NOT NULL, /* 비밀번호 */
	USER_NAME NVARCHAR2(10) NOT NULL, /* 이름 */
	USER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	USER_TEL VARCHAR2(20) NOT NULL, /* 휴대폰 */
	USER_BIRTH DATE NOT NULL, /* 생년월일 */
	USER_POINT NUMBER DEFAULT 0, /* 적립금 */
	USER_SNSAGREE CHAR(1) DEFAULT 'N', /* SNS수신동의 */
	USER_JOINDATE DATE /* 가입일 */
);

COMMENT ON TABLE SCOTT.O_USER IS '회원';

COMMENT ON COLUMN SCOTT.O_USER.USER_ID IS '회원 ID';

COMMENT ON COLUMN SCOTT.O_USER.MEM_ID IS '멤버십 ID';

COMMENT ON COLUMN SCOTT.O_USER.AUTH_ID IS '권한 ID';

COMMENT ON COLUMN SCOTT.O_USER.USER_LOGIN_ID IS '아이디';

COMMENT ON COLUMN SCOTT.O_USER.USER_PASSWORD IS '비밀번호';

COMMENT ON COLUMN SCOTT.O_USER.USER_NAME IS '이름';

COMMENT ON COLUMN SCOTT.O_USER.USER_EMAIL IS '이메일';

COMMENT ON COLUMN SCOTT.O_USER.USER_TEL IS '휴대폰';

COMMENT ON COLUMN SCOTT.O_USER.USER_BIRTH IS '생년월일';

COMMENT ON COLUMN SCOTT.O_USER.USER_POINT IS '적립금';

COMMENT ON COLUMN SCOTT.O_USER.USER_SNSAGREE IS 'SNS수신동의';

COMMENT ON COLUMN SCOTT.O_USER.USER_JOINDATE IS '가입일';

CREATE UNIQUE INDEX SCOTT.PK_O_USER
	ON SCOTT.O_USER (
		USER_ID ASC
	);

CREATE UNIQUE INDEX SCOTT.UIX_O_USER
	ON SCOTT.O_USER (
		USER_LOGIN_ID ASC,
		USER_EMAIL ASC
	);

ALTER TABLE SCOTT.O_USER
	ADD
		CONSTRAINT PK_O_USER
		PRIMARY KEY (
			USER_ID
		);

ALTER TABLE SCOTT.O_USER
	ADD
		CONSTRAINT UK_O_USER
		UNIQUE (
			USER_LOGIN_ID,
			USER_EMAIL
		);

/* 상품 */
CREATE TABLE SCOTT.O_PRODUCT (
	PDT_ID NUMBER NOT NULL, /* 상품 ID */
	CAT_ID NUMBER, /* 카테고리 ID */
	SCAT_ID NUMBER, /* 하위카테고리 ID */
	PDT_NUMBER NUMBER DEFAULT 0, /* 옵션갯수 */
	PDT_NAME NVARCHAR2(50) NOT NULL, /* 상품명 */
	PDT_AMOUNT NUMBER, /* 상품가격 */
	PDT_DISCOUNT_RATE NUMBER DEFAULT 0, /* 할인율 */
	PDT_IMG_URL VARCHAR2(50), /* 이미지경로 */
	PDT_COUNT NUMBER DEFAULT 0 NOT NULL, /* 재고수량 */
	PDT_REVIEW_COUNT NUMBER DEFAULT 0 NOT NULL, /* 리뷰 수 */
	PDT_SALES_COUNT NUMBER DEFAULT 0 NOT NULL, /* 판매 수량 */
	PDT_ADDDATE DATE NOT NULL, /* 상품 등록일 */
	PDT_VIEWCOUNT NUMBER DEFAULT 0 NOT NULL /* 조회수 */
);

COMMENT ON TABLE SCOTT.O_PRODUCT IS '상품';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_ID IS '상품 ID';

COMMENT ON COLUMN SCOTT.O_PRODUCT.CAT_ID IS '카테고리 ID';

COMMENT ON COLUMN SCOTT.O_PRODUCT.SCAT_ID IS '하위카테고리 ID';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_NUMBER IS '옵션갯수';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_NAME IS '상품명';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_AMOUNT IS '상품가격';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_DISCOUNT_RATE IS '할인율';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_IMG_URL IS '이미지경로';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_COUNT IS '재고수량';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_REVIEW_COUNT IS '리뷰 수';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_SALES_COUNT IS '판매 수량';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_ADDDATE IS '상품 등록일';

COMMENT ON COLUMN SCOTT.O_PRODUCT.PDT_VIEWCOUNT IS '조회수';

CREATE UNIQUE INDEX SCOTT.PK_O_PRODUCT
	ON SCOTT.O_PRODUCT (
		PDT_ID ASC
	);

ALTER TABLE SCOTT.O_PRODUCT
	ADD
		CONSTRAINT PK_O_PRODUCT
		PRIMARY KEY (
			PDT_ID
		);

/* 장바구니 */
CREATE TABLE SCOTT.O_CART (
	CART_ID NUMBER NOT NULL, /* 장바구니 ID */
	USER_ID NUMBER /* 회원 ID */
);

COMMENT ON TABLE SCOTT.O_CART IS '장바구니';

COMMENT ON COLUMN SCOTT.O_CART.CART_ID IS '장바구니 ID';

COMMENT ON COLUMN SCOTT.O_CART.USER_ID IS '회원 ID';

CREATE UNIQUE INDEX SCOTT.PK_O_CART
	ON SCOTT.O_CART (
		CART_ID ASC
	);

ALTER TABLE SCOTT.O_CART
	ADD
		CONSTRAINT PK_O_CART
		PRIMARY KEY (
			CART_ID
		);

/* 리뷰 */
CREATE TABLE SCOTT.O_REVIEW (
	REV_ID NUMBER NOT NULL, /* 리뷰 ID */
	USER_ID NUMBER, /* 회원 ID */
	ORD_ID VARCHAR2(30), /* 주문 ID */
	OPDT_ID NUMBER, /* 주문상세 ID */
	REV_CONTENT VARCHAR2(1500) NOT NULL, /* 리뷰 내용 */
	REV_WRITEDATE DATE NOT NULL, /* 리뷰 작성 날짜 */
	REV_RATING NUMBER(1) DEFAULT 5 NOT NULL, /* 별점 */
	REV_GOOD_COUNT NUMBER DEFAULT 0, /* 추천수 */
	REV_BAD_COUNT NUMBER, /* 비추천수 */
	REV_COMMENT_COUNT NUMBER DEFAULT 0, /* 댓글수 */
	REV_ISRECOMMEND CHAR(1) DEFAULT 'N', /* 관리자 추천 리뷰 */
	REV_ISPHOTO CHAR(1) DEFAULT 'N', /* 포토영상 리뷰 */
	REV_AGE_GROUP VARCHAR2(20), /* 연령대 */
	REV_OPTION VARCHAR2(20) /* 구매상품 옵션 */
);

COMMENT ON TABLE SCOTT.O_REVIEW IS '리뷰';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_ID IS '리뷰 ID';

COMMENT ON COLUMN SCOTT.O_REVIEW.USER_ID IS '회원 ID';

COMMENT ON COLUMN SCOTT.O_REVIEW.ORD_ID IS '주문 ID';

COMMENT ON COLUMN SCOTT.O_REVIEW.OPDT_ID IS '주문상세 ID';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_CONTENT IS '리뷰 내용';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_WRITEDATE IS '리뷰 작성 날짜';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_RATING IS '별점';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_GOOD_COUNT IS '추천수';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_BAD_COUNT IS '비추천수';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_COMMENT_COUNT IS '댓글수';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_ISRECOMMEND IS '관리자 추천 리뷰';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_ISPHOTO IS '포토영상 리뷰';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_AGE_GROUP IS '연령대';

COMMENT ON COLUMN SCOTT.O_REVIEW.REV_OPTION IS '구매상품 옵션';

CREATE UNIQUE INDEX SCOTT.PK_O_REVIEW
	ON SCOTT.O_REVIEW (
		REV_ID ASC
	);

ALTER TABLE SCOTT.O_REVIEW
	ADD
		CONSTRAINT PK_O_REVIEW
		PRIMARY KEY (
			REV_ID
		);

/* 결제 */
CREATE TABLE SCOTT.O_PAYMENT (
	PAY_ID NUMBER NOT NULL, /* 결제 ID */
	ORD_ID VARCHAR2(30) NOT NULL, /* 주문 ID */
	USER_ID NUMBER, /* 회원 ID */
	PAY_AMOUNT NUMBER, /* 결제 금액 */
	PAY_DATE DATE, /* 결제일 */
	PAY_OPTION VARCHAR2(30), /* 결제 수단 */
	PAY_STATE VARCHAR2(30), /* 결제 상태 */
	PAY_TRADE_NUMBER VARCHAR2(30) /* 거래 번호 */
);

COMMENT ON TABLE SCOTT.O_PAYMENT IS '결제';

COMMENT ON COLUMN SCOTT.O_PAYMENT.PAY_ID IS '결제 ID';

COMMENT ON COLUMN SCOTT.O_PAYMENT.ORD_ID IS '주문 ID';

COMMENT ON COLUMN SCOTT.O_PAYMENT.USER_ID IS '회원 ID';

COMMENT ON COLUMN SCOTT.O_PAYMENT.PAY_AMOUNT IS '결제 금액';

COMMENT ON COLUMN SCOTT.O_PAYMENT.PAY_DATE IS '결제일';

COMMENT ON COLUMN SCOTT.O_PAYMENT.PAY_OPTION IS '결제 수단';

COMMENT ON COLUMN SCOTT.O_PAYMENT.PAY_STATE IS '결제 상태';

COMMENT ON COLUMN SCOTT.O_PAYMENT.PAY_TRADE_NUMBER IS '거래 번호';

CREATE UNIQUE INDEX SCOTT.PK_O_PAYMENT
	ON SCOTT.O_PAYMENT (
		PAY_ID ASC,
		ORD_ID ASC
	);

CREATE UNIQUE INDEX SCOTT.UIX_O_PAYMENT
	ON SCOTT.O_PAYMENT (
		PAY_TRADE_NUMBER ASC
	);

ALTER TABLE SCOTT.O_PAYMENT
	ADD
		CONSTRAINT PK_O_PAYMENT
		PRIMARY KEY (
			PAY_ID,
			ORD_ID
		);

ALTER TABLE SCOTT.O_PAYMENT
	ADD
		CONSTRAINT UK_O_PAYMENT
		UNIQUE (
			PAY_TRADE_NUMBER
		);

/* 멤버십 */
CREATE TABLE SCOTT.O_MEMBERSHIP (
	MEM_ID NUMBER NOT NULL, /* 멤버십 ID */
	MEM_NAME VARCHAR2(10), /* 멤버십명 */
	MEM_BENEFIT NUMBER, /* 적립 혜택 */
	MEM_GRADE_TIER NUMBER /* 등급 기준 */
);

COMMENT ON TABLE SCOTT.O_MEMBERSHIP IS '멤버십';

COMMENT ON COLUMN SCOTT.O_MEMBERSHIP.MEM_ID IS '멤버십 ID';

COMMENT ON COLUMN SCOTT.O_MEMBERSHIP.MEM_NAME IS '멤버십명';

COMMENT ON COLUMN SCOTT.O_MEMBERSHIP.MEM_BENEFIT IS '적립 혜택';

COMMENT ON COLUMN SCOTT.O_MEMBERSHIP.MEM_GRADE_TIER IS '등급 기준';

CREATE UNIQUE INDEX SCOTT.PK_O_MEMBERSHIP
	ON SCOTT.O_MEMBERSHIP (
		MEM_ID ASC
	);

ALTER TABLE SCOTT.O_MEMBERSHIP
	ADD
		CONSTRAINT PK_O_MEMBERSHIP
		PRIMARY KEY (
			MEM_ID
		);

/* 쿠폰 */
CREATE TABLE SCOTT.O_COUPON (
	CPN_DISCOUNT_RATE NUMBER, /* 할인율 */
	CPN_INFO NVARCHAR2(50), /* 쿠폰 설명 */
	CPN_STARTDATE DATE, /* 쿠폰시작일 */
	CPN_APPLY CHAR(1) DEFAULT 'P', /* 적용대상 */
	CPN_ENDDATE DATE, /* 쿠폰종료일 */
	CPN_MAX_AMOUNT NUMBER, /* 최대금액 */
	CPN_CON_VALUE VARCHAR2(30), /* 조건값 */
	CPN_ID NUMBER NOT NULL, /* 쿠폰 ID */
	CPN_CON_TYPE VARCHAR2(15), /* 조건유형 */
	CPN_DISCOUNT_TYPE CHAR(1) /* 할인유형 */
);

COMMENT ON TABLE SCOTT.O_COUPON IS '쿠폰';

COMMENT ON COLUMN SCOTT.O_COUPON.CPN_DISCOUNT_RATE IS '할인율';

COMMENT ON COLUMN SCOTT.O_COUPON.CPN_INFO IS '쿠폰 설명';

COMMENT ON COLUMN SCOTT.O_COUPON.CPN_STARTDATE IS '쿠폰시작일';

COMMENT ON COLUMN SCOTT.O_COUPON.CPN_APPLY IS '적용대상';

COMMENT ON COLUMN SCOTT.O_COUPON.CPN_ENDDATE IS '쿠폰종료일';

COMMENT ON COLUMN SCOTT.O_COUPON.CPN_MAX_AMOUNT IS '최대금액';

COMMENT ON COLUMN SCOTT.O_COUPON.CPN_CON_VALUE IS '조건값';

COMMENT ON COLUMN SCOTT.O_COUPON.CPN_ID IS '쿠폰 ID';

COMMENT ON COLUMN SCOTT.O_COUPON.CPN_CON_TYPE IS '조건유형';

COMMENT ON COLUMN SCOTT.O_COUPON.CPN_DISCOUNT_TYPE IS '할인유형';

CREATE UNIQUE INDEX SCOTT.PK_O_COUPON
	ON SCOTT.O_COUPON (
		CPN_ID ASC
	);

ALTER TABLE SCOTT.O_COUPON
	ADD
		CONSTRAINT PK_O_COUPON
		PRIMARY KEY (
			CPN_ID
		);

/* 주문 */
CREATE TABLE SCOTT.O_ORDER (
	ORD_ID VARCHAR2(30) NOT NULL, /* 주문 ID */
	USER_ID NUMBER, /* 회원 ID */
	CART_ID NUMBER, /* 장바구니 ID */
	ICPN_ID NUMBER, /* 발급쿠폰 ID */
	ORD_NAME NVARCHAR2(10), /* 주문자명 */
	ORD_ADDRESS NVARCHAR2(200), /* 배송주소 */
	ORD_TEL VARCHAR2(20), /* 전화번호 */
	ORD_EMAIL VARCHAR2(100), /* 이메일 */
	ORD_PASSWORD VARCHAR2(50), /* 주문 비밀번호 */
	ORD_ORDERDATE DATE, /* 주문일 */
	ORD_TOTAL_AMOUNT NUMBER DEFAULT 0, /* 총 주문금액 */
	ORD_CPN_DISCOUNT NUMBER DEFAULT 0, /* 쿠폰 할인금액 */
	ORD_PDT_DISCOUNT NUMBER DEFAULT 0, /* 추가 할인금액 */
	ORD_USEPOINT NUMBER, /* 적립금사용 */
	ORD_PAY_OPTION VARCHAR2(30), /* 결제 수단 */
	ORD_DELIVERY_FEE NUMBER DEFAULT 3000 /* 배송비 */
);

COMMENT ON TABLE SCOTT.O_ORDER IS '주문';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_ID IS '주문 ID';

COMMENT ON COLUMN SCOTT.O_ORDER.USER_ID IS '회원 ID';

COMMENT ON COLUMN SCOTT.O_ORDER.CART_ID IS '장바구니 ID';

COMMENT ON COLUMN SCOTT.O_ORDER.ICPN_ID IS '발급쿠폰 ID';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_NAME IS '주문자명';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_ADDRESS IS '배송주소';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_TEL IS '전화번호';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_EMAIL IS '이메일';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_PASSWORD IS '주문 비밀번호';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_ORDERDATE IS '주문일';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_TOTAL_AMOUNT IS '총 주문금액';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_CPN_DISCOUNT IS '쿠폰 할인금액';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_PDT_DISCOUNT IS '추가 할인금액';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_USEPOINT IS '적립금사용';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_PAY_OPTION IS '결제 수단';

COMMENT ON COLUMN SCOTT.O_ORDER.ORD_DELIVERY_FEE IS '배송비';

CREATE UNIQUE INDEX SCOTT.PK_O_ORDER
	ON SCOTT.O_ORDER (
		ORD_ID ASC
	);

ALTER TABLE SCOTT.O_ORDER
	ADD
		CONSTRAINT PK_O_ORDER
		PRIMARY KEY (
			ORD_ID
		);

/* 댓글 */
CREATE TABLE SCOTT.O_COMMENT (
	CMT_ID NUMBER NOT NULL, /* 댓글 ID */
	REV_ID NUMBER, /* 리뷰 ID */
	USER_ID NUMBER, /* 회원 ID */
	CMT_WRITEDATE DATE NOT NULL, /* 작성 일자 */
	CMT_CONTENT CLOB NOT NULL /* 댓글 내용 */
);

COMMENT ON TABLE SCOTT.O_COMMENT IS '댓글';

COMMENT ON COLUMN SCOTT.O_COMMENT.CMT_ID IS '댓글 ID';

COMMENT ON COLUMN SCOTT.O_COMMENT.REV_ID IS '리뷰 ID';

COMMENT ON COLUMN SCOTT.O_COMMENT.USER_ID IS '회원 ID';

COMMENT ON COLUMN SCOTT.O_COMMENT.CMT_WRITEDATE IS '작성 일자';

COMMENT ON COLUMN SCOTT.O_COMMENT.CMT_CONTENT IS '댓글 내용';

CREATE UNIQUE INDEX SCOTT.PK_O_COMMENT
	ON SCOTT.O_COMMENT (
		CMT_ID ASC
	);

ALTER TABLE SCOTT.O_COMMENT
	ADD
		CONSTRAINT PK_O_COMMENT
		PRIMARY KEY (
			CMT_ID
		);

/* 카테고리 */
CREATE TABLE SCOTT.O_CATEGORY (
	CAT_ID NUMBER NOT NULL, /* 카테고리 ID */
	CAT_NAME NVARCHAR2(20) NOT NULL /* 카테고리명 */
);

COMMENT ON TABLE SCOTT.O_CATEGORY IS '카테고리';

COMMENT ON COLUMN SCOTT.O_CATEGORY.CAT_ID IS '카테고리 ID';

COMMENT ON COLUMN SCOTT.O_CATEGORY.CAT_NAME IS '카테고리명';

CREATE UNIQUE INDEX SCOTT.PK_O_CATEGORY
	ON SCOTT.O_CATEGORY (
		CAT_ID ASC
	);

ALTER TABLE SCOTT.O_CATEGORY
	ADD
		CONSTRAINT PK_O_CATEGORY
		PRIMARY KEY (
			CAT_ID
		);

/* 이벤트 */
CREATE TABLE SCOTT.O_EVENT (
	EVT_ID NUMBER NOT NULL, /* 이벤트 ID */
	EVT_TITLE NVARCHAR2(50), /* 이벤트 제목 */
	EVT_CONTENT VARCHAR2(3000), /* 이벤트 내용 */
	EVT_STARTDATE DATE NOT NULL, /* 이벤트 시작 날짜 */
	EVT_ENDDATE DATE NOT NULL, /* 이벤트 종료 날짜 */
	EVT_CONTENT_URL VARCHAR2(50) /* 이벤트 내용 URL */
);

COMMENT ON TABLE SCOTT.O_EVENT IS '이벤트';

COMMENT ON COLUMN SCOTT.O_EVENT.EVT_ID IS '이벤트 ID';

COMMENT ON COLUMN SCOTT.O_EVENT.EVT_TITLE IS '이벤트 제목';

COMMENT ON COLUMN SCOTT.O_EVENT.EVT_CONTENT IS '이벤트 내용';

COMMENT ON COLUMN SCOTT.O_EVENT.EVT_STARTDATE IS '이벤트 시작 날짜';

COMMENT ON COLUMN SCOTT.O_EVENT.EVT_ENDDATE IS '이벤트 종료 날짜';

COMMENT ON COLUMN SCOTT.O_EVENT.EVT_CONTENT_URL IS '이벤트 내용 URL';

CREATE UNIQUE INDEX SCOTT.PK_O_EVENT
	ON SCOTT.O_EVENT (
		EVT_ID ASC
	);

ALTER TABLE SCOTT.O_EVENT
	ADD
		CONSTRAINT PK_O_EVENT
		PRIMARY KEY (
			EVT_ID
		);

/* 라인업 */
CREATE TABLE SCOTT.O_LINEUP (
	LINEUP_ID NUMBER NOT NULL, /* 라인업 ID */
	LINEUP_OPTION NVARCHAR2(20) NOT NULL /* 라인업 옵션 */
);

COMMENT ON TABLE SCOTT.O_LINEUP IS '라인업';

COMMENT ON COLUMN SCOTT.O_LINEUP.LINEUP_ID IS '라인업 ID';

COMMENT ON COLUMN SCOTT.O_LINEUP.LINEUP_OPTION IS '라인업 옵션';

CREATE UNIQUE INDEX SCOTT.PK_O_LINEUP
	ON SCOTT.O_LINEUP (
		LINEUP_ID ASC
	);

ALTER TABLE SCOTT.O_LINEUP
	ADD
		CONSTRAINT PK_O_LINEUP
		PRIMARY KEY (
			LINEUP_ID
		);

/* 디자인 */
CREATE TABLE SCOTT.O_DESIGN (
	DESIGN_ID NUMBER NOT NULL, /* 디자인 ID */
	DESIGN_OPTION NVARCHAR2(20) NOT NULL /* 디자인 옵션 */
);

COMMENT ON TABLE SCOTT.O_DESIGN IS '디자인';

COMMENT ON COLUMN SCOTT.O_DESIGN.DESIGN_ID IS '디자인 ID';

COMMENT ON COLUMN SCOTT.O_DESIGN.DESIGN_OPTION IS '디자인 옵션';

CREATE UNIQUE INDEX SCOTT.PK_O_DESIGN
	ON SCOTT.O_DESIGN (
		DESIGN_ID ASC
	);

ALTER TABLE SCOTT.O_DESIGN
	ADD
		CONSTRAINT PK_O_DESIGN
		PRIMARY KEY (
			DESIGN_ID
		);

/* 컬러 */
CREATE TABLE SCOTT.O_COLOR (
	COLOR_ID NUMBER NOT NULL, /* 컬러 ID */
	COLOR_OPTION NVARCHAR2(20) NOT NULL /* 컬러 옵션 */
);

COMMENT ON TABLE SCOTT.O_COLOR IS '컬러';

COMMENT ON COLUMN SCOTT.O_COLOR.COLOR_ID IS '컬러 ID';

COMMENT ON COLUMN SCOTT.O_COLOR.COLOR_OPTION IS '컬러 옵션';

CREATE UNIQUE INDEX SCOTT.PK_O_COLOR
	ON SCOTT.O_COLOR (
		COLOR_ID ASC
	);

ALTER TABLE SCOTT.O_COLOR
	ADD
		CONSTRAINT PK_O_COLOR
		PRIMARY KEY (
			COLOR_ID
		);

/* 하위카테고리 */
CREATE TABLE SCOTT.O_SUBCATEGORY (
	SCAT_ID NUMBER NOT NULL, /* 하위카테고리 ID */
	SCAT_NAME NVARCHAR2(20) NOT NULL /* 하위카테고리명 */
);

COMMENT ON TABLE SCOTT.O_SUBCATEGORY IS '하위카테고리';

COMMENT ON COLUMN SCOTT.O_SUBCATEGORY.SCAT_ID IS '하위카테고리 ID';

COMMENT ON COLUMN SCOTT.O_SUBCATEGORY.SCAT_NAME IS '하위카테고리명';

CREATE UNIQUE INDEX SCOTT.PK_O_SUBCATEGORY
	ON SCOTT.O_SUBCATEGORY (
		SCAT_ID ASC
	);

ALTER TABLE SCOTT.O_SUBCATEGORY
	ADD
		CONSTRAINT PK_O_SUBCATEGORY
		PRIMARY KEY (
			SCAT_ID
		);

/* 장바구니 목록 */
CREATE TABLE SCOTT.O_CARTLIST (
	CLIST_ID NUMBER NOT NULL, /* 장바구니 목록 ID */
	CART_ID NUMBER, /* 장바구니 ID */
	PDT_ID NUMBER, /* 상품 ID */
	OPT_ID NUMBER, /* 옵션 ID */
	CLIST_PDT_COUNT NUMBER, /* 상품 수량 */
	CLIST_ADDDATE DATE, /* 추가 날짜 */
	CLIST_SELECT CHAR(1) DEFAULT 'Y' /* 선택 여부 */
);

COMMENT ON TABLE SCOTT.O_CARTLIST IS '장바구니 목록';

COMMENT ON COLUMN SCOTT.O_CARTLIST.CLIST_ID IS '장바구니 목록 ID';

COMMENT ON COLUMN SCOTT.O_CARTLIST.CART_ID IS '장바구니 ID';

COMMENT ON COLUMN SCOTT.O_CARTLIST.PDT_ID IS '상품 ID';

COMMENT ON COLUMN SCOTT.O_CARTLIST.OPT_ID IS '옵션 ID';

COMMENT ON COLUMN SCOTT.O_CARTLIST.CLIST_PDT_COUNT IS '상품 수량';

COMMENT ON COLUMN SCOTT.O_CARTLIST.CLIST_ADDDATE IS '추가 날짜';

COMMENT ON COLUMN SCOTT.O_CARTLIST.CLIST_SELECT IS '선택 여부';

CREATE UNIQUE INDEX SCOTT.PK_O_CARTLIST
	ON SCOTT.O_CARTLIST (
		CLIST_ID ASC
	);

ALTER TABLE SCOTT.O_CARTLIST
	ADD
		CONSTRAINT PK_O_CARTLIST
		PRIMARY KEY (
			CLIST_ID
		);

/* 발급쿠폰 */
CREATE TABLE SCOTT.O_ISSUEDCOUPON (
	ICPN_ID NUMBER NOT NULL, /* 발급쿠폰 ID */
	USER_ID NUMBER, /* 회원 ID */
	CPN_ID NUMBER, /* 쿠폰 ID */
	ICPN_ISSUEDATE DATE, /* 발급일 */
	ICPN_ISUSED CHAR(1) DEFAULT 'N' /* 사용여부 */
);

COMMENT ON TABLE SCOTT.O_ISSUEDCOUPON IS '발급쿠폰';

COMMENT ON COLUMN SCOTT.O_ISSUEDCOUPON.ICPN_ID IS '발급쿠폰 ID';

COMMENT ON COLUMN SCOTT.O_ISSUEDCOUPON.USER_ID IS '회원 ID';

COMMENT ON COLUMN SCOTT.O_ISSUEDCOUPON.CPN_ID IS '쿠폰 ID';

COMMENT ON COLUMN SCOTT.O_ISSUEDCOUPON.ICPN_ISSUEDATE IS '발급일';

COMMENT ON COLUMN SCOTT.O_ISSUEDCOUPON.ICPN_ISUSED IS '사용여부';

CREATE UNIQUE INDEX SCOTT.PK_O_ISSUEDCOUPON
	ON SCOTT.O_ISSUEDCOUPON (
		ICPN_ID ASC
	);

ALTER TABLE SCOTT.O_ISSUEDCOUPON
	ADD
		CONSTRAINT PK_O_ISSUEDCOUPON
		PRIMARY KEY (
			ICPN_ID
		);

/* 배송지 */
CREATE TABLE SCOTT.O_ADDRESS (
	ADDR_ID NUMBER NOT NULL, /* 배송지 ID */
	USER_ID NUMBER, /* 회원 ID */
	ADDR_NICK NVARCHAR2(20) NOT NULL, /* 배송지명 */
	ADDR_NAME NVARCHAR2(10) NOT NULL, /* 수령인 */
	ADDR_HTEL VARCHAR2(20), /* 일반전화 */
	ADDR_TEL VARCHAR2(20) NOT NULL, /* 휴대전화 */
	ADDR_ADDRESS NVARCHAR2(100) NOT NULL, /* 주소 */
	ADDR_ZIPCODE CHAR(5) NOT NULL, /* 우편번호 */
	ADDR_MAIN CHAR(1) DEFAULT 'N' /* 대표 배송지 */
);

COMMENT ON TABLE SCOTT.O_ADDRESS IS '배송지';

COMMENT ON COLUMN SCOTT.O_ADDRESS.ADDR_ID IS '배송지 ID';

COMMENT ON COLUMN SCOTT.O_ADDRESS.USER_ID IS '회원 ID';

COMMENT ON COLUMN SCOTT.O_ADDRESS.ADDR_NICK IS '배송지명';

COMMENT ON COLUMN SCOTT.O_ADDRESS.ADDR_NAME IS '수령인';

COMMENT ON COLUMN SCOTT.O_ADDRESS.ADDR_HTEL IS '일반전화';

COMMENT ON COLUMN SCOTT.O_ADDRESS.ADDR_TEL IS '휴대전화';

COMMENT ON COLUMN SCOTT.O_ADDRESS.ADDR_ADDRESS IS '주소';

COMMENT ON COLUMN SCOTT.O_ADDRESS.ADDR_ZIPCODE IS '우편번호';

COMMENT ON COLUMN SCOTT.O_ADDRESS.ADDR_MAIN IS '대표 배송지';

CREATE UNIQUE INDEX SCOTT.PK_O_ADDRESS
	ON SCOTT.O_ADDRESS (
		ADDR_ID ASC
	);

ALTER TABLE SCOTT.O_ADDRESS
	ADD
		CONSTRAINT PK_O_ADDRESS
		PRIMARY KEY (
			ADDR_ID
		);

/* 상품옵션 */
CREATE TABLE SCOTT.O_PDTOPTION (
	OPT_ID NUMBER NOT NULL, /* 옵션 ID */
	PDT_ID NUMBER, /* 상품 ID */
	OPT_NAME NVARCHAR2(20) NOT NULL, /* 옵션명 */
	OPT_AMOUNT NUMBER DEFAULT 0, /* 옵션 가격 */
	OPT_COUNT NUMBER DEFAULT 0 /* 재고수량 */
);

COMMENT ON TABLE SCOTT.O_PDTOPTION IS '상품옵션';

COMMENT ON COLUMN SCOTT.O_PDTOPTION.OPT_ID IS '옵션 ID';

COMMENT ON COLUMN SCOTT.O_PDTOPTION.PDT_ID IS '상품 ID';

COMMENT ON COLUMN SCOTT.O_PDTOPTION.OPT_NAME IS '옵션명';

COMMENT ON COLUMN SCOTT.O_PDTOPTION.OPT_AMOUNT IS '옵션 가격';

COMMENT ON COLUMN SCOTT.O_PDTOPTION.OPT_COUNT IS '재고수량';

CREATE UNIQUE INDEX SCOTT.PK_O_PDTOPTION
	ON SCOTT.O_PDTOPTION (
		OPT_ID ASC
	);

ALTER TABLE SCOTT.O_PDTOPTION
	ADD
		CONSTRAINT PK_O_PDTOPTION
		PRIMARY KEY (
			OPT_ID
		);

/* 상품별 컬러 항목 */
CREATE TABLE SCOTT.O_PDTCOLOR (
	PDT_ID NUMBER, /* 상품 ID */
	COLOR_ID NUMBER /* 컬러 ID */
);

COMMENT ON TABLE SCOTT.O_PDTCOLOR IS '상품별 컬러 항목';

COMMENT ON COLUMN SCOTT.O_PDTCOLOR.PDT_ID IS '상품 ID';

COMMENT ON COLUMN SCOTT.O_PDTCOLOR.COLOR_ID IS '컬러 ID';

/* 상품별 라인업 항목 */
CREATE TABLE SCOTT.O_PDTLINEUP (
	PDT_ID NUMBER, /* 상품 ID */
	LINEUP_ID NUMBER /* 라인업 ID */
);

COMMENT ON TABLE SCOTT.O_PDTLINEUP IS '상품별 라인업 항목';

COMMENT ON COLUMN SCOTT.O_PDTLINEUP.PDT_ID IS '상품 ID';

COMMENT ON COLUMN SCOTT.O_PDTLINEUP.LINEUP_ID IS '라인업 ID';

/* 상품별 디자인 항목 */
CREATE TABLE SCOTT.O_PDTDESIGN (
	PDT_ID NUMBER, /* 상품 ID */
	DESIGN_ID NUMBER /* 디자인 ID */
);

COMMENT ON TABLE SCOTT.O_PDTDESIGN IS '상품별 디자인 항목';

COMMENT ON COLUMN SCOTT.O_PDTDESIGN.PDT_ID IS '상품 ID';

COMMENT ON COLUMN SCOTT.O_PDTDESIGN.DESIGN_ID IS '디자인 ID';

/* 주문상세 */
CREATE TABLE SCOTT.O_ORDDETAIL (
	OPDT_ID NUMBER NOT NULL, /* 주문상세 ID */
	ORD_ID VARCHAR2(30) NOT NULL, /* 주문 ID */
	OPDT_NAME NVARCHAR2(50), /* 상품명 */
	OPDT_AMOUNT NUMBER DEFAULT 0, /* 주문상품 가격 */
	OPDT_DCAMOUNT NUMBER DEFAULT 0, /* 할인상품 가격 */
	OPDT_OPNAME NVARCHAR2(20), /* 옵션명 */
	OPDT_OPAMOUNT NUMBER DEFAULT 0, /* 옵션 가격 */
	OPDT_COUNT NUMBER, /* 주문 갯수 */
	OPDT_STATE NVARCHAR2(30), /* 주문처리상태 */
	OPDT_REFUND NVARCHAR2(30), /* 취소교환반품 */
	OPDT_DELCOMPANY NVARCHAR2(30), /* 택배사 */
	OPDT_DELNUMBER VARCHAR2(30), /* 송장번호 */
	OPDT_CONFIRM CHAR(1) DEFAULT 'N' /* 구매확정 */
);

COMMENT ON TABLE SCOTT.O_ORDDETAIL IS '주문상세';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_ID IS '주문상세 ID';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.ORD_ID IS '주문 ID';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_NAME IS '상품명';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_AMOUNT IS '주문상품 가격';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_DCAMOUNT IS '할인상품 가격';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_OPNAME IS '옵션명';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_OPAMOUNT IS '옵션 가격';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_COUNT IS '주문 갯수';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_STATE IS '주문처리상태';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_REFUND IS '취소교환반품';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_DELCOMPANY IS '택배사';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_DELNUMBER IS '송장번호';

COMMENT ON COLUMN SCOTT.O_ORDDETAIL.OPDT_CONFIRM IS '구매확정';

CREATE UNIQUE INDEX SCOTT.PK_O_ORDDETAIL
	ON SCOTT.O_ORDDETAIL (
		OPDT_ID ASC,
		ORD_ID ASC
	);

ALTER TABLE SCOTT.O_ORDDETAIL
	ADD
		CONSTRAINT PK_O_ORDDETAIL
		PRIMARY KEY (
			OPDT_ID,
			ORD_ID
		);

/* 권한 */
CREATE TABLE SCOTT.O_AUTH (
	AUTH_ID NUMBER NOT NULL, /* 권한 ID */
	AUTH_NAME VARCHAR2(20) /* 권한명 */
);

COMMENT ON TABLE SCOTT.O_AUTH IS '권한';

COMMENT ON COLUMN SCOTT.O_AUTH.AUTH_ID IS '권한 ID';

COMMENT ON COLUMN SCOTT.O_AUTH.AUTH_NAME IS '권한명';

CREATE UNIQUE INDEX SCOTT.PK_O_AUTH
	ON SCOTT.O_AUTH (
		AUTH_ID ASC
	);

ALTER TABLE SCOTT.O_AUTH
	ADD
		CONSTRAINT PK_O_AUTH
		PRIMARY KEY (
			AUTH_ID
		);

/* NOTICE */
CREATE TABLE SCOTT.O_NOTICE (
	NOTICE_ID NUMBER NOT NULL, /* 게시물 ID */
	USER_ID NUMBER NOT NULL, /* 회원 ID */
	NOTICE_TITLE NVARCHAR2(50) NOT NULL, /* 제목 */
	NOTICE_CONTENT VARCHAR2(3000), /* 내용 */
	NOTICE_WRITER NVARCHAR2(10), /* 작성자 */
	NOTICE_VIEWCOUNT NUMBER DEFAULT 0, /* 조회수 */
	NOTICE_WRITEDATE DATE, /* 작성일자 */
	NOTICE_MODIFYDATE DATE /* 수정일자 */
);

COMMENT ON TABLE SCOTT.O_NOTICE IS 'NOTICE';

COMMENT ON COLUMN SCOTT.O_NOTICE.NOTICE_ID IS '게시물 ID';

COMMENT ON COLUMN SCOTT.O_NOTICE.USER_ID IS '회원 ID';

COMMENT ON COLUMN SCOTT.O_NOTICE.NOTICE_TITLE IS '제목';

COMMENT ON COLUMN SCOTT.O_NOTICE.NOTICE_CONTENT IS '내용';

COMMENT ON COLUMN SCOTT.O_NOTICE.NOTICE_WRITER IS '작성자';

COMMENT ON COLUMN SCOTT.O_NOTICE.NOTICE_VIEWCOUNT IS '조회수';

COMMENT ON COLUMN SCOTT.O_NOTICE.NOTICE_WRITEDATE IS '작성일자';

COMMENT ON COLUMN SCOTT.O_NOTICE.NOTICE_MODIFYDATE IS '수정일자';

CREATE UNIQUE INDEX SCOTT.PK_O_NOTICE
	ON SCOTT.O_NOTICE (
		NOTICE_ID ASC
	);

ALTER TABLE SCOTT.O_NOTICE
	ADD
		CONSTRAINT PK_O_NOTICE
		PRIMARY KEY (
			NOTICE_ID
		);

/* FAQ카테고리 */
CREATE TABLE SCOTT.O_FAQCATEGORY (
	FCAT_ID NUMBER NOT NULL, /* 카테고리 ID */
	FCAT_NAME NVARCHAR2(15) /* 카테고리명 */
);

COMMENT ON TABLE SCOTT.O_FAQCATEGORY IS 'FAQ카테고리';

COMMENT ON COLUMN SCOTT.O_FAQCATEGORY.FCAT_ID IS '카테고리 ID';

COMMENT ON COLUMN SCOTT.O_FAQCATEGORY.FCAT_NAME IS '카테고리명';

CREATE UNIQUE INDEX SCOTT.PK_O_FAQCATEGORY
	ON SCOTT.O_FAQCATEGORY (
		FCAT_ID ASC
	);

ALTER TABLE SCOTT.O_FAQCATEGORY
	ADD
		CONSTRAINT PK_O_FAQCATEGORY
		PRIMARY KEY (
			FCAT_ID
		);

/* FAQ */
CREATE TABLE SCOTT.O_FAQ (
	FAQ_ID NUMBER NOT NULL, /* 게시물 ID */
	FCAT_ID NUMBER, /* 카테고리 ID */
	USER_ID NUMBER NOT NULL, /* 회원 ID */
	FAQ_TITLE NVARCHAR2(50) NOT NULL, /* 제목 */
	FAQ_CONTENT VARCHAR2(3000), /* 내용 */
	FAQ_WRITER NVARCHAR2(10), /* 작성자 */
	FAQ_VIEWCOUNT NUMBER DEFAULT 0, /* 조회수 */
	FAQ_WRITEDATE DATE, /* 작성일자 */
	FAQ_MODIFYDATE DATE /* 수정일자 */
);

COMMENT ON TABLE SCOTT.O_FAQ IS 'FAQ';

COMMENT ON COLUMN SCOTT.O_FAQ.FAQ_ID IS '게시물 ID';

COMMENT ON COLUMN SCOTT.O_FAQ.FCAT_ID IS '카테고리 ID';

COMMENT ON COLUMN SCOTT.O_FAQ.USER_ID IS '회원 ID';

COMMENT ON COLUMN SCOTT.O_FAQ.FAQ_TITLE IS '제목';

COMMENT ON COLUMN SCOTT.O_FAQ.FAQ_CONTENT IS '내용';

COMMENT ON COLUMN SCOTT.O_FAQ.FAQ_WRITER IS '작성자';

COMMENT ON COLUMN SCOTT.O_FAQ.FAQ_VIEWCOUNT IS '조회수';

COMMENT ON COLUMN SCOTT.O_FAQ.FAQ_WRITEDATE IS '작성일자';

COMMENT ON COLUMN SCOTT.O_FAQ.FAQ_MODIFYDATE IS '수정일자';

CREATE UNIQUE INDEX SCOTT.PK_O_FAQ
	ON SCOTT.O_FAQ (
		FAQ_ID ASC
	);

ALTER TABLE SCOTT.O_FAQ
	ADD
		CONSTRAINT PK_O_FAQ
		PRIMARY KEY (
			FAQ_ID
		);

/* 1:1게시판 */
CREATE TABLE SCOTT.O_ASK (
	ASK_ID NUMBER NOT NULL, /* 게시물 ID */
	USER_ID NUMBER, /* 회원 ID */
	ASK_TITLE NVARCHAR2(50), /* 제목 */
	ASK_CONTENT VARCHAR2(3000), /* 내용 */
	ASK_WRITER NVARCHAR2(10), /* 작성자 */
	ASK_WRITEDATE DATE, /* 작성일자 */
	ASK_MODIFYDATE DATE, /* 수정일자 */
	ASK_ISANSWER CHAR(1) DEFAULT 'X' /* 답변여부 */
);

COMMENT ON TABLE SCOTT.O_ASK IS '1:1게시판';

COMMENT ON COLUMN SCOTT.O_ASK.ASK_ID IS '게시물 ID';

COMMENT ON COLUMN SCOTT.O_ASK.USER_ID IS '회원 ID';

COMMENT ON COLUMN SCOTT.O_ASK.ASK_TITLE IS '제목';

COMMENT ON COLUMN SCOTT.O_ASK.ASK_CONTENT IS '내용';

COMMENT ON COLUMN SCOTT.O_ASK.ASK_WRITER IS '작성자';

COMMENT ON COLUMN SCOTT.O_ASK.ASK_WRITEDATE IS '작성일자';

COMMENT ON COLUMN SCOTT.O_ASK.ASK_MODIFYDATE IS '수정일자';

COMMENT ON COLUMN SCOTT.O_ASK.ASK_ISANSWER IS '답변여부';

CREATE UNIQUE INDEX SCOTT.PK_O_ASK
	ON SCOTT.O_ASK (
		ASK_ID ASC
	);

ALTER TABLE SCOTT.O_ASK
	ADD
		CONSTRAINT PK_O_ASK
		PRIMARY KEY (
			ASK_ID
		);

/* 리뷰URL */
CREATE TABLE SCOTT.O_REVURL (
	RURL_ID NUMBER NOT NULL, /* 리뷰URL ID */
	REV_ID NUMBER NOT NULL, /* 리뷰 ID */
	RURL_PHOTO VARCHAR2(100), /* 포토URL */
	RURL_RECORD VARCHAR2(100) /* 영상URL */
);

COMMENT ON TABLE SCOTT.O_REVURL IS '리뷰URL';

COMMENT ON COLUMN SCOTT.O_REVURL.RURL_ID IS '리뷰URL ID';

COMMENT ON COLUMN SCOTT.O_REVURL.REV_ID IS '리뷰 ID';

COMMENT ON COLUMN SCOTT.O_REVURL.RURL_PHOTO IS '포토URL';

COMMENT ON COLUMN SCOTT.O_REVURL.RURL_RECORD IS '영상URL';

CREATE UNIQUE INDEX SCOTT.PK_O_REVURL
	ON SCOTT.O_REVURL (
		RURL_ID ASC,
		REV_ID ASC
	);

ALTER TABLE SCOTT.O_REVURL
	ADD
		CONSTRAINT PK_O_REVURL
		PRIMARY KEY (
			RURL_ID,
			REV_ID
		);

ALTER TABLE SCOTT.O_USER
	ADD
		CONSTRAINT FK_O_MEMBERSHIP_TO_O_USER
		FOREIGN KEY (
			MEM_ID
		)
		REFERENCES SCOTT.O_MEMBERSHIP (
			MEM_ID
		);

ALTER TABLE SCOTT.O_USER
	ADD
		CONSTRAINT FK_O_AUTH_TO_O_USER
		FOREIGN KEY (
			AUTH_ID
		)
		REFERENCES SCOTT.O_AUTH (
			AUTH_ID
		);

ALTER TABLE SCOTT.O_PRODUCT
	ADD
		CONSTRAINT FK_O_CATEGORY_TO_O_PRODUCT
		FOREIGN KEY (
			CAT_ID
		)
		REFERENCES SCOTT.O_CATEGORY (
			CAT_ID
		);

ALTER TABLE SCOTT.O_PRODUCT
	ADD
		CONSTRAINT FK_O_SUBCATEGORY_TO_O_PRODUCT
		FOREIGN KEY (
			SCAT_ID
		)
		REFERENCES SCOTT.O_SUBCATEGORY (
			SCAT_ID
		);

ALTER TABLE SCOTT.O_CART
	ADD
		CONSTRAINT FK_O_USER_TO_O_CART
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES SCOTT.O_USER (
			USER_ID
		);

ALTER TABLE SCOTT.O_REVIEW
	ADD
		CONSTRAINT FK_O_USER_TO_O_REVIEW
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES SCOTT.O_USER (
			USER_ID
		);

ALTER TABLE SCOTT.O_REVIEW
	ADD
		CONSTRAINT FK_O_ORDDETAIL_TO_O_REVIEW
		FOREIGN KEY (
			OPDT_ID,
			ORD_ID
		)
		REFERENCES SCOTT.O_ORDDETAIL (
			OPDT_ID,
			ORD_ID
		);

ALTER TABLE SCOTT.O_PAYMENT
	ADD
		CONSTRAINT FK_O_ORDER_TO_O_PAYMENT
		FOREIGN KEY (
			ORD_ID
		)
		REFERENCES SCOTT.O_ORDER (
			ORD_ID
		);

ALTER TABLE SCOTT.O_PAYMENT
	ADD
		CONSTRAINT FK_O_USER_TO_O_PAYMENT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES SCOTT.O_USER (
			USER_ID
		);

ALTER TABLE SCOTT.O_ORDER
	ADD
		CONSTRAINT FK_O_USER_TO_O_ORDER
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES SCOTT.O_USER (
			USER_ID
		);

ALTER TABLE SCOTT.O_ORDER
	ADD
		CONSTRAINT FK_O_ISSUEDCOUPON_TO_O_ORDER
		FOREIGN KEY (
			ICPN_ID
		)
		REFERENCES SCOTT.O_ISSUEDCOUPON (
			ICPN_ID
		);

ALTER TABLE SCOTT.O_ORDER
	ADD
		CONSTRAINT FK_O_CART_TO_O_ORDER
		FOREIGN KEY (
			CART_ID
		)
		REFERENCES SCOTT.O_CART (
			CART_ID
		);

ALTER TABLE SCOTT.O_COMMENT
	ADD
		CONSTRAINT FK_O_REVIEW_TO_O_COMMENT
		FOREIGN KEY (
			REV_ID
		)
		REFERENCES SCOTT.O_REVIEW (
			REV_ID
		);

ALTER TABLE SCOTT.O_COMMENT
	ADD
		CONSTRAINT FK_O_USER_TO_O_COMMENT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES SCOTT.O_USER (
			USER_ID
		);

ALTER TABLE SCOTT.O_CARTLIST
	ADD
		CONSTRAINT FK_O_CART_TO_O_CARTLIST
		FOREIGN KEY (
			CART_ID
		)
		REFERENCES SCOTT.O_CART (
			CART_ID
		);

ALTER TABLE SCOTT.O_CARTLIST
	ADD
		CONSTRAINT FK_O_PRODUCT_TO_O_CARTLIST
		FOREIGN KEY (
			PDT_ID
		)
		REFERENCES SCOTT.O_PRODUCT (
			PDT_ID
		);

ALTER TABLE SCOTT.O_CARTLIST
	ADD
		CONSTRAINT FK_O_PDTOPTION_TO_O_CARTLIST
		FOREIGN KEY (
			OPT_ID
		)
		REFERENCES SCOTT.O_PDTOPTION (
			OPT_ID
		);

ALTER TABLE SCOTT.O_ISSUEDCOUPON
	ADD
		CONSTRAINT FK_O_USER_TO_O_ISSUEDCOUPON
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES SCOTT.O_USER (
			USER_ID
		);

ALTER TABLE SCOTT.O_ISSUEDCOUPON
	ADD
		CONSTRAINT FK_O_COUPON_TO_O_ISSUEDCOUPON
		FOREIGN KEY (
			CPN_ID
		)
		REFERENCES SCOTT.O_COUPON (
			CPN_ID
		);

ALTER TABLE SCOTT.O_ADDRESS
	ADD
		CONSTRAINT FK_O_USER_TO_O_ADDRESS
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES SCOTT.O_USER (
			USER_ID
		);

ALTER TABLE SCOTT.O_PDTOPTION
	ADD
		CONSTRAINT FK_O_PRODUCT_TO_O_PDTOPTION
		FOREIGN KEY (
			PDT_ID
		)
		REFERENCES SCOTT.O_PRODUCT (
			PDT_ID
		);

ALTER TABLE SCOTT.O_PDTCOLOR
	ADD
		CONSTRAINT FK_O_PRODUCT_TO_O_PDTCOLOR
		FOREIGN KEY (
			PDT_ID
		)
		REFERENCES SCOTT.O_PRODUCT (
			PDT_ID
		);

ALTER TABLE SCOTT.O_PDTCOLOR
	ADD
		CONSTRAINT FK_O_COLOR_TO_O_PDTCOLOR
		FOREIGN KEY (
			COLOR_ID
		)
		REFERENCES SCOTT.O_COLOR (
			COLOR_ID
		);

ALTER TABLE SCOTT.O_PDTLINEUP
	ADD
		CONSTRAINT FK_O_PRODUCT_TO_O_PDTLINEUP
		FOREIGN KEY (
			PDT_ID
		)
		REFERENCES SCOTT.O_PRODUCT (
			PDT_ID
		);

ALTER TABLE SCOTT.O_PDTLINEUP
	ADD
		CONSTRAINT FK_O_LINEUP_TO_O_PDTLINEUP
		FOREIGN KEY (
			LINEUP_ID
		)
		REFERENCES SCOTT.O_LINEUP (
			LINEUP_ID
		);

ALTER TABLE SCOTT.O_PDTDESIGN
	ADD
		CONSTRAINT FK_O_PRODUCT_TO_O_PDTDESIGN
		FOREIGN KEY (
			PDT_ID
		)
		REFERENCES SCOTT.O_PRODUCT (
			PDT_ID
		);

ALTER TABLE SCOTT.O_PDTDESIGN
	ADD
		CONSTRAINT FK_O_DESIGN_TO_O_PDTDESIGN
		FOREIGN KEY (
			DESIGN_ID
		)
		REFERENCES SCOTT.O_DESIGN (
			DESIGN_ID
		);

ALTER TABLE SCOTT.O_ORDDETAIL
	ADD
		CONSTRAINT FK_O_ORDER_TO_O_ORDDETAIL
		FOREIGN KEY (
			ORD_ID
		)
		REFERENCES SCOTT.O_ORDER (
			ORD_ID
		);

ALTER TABLE SCOTT.O_NOTICE
	ADD
		CONSTRAINT FK_O_USER_TO_O_NOTICE
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES SCOTT.O_USER (
			USER_ID
		);

ALTER TABLE SCOTT.O_FAQ
	ADD
		CONSTRAINT FK_O_FAQCATEGORY_TO_O_FAQ
		FOREIGN KEY (
			FCAT_ID
		)
		REFERENCES SCOTT.O_FAQCATEGORY (
			FCAT_ID
		);

ALTER TABLE SCOTT.O_FAQ
	ADD
		CONSTRAINT FK_O_USER_TO_O_FAQ
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES SCOTT.O_USER (
			USER_ID
		);

ALTER TABLE SCOTT.O_ASK
	ADD
		CONSTRAINT FK_O_USER_TO_O_ASK
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES SCOTT.O_USER (
			USER_ID
		);

ALTER TABLE SCOTT.O_REVURL
	ADD
		CONSTRAINT FK_O_REVIEW_TO_O_REVURL
		FOREIGN KEY (
			REV_ID
		)
		REFERENCES SCOTT.O_REVIEW (
			REV_ID
		);