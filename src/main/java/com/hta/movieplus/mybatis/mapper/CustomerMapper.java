package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.CustomerOneOnOneVO;

@Mapper
public interface CustomerMapper {
	
	public void insertCustomerOneOnOneVO(CustomerOneOnOneVO oneonone);
	
	/* public List<CustomerOneOnOneVO> getCustomerOneOnOneVOList();  일단 제외 */
	
	
}
