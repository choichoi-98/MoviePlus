package com.hta.movieplus.domain;

import java.sql.Date;

public class AprovedPayStoreVO {
	
	/*
	create table myorder (
		    STORE_PAY_NUM NUMBER not null,
		    memberId varchar2(200) not null,
		    STORE_TOTAL_PRICE number not null,
		    orderDate Date default sysdate,
		    primary key(orderId)
		);

		alter table myorder
		    add CONSTRAINT myorder_memberId_fk FOREIGN key (memberId)
		    REFERENCES member(id);
	*/
	
	private String orderId;
	private String memberId;
	private int totalAmount;
	private Date orderDate;
	
	
}
