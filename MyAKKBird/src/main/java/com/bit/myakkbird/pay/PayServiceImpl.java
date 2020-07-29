package com.bit.myakkbird.pay;


import java.util.ArrayList;
import java.util.HashMap;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.bit.mapper.PayMapper;
import com.bit.myakkbird.member.MemberVO;

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

	@Override
	public int payListCountService(String m_id) {
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		int result = payMapper.payListCount(m_id);
		
		return result;
	}

	@Override
	public ArrayList<PayVO> payListService(String m_id, 
			int startrow, int endrow) {
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		ArrayList<PayVO> payList = 
				payMapper.payList(m_id, startrow, endrow);
		
		return payList;
	}

	@Override
	public MemberVO checkMemberService(String m_id) {
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		MemberVO memberVO = payMapper.checkMember(m_id);
		
		return memberVO;
	}
	
}
