package com.bit.myakkbird.pay;


import java.util.HashMap;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.bit.mapper.PayMapper;

@Service("payService")
public class PayServiceImpl implements PayService{
	
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public void insertPay(HashMap<String,Object> params) {
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		payMapper.insertPay(params);
		
		return;
	}
	

	@Override
	public void updateHeart(HashMap<String,Object> params) {
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		payMapper.updateHeart(params);
		
		return;
	}
	
}
