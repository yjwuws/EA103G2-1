-- 建立各個表單

--EMPLOYEE
CREATE TABLE EMPLOYEE (
  EMP_NO VARCHAR2(20) NOT NULL,
  EMP_ACC VARCHAR2(20) NOT NULL,
  EMP_PWD VARCHAR2(20) NOT NULL,
  EMP_TITLE NUMBER(1, 0) NOT NULL,
  EMP_NAME VARCHAR2(60) NOT NULL,
  EMP_IS_DELETE NUMBER(1, 0),
  EMP_PIC BLOB,
  CONSTRAINT PK_EMP PRIMARY KEY (EMP_NO)
);

--FUNCTION
CREATE TABLE FUNCTION (
  FUN_NO VARCHAR2(20) NOT NULL, 
  FUN_NAME VARCHAR2(60) NOT NULL,
 CONSTRAINT PK_FUNCTION PRIMARY KEY (FUN_NO)
);

--RIGHT
CREATE TABLE RIGHT (
  EMP_NO VARCHAR2(20) NOT NULL,
  FUN_NO VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_RIG PRIMARY KEY (EMP_NO,FUN_NO),
  CONSTRAINT FK_RIG_EMP
  FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEE(EMP_NO),
  CONSTRAINT FK_RIG_FUN
  FOREIGN KEY (FUN_NO) REFERENCES FUNCTION(FUN_NO)
);

--CUSTOMER SERVICE
CREATE TABLE CUSTOMER_SERVICE(
CTS_NO VARCHAR2(20)NOT NULL,
CTS_TYPE NUMBER(1) NOT NULL,
CTS_QUESTION VARCHAR2(750) NOT NULL,
CTS_ANSWER VARCHAR2(750) NOT NULL,
EMP_NO VARCHAR2(20) NOT NULL,
CTS_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
CTS_SHOW NUMBER(1,0) DEFAULT 0 NOT NULL,
CONSTRAINT PK_CTS PRIMARY KEY (CTS_NO),
CONSTRAINT FK_CTS_EMP 
FOREIGN KEY (EMP_NO)REFERENCES EMPLOYEE(EMP_NO)
);

--CUSTOMER SERVICE PICTURE
CREATE TABLE CUSTOMER_SERVICE_PIC(
CTSP_NO VARCHAR2(20)NOT NULL,
CTS_NO VARCHAR(20)NOT NULL,
CTSP_PIC BLOB,
CONSTRAINT PK_CTSP PRIMARY KEY(CTSP_NO),
CONSTRAINT FK_CTSP_CTS 
FOREIGN KEY(CTS_NO) REFERENCES CUSTOMER_SERVICE (CTS_NO)
);

--NEWS
CREATE TABLE NEWS(
  NEW_NO VARCHAR2(20) NOT NULL,
  NEW_CONTENT VARCHAR2(300) NOT NULL,
  NEW_BLOB BLOB,
  EMP_NO VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_NEW PRIMARY KEY (NEW_NO),
  CONSTRAINT FK_NEW_EMP
  FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
  );

--TENANT
CREATE TABLE TENANT (
  TNT_NO             VARCHAR2(20 BYTE) NOT NULL,
  TNT_EMAIL          VARCHAR2(60 BYTE) NOT NULL,
  TNT_ACC            VARCHAR2(20 BYTE) NOT NULL,
  TNT_PWD            VARCHAR2(20 BYTE) NOT NULL,
  TNT_ID             VARCHAR2(10 BYTE) NOT NULL,
  TNT_NAME           VARCHAR2(60 BYTE) NOT NULL,
  TNT_BIRTH          DATE NOT NULL,
  TNT_SEX            NUMBER(1, 0),
  TNT_MOBILE         VARCHAR2(10 BYTE) NOT NULL,
  TNT_CITY           VARCHAR2(20 BYTE) NOT NULL,
  TNT_DIST           VARCHAR2(20 BYTE) NOT NULL,
  TNT_ADD            VARCHAR2(200 BYTE) NOT NULL,
  TNT_PIC            BLOB,
  TNT_STATUS         NUMBER(1) DEFAULT 0 NOT NULL,
  TNT_JOINTIME       TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP NOT NULL,
  TNT_BALANCE        NUMBER DEFAULT 0,
  TNT_BANK           VARCHAR2(60),
  TNT_BANKBRANCH     VARCHAR2(60),
  TNT_BANKACC        VARCHAR2(20),
  TNT_CARD           VARCHAR2(20),
  TNT_CARDSVC        VARCHAR2(20),
  TNT_CARDDUE        DATE,
  TNT_CMT_STARSUM    NUMBER(9),
  TNT_CMT_COUNT      NUMBER(9),
  EMP_NO             VARCHAR2(20 BYTE),
  TNT_ID_PICF        BLOB,
  TNT_ID_PICB        BLOB,
  TNT_ID_PIC2        BLOB,
  TNT_ID_UPLOADTIME  TIMESTAMP(6),
  TNT_ID_ISUPLOAD    NUMBER(1, 0) DEFAULT 0,
  TNT_ID_RESULT      NUMBER(1, 0) DEFAULT 0 NOT NULL,
  TNT_ID_DISAPPROVE  VARCHAR2(100 BYTE),
  TNT_ID_VRFTIME     TIMESTAMP(6),
  TNT_REPORTED_COUNT NUMBER(3) DEFAULT 0,
  TNT_AUTH_CHAT      NUMBER(1, 0) DEFAULT 1,
  TNT_AUTH_RES       NUMBER(1, 0) DEFAULT 1,
  TNT_AUTH_CMT       NUMBER(1, 0) DEFAULT 1,
  TNT_AUTH_RPT       NUMBER(1, 0) DEFAULT 1,
  TNT_AUTH_LIVE       NUMBER(1, 0) DEFAULT 1,
  CONSTRAINT PK_TENANT PRIMARY KEY (TNT_NO),
  CONSTRAINT FK_TENANT_EMPLOYEE
  FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);
ALTER TABLE TENANT  
MODIFY (TNT_BALANCE DEFAULT 100000 );

CREATE TABLE LANDLORD (
  LLD_NO             VARCHAR2(20 BYTE) NOT NULL,
  LLD_EMAIL          VARCHAR2(60 BYTE) NOT NULL,
  LLD_ACC            VARCHAR2(20 BYTE) NOT NULL,
  LLD_PWD            VARCHAR2(20 BYTE) NOT NULL,
  LLD_ID             VARCHAR2(10 BYTE) NOT NULL,
  LLD_NAME           VARCHAR2(60 BYTE) NOT NULL,
  LLD_BIRTH          DATE NOT NULL,
  LLD_SEX            NUMBER(1, 0),
  LLD_MOBILE         VARCHAR2(10 BYTE) NOT NULL,
  LLD_CITY           VARCHAR2(20 BYTE) NOT NULL,
  LLD_DIST           VARCHAR2(20 BYTE) NOT NULL,
  LLD_ADD            VARCHAR2(200 BYTE) NOT NULL,
  LLD_PIC            BLOB,
  LLD_STATUS         NUMBER(1) DEFAULT 0 NOT NULL,
  LLD_JOINTIME       TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP NOT NULL,
  LLD_BALANCE        NUMBER DEFAULT 0,
  LLD_BANK           VARCHAR2(60),
  LLD_BANKBRANCH     VARCHAR2(60),
  LLD_BANKACC        VARCHAR2(20),
  LLD_CARD           VARCHAR2(20),
  LLD_CARDSVC        VARCHAR2(20),
  LLD_CARDDUE        DATE,
  LLD_CMT_STARSUM    NUMBER(9),
  LLD_CMT_COUNT      NUMBER(9),
  EMP_NO             VARCHAR2(20 BYTE),
  LLD_ID_PICF        BLOB,
  LLD_ID_PICB        BLOB,
  LLD_ID_PIC2        BLOB,
  LLD_ID_UPLOADTIME  TIMESTAMP(6),
  LLD_ID_ISUPLOAD    NUMBER(1, 0) DEFAULT 0,
  LLD_ID_RESULT      NUMBER(1, 0) DEFAULT 0 NOT NULL,
  LLD_ID_DISAPPROVE  VARCHAR2(100 BYTE),
  LLD_ID_VRFTIME     TIMESTAMP(6),
  LLD_REPORTED_COUNT NUMBER(3) DEFAULT 0,
  LLD_AUTH_CHAT      NUMBER(1, 0) DEFAULT 1,
  LLD_AUTH_RES       NUMBER(1, 0) DEFAULT 1,
  LLD_AUTH_CMT       NUMBER(1, 0) DEFAULT 1,
  LLD_AUTH_RPT       NUMBER(1, 0) DEFAULT 1,
  LLD_AUTH_HOS       NUMBER(1, 0) DEFAULT 0,
  CONSTRAINT PK_LANDLORD PRIMARY KEY (LLD_NO),
  CONSTRAINT FK_LANDLORD_EMPLOYEE
  FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);
ALTER TABLE LANDLORD  
MODIFY (LLD_BALANCE DEFAULT 100000 );


--REPORT TENANT
CREATE TABLE REPORT_TENANT(
RPTT_NO VARCHAR2(20) NOT NULL,
TNT_NO VARCHAR2(20) NOT NULL,
LLD_NO VARCHAR2(20) NOT NULL,
RPTT_TIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
RPTT_CONTENT VARCHAR2(750) NOT NULL,
EMP_NO VARCHAR2(20),
RPTT_DONE_TIME TIMESTAMP,
RPTT_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTT_RESULT NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTT_NOTE VARCHAR2(750),
CONSTRAINT PK_RPTT PRIMARY KEY(RPTT_NO),
CONSTRAINT FK_RPTT_TNT 
FOREIGN KEY(TNT_NO) REFERENCES TENANT(TNT_NO),
CONSTRAINT FK_RPTT_LLD 
FOREIGN KEY(LLD_NO) REFERENCES LANDLORD(LLD_NO),
CONSTRAINT FK_RPTT_EMP 
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);

--REPORT LANDLORD
CREATE TABLE REPORT_LANDLORD(
RPTL_NO VARCHAR2(20) NOT NULL,
LLD_NO VARCHAR2(20) NOT NULL,
TNT_NO VARCHAR2(20) NOT NULL,
RPTL_TIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
RPTL_CONTENT VARCHAR2(750) NOT NULL,
EMP_NO VARCHAR2(20),
RPTL_DONE_TIME TIMESTAMP,
RPTL_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTL_RESULT NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTL_NOTE VARCHAR2(750),
CONSTRAINT PK_RPTL PRIMARY KEY(RPTL_NO),
CONSTRAINT FK_RPTL_TNT 
FOREIGN KEY(TNT_NO) REFERENCES TENANT(TNT_NO),
CONSTRAINT FK_RPTL_LLD 
FOREIGN KEY(LLD_NO) REFERENCES LANDLORD(LLD_NO),
CONSTRAINT FK_RPTL_EMP 
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);

--RESERVATION DATE
CREATE TABLE RESERVATION_DATE (
  RESD_NO   VARCHAR2(20 BYTE) NOT NULL,
  LLD_NO    VARCHAR2(20 BYTE) NOT NULL,
  RESD_DATE DATE,
  RESD_STATUS VARCHAR2(20 BYTE) DEFAULT 0 NOT NULL,
  CONSTRAINT PK_RESERVATION_DATE PRIMARY KEY (RESD_NO),
  CONSTRAINT FK_RESERVATION_DATE_LANDLORD
  FOREIGN KEY (LLD_NO) REFERENCES LANDLORD(LLD_NO)
);

--HOUSE
  CREATE TABLE HOUSE 
(
  HOS_NO      VARCHAR2(20 BYTE) NOT NULL, 
	LLD_NO      VARCHAR2(20 BYTE) NOT NULL, 
	HOS_NAME    VARCHAR2(300 BYTE)NOT NULL, 
	HOS_BRO     NUMBER(20,0)NOT NULL, 
	HOS_STATUS  VARCHAR2(300 BYTE)NOT NULL, 
	HOS_ADD     VARCHAR2(100 BYTE)NOT NULL, 
	HOS_TYPE    VARCHAR2(300 BYTE)NOT NULL, 
	HOS_FLOOR   VARCHAR2(100 BYTE), 
	HOS_PNUM    NUMBER(6,2)NOT NULL, 
	HOS_DATE    TIMESTAMP (6), 
	HOS_LNG     NUMBER(10,7), 
	HOS_LAT     NUMBER(10,7), 
	HOS_PAT     VARCHAR2(300 BYTE), 
	HOS_ROOM    VARCHAR2(300 BYTE), 
	HOS_LIFFUN  VARCHAR2(300 BYTE), 
	HOS_TRANS   VARCHAR2(300 BYTE), 
	HOS_ID      VARCHAR2(20 BYTE), 
	HOS_TABLE   NUMBER(3,0), 
	HOS_CHAIR   NUMBER(3,0), 
	HOS_BED     NUMBER(2,0), 
	HOS_CLOSET  NUMBER(2,0), 
	HOS_SOFA    NUMBER(2,0), 
	HOS_TV      NUMBER(2,0), 
	HOS_DRINK   NUMBER(2,0), 
	HOS_AIRCON  NUMBER(2,0), 
	HOS_REFRIG  NUMBER(2,0), 
	HOS_WASH    NUMBER(2,0), 
	HOS_HOTER   NUMBER(2,0), 
	HOS_FORTH   NUMBER(2,0), 
	HOS_NET     NUMBER(2,0), 
	HOS_GAS     NUMBER(2,0), 
	HOS_MDATE   VARCHAR2(20 BYTE), 
	HOS_MINDATE VARCHAR2(20 BYTE), 
	HOS_PARK    VARCHAR2(20 BYTE), 
	HOS_SEX     VARCHAR2(20 BYTE), 
	HOS_IDEN    VARCHAR2(20 BYTE), 
	HOS_COOK    VARCHAR2(20 BYTE), 
	HOS_PET     VARCHAR2(20 BYTE), 
	HOS_SMOKE   VARCHAR2(20 BYTE), 
	HOS_RENTFEE NUMBER(10,2)NOT NULL, 
	HOS_GASFEE  NUMBER(6,0), 
	HOS_MANAFEE NUMBER(6,0), 
	HOS_NETFEE  NUMBER(6,0), 
	HOS_PUWATERFEE NUMBER(6,0), 
	HOS_PUELEFEE NUMBER(6,0), 
	HOS_PARKFEE  NUMBER(6,0),
	CONSTRAINT PK_HOUSE PRIMARY KEY (HOS_NO),
	CONSTRAINT FK_HOUSE_LANDLORD
  FOREIGN KEY (LLD_NO) REFERENCES LANDLORD(LLD_NO)
   );

 --HOUSE PICTURE
   CREATE TABLE HOUSE_PICTURE (
  PIC_NO VARCHAR2(20 BYTE) NOT NULL, 
  HOS_NO VARCHAR2(20 BYTE) NOT NULL, 
  HOS_PIC BLOB NOT NULL, 
  CONSTRAINT PK_HOUSE_PICTURE PRIMARY KEY (PIC_NO),
  CONSTRAINT FK_HOUSE_PICTURE_HOUSE
  FOREIGN KEY (HOS_NO) REFERENCES HOUSE(HOS_NO)
);

--VARIABLE FEE
   CREATE TABLE VARIABLE_FEE (
  VAR_NO VARCHAR2(20 BYTE),
  VAR_NAME VARCHAR2(20 BYTE),
  CONSTRAINT PK_VARIABLE_FEE PRIMARY KEY (VAR_NO)
);

--VARFEE LIST
CREATE TABLE VARFEE_LIST (
  VARF_NO VARCHAR2(20 BYTE),
  HOS_NO VARCHAR2(20 BYTE),
  VAR_NO VARCHAR2(20 BYTE),
  PAY_TYPE NUMBER(1),
  PAY_AMOUNT NUMBER(6),
  CONSTRAINT PK_VARFEE_LIST PRIMARY KEY (VARF_NO),
  CONSTRAINT FK_VARFEE_LIST_VARIABLE_FEE
  FOREIGN KEY (VAR_NO) REFERENCES VARIABLE_FEE(VAR_NO),
  CONSTRAINT FK_VARFEE_LIST_HOUSE
  FOREIGN KEY (HOS_NO) REFERENCES HOUSE(HOS_NO)
);

--REPORT HOUSE
CREATE TABLE REPORT_HOUSE(
RPTH_NO VARCHAR2(20) NOT NULL,
HOS_NO VARCHAR2(20) NOT NULL,
TNT_NO VARCHAR2(20) NOT NULL,
RPTH_TIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
RPTH_CONTENT VARCHAR2(750 ) NOT NULL,
EMP_NO VARCHAR2(20),
RPTH_DONE_TIME TIMESTAMP,
RPTH_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTH_RESULT NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTH_NOTE VARCHAR2(750),
CONSTRAINT PK_RPTH PRIMARY KEY(RPTH_NO),
CONSTRAINT FK_RPTH_TNT 
FOREIGN KEY(TNT_NO) REFERENCES TENANT(TNT_NO),
CONSTRAINT FK_RPTH_HOS 
FOREIGN KEY(HOS_NO) REFERENCES HOUSE(HOS_NO),
CONSTRAINT FK_RPTH_EMP 
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);

--MY COLLECTION
   CREATE TABLE MY_COLLECTION (
  COL_NO VARCHAR2(20 BYTE) NOT NULL,
  TNT_NO VARCHAR2(20 BYTE) NOT NULL,
  HOS_NO VARCHAR2(20 BYTE) NOT NULL,
  COL_DATE TIMESTAMP(6),
  CONSTRAINT PK_MY_COLLECTION PRIMARY KEY (COL_NO),
  CONSTRAINT FK_MY_COLLECTION_HOUSE
  FOREIGN KEY (HOS_NO) REFERENCES HOUSE(HOS_NO),
  CONSTRAINT FK_MY_COLLECTION_TENANT
  FOREIGN KEY (TNT_NO) REFERENCES TENANT(TNT_NO)
);

   --TENANT_COMMENTS
   CREATE TABLE TENANT_COMMENTS(
  TCM_NO VARCHAR2(20) NOT NULL, 
  LLD_NO VARCHAR2(20) NOT NULL, 
  TNT_NO VARCHAR2(20) NOT NULL, 
  TCM_CLEAN NUMBER(2) NOT NULL, 
  TCM_COMMUT NUMBER(2) NOT NULL, 
  TCM_SATISFY NUMBER(2) NOT NULL, 
  TCM_COMMET VARCHAR2(500), 
  TCM_TIME DATE NOT NULL, 
  TCM_RESPON VARCHAR2(500), 
  CONSTRAINT PK_TENANT_COMMENTS PRIMARY KEY(TCM_NO),
  CONSTRAINT FK_TCM_LANLORD
  FOREIGN KEY (LLD_NO) REFERENCES LANDLORD(LLD_NO),
  CONSTRAINT FK_TCM_TENANT
  FOREIGN KEY (TNT_NO) REFERENCES TENANT(TNT_NO)
);

 --LANDLORD_COMMENTS
   CREATE TABLE LANDLORD_COMMENTS(
  LCM_NO VARCHAR2(20) NOT NULL, 
  TNT_NO VARCHAR2(20) NOT NULL, 
  LLD_NO VARCHAR2(20) NOT NULL, 
  LCM_CLEAN NUMBER(2) NOT NULL, 
  LCM_COMMUT NUMBER(2) NOT NULL, 
  LCM_SATISFY NUMBER(2) NOT NULL, 
  LCM_COMMET VARCHAR2(500), 
  LCM_TIME DATE NOT NULL, 
  LCM_RESPON VARCHAR2(500), 
  CONSTRAINT PK_LANDLORD_COMMENTS PRIMARY KEY(LCM_NO),
  CONSTRAINT FK_LCM_LANDLORD
  FOREIGN KEY (LLD_NO) REFERENCES LANDLORD(LLD_NO),
  CONSTRAINT FK_LCM_TENANT
  FOREIGN KEY (TNT_NO) REFERENCES TENANT(TNT_NO)
);

 --HOUSE_COMMENTS
   CREATE TABLE HOUSE_COMMENTS(
  HCM_NO VARCHAR2(20) NOT NULL, 
  TNT_NO VARCHAR2(20) NOT NULL, 
  HOS_NO VARCHAR2(20) NOT NULL, 
  HCM_EQPMT NUMBER(2) NOT NULL, 
  HCM_CONVMT NUMBER(2) NOT NULL, 
  HCM_NEIBOR NUMBER(2) NOT NULL, 
  HCM_COMMNT VARCHAR2(500), 
  HCM_TIME DATE NOT NULL, 
  HCM_RESPON VARCHAR2(500), 
  CONSTRAINT PK_HOUSE_COMMENTS PRIMARY KEY(HCM_NO),
  CONSTRAINT FK_HCM_HOUSE
  FOREIGN KEY (HOS_NO) REFERENCES HOUSE(HOS_NO),
  CONSTRAINT FK_HCM_TENANT
  FOREIGN KEY (TNT_NO) REFERENCES TENANT(TNT_NO)
);

--REPORT TENANT COMMENT
CREATE TABLE REPORT_TENANT_COMMENTS(
RPTTC_NO VARCHAR2(20) NOT NULL,
TNT_NO VARCHAR2(20) NOT NULL,
TCM_NO VARCHAR2(20) NOT NULL,
RPTTC_TIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
RPTTC_CONTENT VARCHAR2(750) NOT NULL,
EMP_NO VARCHAR2(20),
RPTTC_DONE_TIME TIMESTAMP,
RPTTC_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTTC_RESULT NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTTC_NOTE VARCHAR2(750),
CONSTRAINT PK_RPTTC PRIMARY KEY(RPTTC_NO),
CONSTRAINT FK_RPTTC_TNT 
FOREIGN KEY(TNT_NO) REFERENCES TENANT(TNT_NO),
CONSTRAINT FK_RPTTC_TCM 
FOREIGN KEY(TCM_NO) REFERENCES TENANT_COMMENTS(TCM_NO),
CONSTRAINT FK_RPTTC_EMP 
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);

--REPORT LANDLORD COMMENT
CREATE TABLE REPORT_LANDLORD_COMMENTS(
RPTLC_NO VARCHAR2(20) NOT NULL,
LLD_NO VARCHAR2(20) NOT NULL,
LCM_NO VARCHAR2(20) NOT NULL,
RPTLC_TIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
RPTLC_CONTENT VARCHAR2(750) NOT NULL,
EMP_NO VARCHAR2(20),
RPTLC_DONE_TIME TIMESTAMP,
RPTLC_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTLC_RESULT NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTLC_NOTE VARCHAR2(750),
CONSTRAINT PK_RPTLC PRIMARY KEY(RPTLC_NO),
CONSTRAINT FK_RPTLC_LCM 
FOREIGN KEY(LCM_NO) REFERENCES LANDLORD_COMMENTS(LCM_NO),
CONSTRAINT FK_RPTLC_LLD 
FOREIGN KEY(LLD_NO) REFERENCES LANDLORD(LLD_NO),
CONSTRAINT FK_RPTLC_EMP 
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);

--REPORT HOUSE COMMENT
CREATE TABLE REPORT_HOUSE_COMMENTS(
RPTHC_NO VARCHAR2(20) NOT NULL,
HCM_NO VARCHAR2(20) NOT NULL,
LLD_NO VARCHAR2(20) NOT NULL,
RPTHC_TIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
RPTHC_CONTENT VARCHAR2(750) NOT NULL,
EMP_NO VARCHAR2(20),
RPTHC_DONE_TIME TIMESTAMP,
RPTHC_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTHC_RESULT NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTHC_NOTE VARCHAR2(750),
CONSTRAINT PK_RPTHC PRIMARY KEY(RPTHC_NO),
CONSTRAINT FK_RPTHC_LLD 
FOREIGN KEY(LLD_NO) REFERENCES LANDLORD(LLD_NO),
CONSTRAINT FK_RPTHC_HCM 
FOREIGN KEY(HCM_NO) REFERENCES HOUSE_COMMENTS(HCM_NO),
CONSTRAINT FK_RPTHC_EMP 
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);

--RESERVARTION_ORDER
CREATE TABLE RESERVARTION_ORDER (
  RES_NO VARCHAR2(20 BYTE),
  TNT_NO VARCHAR2(20 BYTE),
  HOS_NO VARCHAR2(20 BYTE),
  ORDER_DATE DATE,
  RES_TYPE VARCHAR2(20 BYTE),
  RES_STATUS VARCHAR2(20 BYTE),
  LLD_REPLY VARCHAR2(250 BYTE),
  RES_ODD TIMESTAMP(6),
  CONSTRAINT PK_RES_ORDER PRIMARY KEY (RES_NO),
  CONSTRAINT FK_RES_ORDER_HOUSE
  FOREIGN KEY (HOS_NO) REFERENCES HOUSE(HOS_NO)
);

--CONTRACT APPLICATION
CREATE TABLE CONTRACT_APPLICATION 
(
  APL_NO VARCHAR2(20) NOT NULL, 
  TNT_NO VARCHAR2(20) NOT NULL, 
  HOS_NO VARCHAR2(20) NOT NULL, 
  APL_STR DATE NOT NULL, 
  APL_END DATE NOT NULL, 
  APL_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  APL_STATUS NUMBER(1) NOT NULL, 
  CONSTRAINT PK_CON_APL PRIMARY KEY(APL_NO),
  CONSTRAINT FK_CON_APL_TENANT
  FOREIGN KEY (TNT_NO) REFERENCES TENANT(TNT_NO),
  CONSTRAINT FK_CON_APL_HOUSE
  FOREIGN KEY (HOS_NO) REFERENCES HOUSE(HOS_NO)
);

--CONTRACT
CREATE TABLE CONTRACT(
  CON_NO VARCHAR2(20) NOT NULL,
  APL_NO VARCHAR2(20) NOT NULL,
  TNT_NO VARCHAR2(20) NOT NULL,
  HOS_NO VARCHAR2(20) NOT NULL,
  CON_LLD_SIGN CLOB,
  CON_LLD_SIGNTIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CON_TNT_SIGN CLOB,
  CON_TNT_SIGNTIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CON_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CON_CHE_DATE DATE,
  HOS_DEP NUMBER(6),
  CON_DEP_STA NUMBER (1) DEFAULT 0 NOT NULL,
  CON_CHKDATE DATE,
  CON_COMCHKDATE NUMBER(1),
  CON_CHK_STA NUMBER(1) DEFAULT 0 NOT NULL,
  CON_CHR_FEE NUMBER(8) DEFAULT 0 NOT NULL,
  CON_CHR_ITM VARCHAR2(200),
  CON_CHR_ITM_NAME VARCHAR2(40),
  CON_IS_CHR NUMBER(1),
  CON_RENT_AGN NUMBER(1) DEFAULT 0 NOT NULL,
  CON_BILL_PAID NUMBER(1) DEFAULT 0 NOT NULL,
  CON_LASTB_PDATE DATE,
  CON_DEP_BKDATE DATE,
  CON_OUT_NORMAL NUMBER(1) DEFAULT 0 NOT NULL,
  CON_STA NUMBER(1) DEFAULT 0 NOT NULL,
  CONSTRAINT PK_CON_NO PRIMARY KEY(CON_NO),
  CONSTRAINT FK_CONTRACT_CON_APL
  FOREIGN KEY (APL_NO) REFERENCES CONTRACT_APPLICATION(APL_NO),
  CONSTRAINT FK_CONTRACT_HOUSE
  FOREIGN KEY (HOS_NO) REFERENCES HOUSE(HOS_NO),
  CONSTRAINT FK_CONTRACT_TENANT
  FOREIGN KEY (TNT_NO) REFERENCES TENANT(TNT_NO)
);

--RECURRING ORDER
CREATE TABLE RECURRING_ORDER(
REC_NO VARCHAR2(20) NOT NULL,
CON_NO VARCHAR2(20) NOT NULL,
REC_MON NUMBER(2),
REC_WATER NUMBER(5),
REC_ELEC NUMBER(5),
REC_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
HOS_NO VARCHAR2(20) NOT NULL,
REC_TOTAL NUMBER(10) DEFAULT 0 NOT NULL,
REC_STA NUMBER(1) DEFAULT 0 NOT NULL,
CONSTRAINT PK_RECURRING_ORDER PRIMARY KEY(REC_NO),
CONSTRAINT FK_RECURRING_ORDER_CONTRACT
FOREIGN KEY (CON_NO) REFERENCES CONTRACT(CON_NO),
CONSTRAINT FK_RECURRING_ORDER_HOUSE
FOREIGN KEY (HOS_NO) REFERENCES HOUSE(HOS_NO)
);

--REPAIR
CREATE TABLE REPAIR( 
REP_NO VARCHAR2(20) NOT NULL, 
CON_NO VARCHAR2(20) NOT NULL, 
REP_DAM_OBJ VARCHAR2(200) NOT NULL, 
REP_DAM_OBJ_DES VARCHAR2(500),
REP_PRO NUMBER(1) NOT NULL, 
REP_EST_ENDDATE DATE, 
REP_CASE_STR DATE NOT NULL, 
REP_TNT_RPTTIME DATE, 
REP_TNT_RPT NUMBER(1), 
REP_END_TIME DATE, 
CONSTRAINT PK_REPAIR PRIMARY KEY(REP_NO),
CONSTRAINT FK_REPAIR_CONTRACT
FOREIGN KEY (CON_NO) REFERENCES CONTRACT(CON_NO)
);

--REPAIR PCITURE
CREATE TABLE REPAIR_PICTURE( 
REPPIC_NO VARCHAR2(20) NOT NULL, 
REP_NO VARCHAR2(20) NOT NULL, 
REPPIC_PIC BLOB NOT NULL, 
CONSTRAINT PK_REPAIR_PICTURE PRIMARY KEY(REPPIC_NO),
CONSTRAINT FK_REPAIR_PICTURE_REPAIR
FOREIGN KEY (REP_NO) REFERENCES REPAIR(REP_NO)
);

--REPORT REPAIR
CREATE TABLE REPORT_REPAIR(
RPTR_NO VARCHAR2(20) NOT NULL,
REP_NO VARCHAR2(20) NOT NULL,
TNT_NO VARCHAR2(20) NOT NULL,
RPTR_TIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
RPTR_CONTENT VARCHAR2(750) NOT NULL,
EMP_NO VARCHAR2(20),
RPTR_DONE_TIME TIMESTAMP,
RPTR_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTR_RESULT NUMBER(1,0) DEFAULT 0 NOT NULL,
RPTR_NOTE VARCHAR2(750),
CONSTRAINT PK_RPTR PRIMARY KEY(RPTR_NO),
CONSTRAINT FK_RPTR_TNT 
FOREIGN KEY(TNT_NO) REFERENCES TENANT(TNT_NO),
CONSTRAINT FK_RPTR_REP 
FOREIGN KEY(REP_NO) REFERENCES REPAIR(REP_NO),
CONSTRAINT FK_RPTR_EMP 
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);

--REPORT REPAIR PCITURE
CREATE TABLE REPORT_REPAIR_PICTURE(
RPTRP_NO VARCHAR2(20) NOT NULL,
RPTR_NO VARCHAR2(20) NOT NULL,
RPTRP_PIC BLOB NOT NULL,
CONSTRAINT PK_RPTRP PRIMARY KEY(RPTRP_NO),
CONSTRAINT FK_RPTRP_RPTR 
FOREIGN KEY (RPTR_NO) REFERENCES REPORT_REPAIR(RPTR_NO)
);

--CREATE SEQUENCE
CREATE SEQUENCE SEQ_EMP_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_FUNCTION_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RIGHT_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_CTS_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_CTSP_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_NEW_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_TNT_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_LLD_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RPTT_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RPTL_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RESD_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_HOS_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_PIC_NO
MAXVALUE 1000000;
CREATE SEQUENCE SEQ_VAR_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_VARF_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RPTH_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_TCM_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_LCM_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_HCM_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RPTTC_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RPTLC_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RPTHC_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RES_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_APL_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_CON_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_REC_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_REP_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_REPPIC_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RPTR_NO
MAXVALUE 100000;
CREATE SEQUENCE SEQ_RPTRP_NO
MAXVALUE 100000;
-------------------------
--建立各個觸發器

CREATE OR REPLACE TRIGGER TRIGGER_RPTT 
BEFORE UPDATE OF RPTT_RESULT ON REPORT_TENANT 
REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
  select systimestamp into :new.RPTT_DONE_TIME from dual;
END;
/

--

CREATE OR REPLACE TRIGGER TRIGGER_RPTL
BEFORE UPDATE OF RPTL_RESULT ON REPORT_LANDLORD 
REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
  select systimestamp into :new.RPTL_DONE_TIME from dual;
END;
/

--
CREATE OR REPLACE TRIGGER TRIGGER_RPTH
BEFORE UPDATE OF RPTH_RESULT ON REPORT_HOUSE 
REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
  select systimestamp into :new.RPTH_DONE_TIME from dual;
END;
/
--

CREATE OR REPLACE TRIGGER TRIGGER_RPTTC
BEFORE UPDATE OF RPTTC_RESULT ON REPORT_TENANT_COMMENTS
REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
  select systimestamp into :new.RPTTC_DONE_TIME from dual;
END;
/
--

CREATE OR REPLACE TRIGGER TRIGGER_RPTLC
BEFORE UPDATE OF RPTLC_RESULT ON REPORT_LANDLORD_COMMENTS
REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
  select systimestamp into :new.RPTLC_DONE_TIME from dual;
END;
/

--

CREATE OR REPLACE TRIGGER TRIGGER_RPTHC
BEFORE UPDATE OF RPTHC_RESULT ON REPORT_HOUSE_COMMENTS
REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
  select systimestamp into :new.RPTHC_DONE_TIME from dual;
END;
/
--

CREATE OR REPLACE TRIGGER TRIGGER_RPTR
BEFORE UPDATE OF RPTR_RESULT ON REPORT_REPAIR
REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
  select systimestamp into :new.RPTR_DONE_TIME from dual;
END;
/

--
CREATE OR REPLACE TRIGGER TRIGGER_CTS
BEFORE UPDATE OF CTS_TYPE, CTS_QUESTION,CTS_ANSWER ON CUSTOMER_SERVICE
REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
  select systimestamp into :new.CTS_TIME from dual;
END;
/
CREATE OR REPLACE TRIGGER TRIGGER_TNT_UPLOADTIME
before UPDATE OF TNT_ID_ISUPLOAD ON TENANT 
FOR EACH ROW

BEGIN
      if:old.TNT_ID_ISUPLOAD=0 
      THEN 
      select systimestamp into :new.TNT_ID_UPLOADTIME from dual;
      END IF;
END;
/

CREATE OR REPLACE TRIGGER TRIGGER_TNT_VRFTIME
before UPDATE OF TNT_ID_RESULT ON TENANT 
FOR EACH ROW

BEGIN
      select systimestamp into :new.TNT_ID_VRFTIME  from dual;
END;
/

CREATE OR REPLACE TRIGGER TRIGGER_LLD_UPLOADTIME
before UPDATE OF LLD_ID_ISUPLOAD ON LANDLORD
FOR EACH ROW

BEGIN
      if:old.LLD_ID_ISUPLOAD=0 
      THEN 
      select systimestamp into :new.LLD_ID_UPLOADTIME from dual;
      END IF;
END;
/

CREATE OR REPLACE TRIGGER TRIGGER_LLD_VRFTIME
before UPDATE OF LLD_ID_RESULT ON LANDLORD 
FOR EACH ROW

BEGIN
      select systimestamp into :new.LLD_ID_VRFTIME  from dual;
END;
/
COMMIT;