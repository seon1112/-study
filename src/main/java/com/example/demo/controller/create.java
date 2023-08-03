package com.example.demo.controller;/*
CREATE TABLE account (
	a_no	number		NOT NULL,
	a_nick	varchar2(50)		NULL,
	a_name	varchar2(20)		NOT NULL,
	a_gender	varchar2(10)		NOT NULL,
	a_email	varchar2(30)		NOT NULL,
	a_img	varchar2(50)		NOT NULL,
	a_regdate	date	DEFAULT sysdate	NOT NULL,
	a_pwd	varchar2(50)		NULL
);

CREATE TABLE study (
	s_no	number		NOT NULL,
	s_name	varchar2(100)		NOT NULL,
	s_title	varchar2(300)		NULL,
	s_content	varchar2(200)		NULL,
	s_goal	varchar2(50)		NOT NULL,
	s_o_date	date	DEFAULT sysdate	NOT NULL,
	s_e_date	date		NOT NULL,
	s_member	number		NOT NULL,
	s_condition	char(1)	DEFAULT 0	NULL
);

CREATE TABLE board (
	b_no	number		NOT NULL,
	a_no	number		NOT NULL,
	s_no	number		NOT NULL,
	b_title	varchar2(100)		NOT NULL,
	b_content	varchar2(4000)		NOT NULL,
	b_date	date	DEFAULT sysdate	NOT NULL,
	b_code	clob		NULL,
	b_p_lang	varchar2(20)		NULL,
	b_p_title	varchr2(100)		NULL
);

CREATE TABLE coding_test (
	ct_no	number		NOT NULL,
	a_no	number		NOT NULL,
	q_no	number		NOT NULL,
	p_timer	varchar2(100)		NULL,
	p_code	clob		NOT NULL,
	p_date	date	DEFAULT sysdate	NULL,
	p_lang	varchar2(100)		NOT NULL,
	p_link	varchar2(300)		NULL
);

CREATE TABLE commentary (
	c_no	number		NOT NULL,
	a_no	number		NOT NULL,
	b_no	number		NOT NULL,
	c_date	date	DEFAULT sysdate	NOT NULL,
	c_content	clob		NOT NULL
);

CREATE TABLE study_in (
	r_no	number		NOT NULL,
	a_no	number		NOT NULL,
	s_no	number		NOT NULL,
	s_leader	char(1)		NULL,
	r_ok	char(1)	DEFAULT 0	NOT NULL,
	a_git	varchar2(100)		NULL,
	a_level	varchar2(20)		NULL,
	a_programmers	number		NULL,
	s_a_regdate	date		NULL
);

CREATE TABLE language (
	l_no	number		NOT NULL,
	s_no	number		NULL,
	l_lang	varchar2(50)		NOT NULL,
	l_img	varchar2(100)		NOT NULL
);

CREATE TABLE quiz (
	q_no	number		NOT NULL,
	q_title	varchar2(100)		NULL,
	q_level	number		NULL
);

CREATE TABLE notice (
	n_no	number		NOT NULL,
	n_content	varchar2(100)		NULL,
	n_time	number		NULL,
	a_no	number		NOT NULL
);

ALTER TABLE account ADD CONSTRAINT PK_ACCOUNT PRIMARY KEY (
	a_no
);

ALTER TABLE study ADD CONSTRAINT PK_STUDY PRIMARY KEY (
	s_no
);

ALTER TABLE board ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	b_no
);

ALTER TABLE coding_test ADD CONSTRAINT PK_CODING_TEST PRIMARY KEY (
	ct_no
);

ALTER TABLE commentary ADD CONSTRAINT PK_COMMENTARY PRIMARY KEY (
	c_no
);

ALTER TABLE study_in ADD CONSTRAINT PK_STUDY_IN PRIMARY KEY (
	r_no
);

ALTER TABLE language ADD CONSTRAINT PK_LANGUAGE PRIMARY KEY (
	l_no
);

ALTER TABLE quiz ADD CONSTRAINT PK_QUIZ PRIMARY KEY (
	q_no
);

ALTER TABLE notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
	n_no
);
*/
