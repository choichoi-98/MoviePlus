package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.CustomerOneOnOneVO;
import com.hta.movieplus.domain.NoticeVO;

@Mapper /* class 만들어지면서 컨테이너에 등록이됨 */
public interface CustomerMapper {

	public void insertCustomerOneOnOneVO(CustomerOneOnOneVO oneonone);

	public List<CustomerOneOnOneVO> getMyInjury(int member_NUM);

	public CustomerOneOnOneVO getDetailByNum(int detailnum);

	public int deletemyinjury(int deletenum);





}
