package com.hta.movieplus.domain;

import java.sql.Date;

public class MyOrderVO {
	
	/*
	create table myorder (
		    orderId varchar2(200) not null,
		    memberId varchar2(200) not null,
		    totalAmount number not null,
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
