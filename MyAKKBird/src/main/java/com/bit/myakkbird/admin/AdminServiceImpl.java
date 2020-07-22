package com.bit.myakkbird.admin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.AdminMapper;
import com.bit.myakkbird.mainpoint.MasterVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MasterVO adminProfileService(String m_id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		return adminMapper.adminProfile(m_id);
	}
	
	@Override
	public int memberCountService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.memberCount(masterVO);
		
		return result;
	}
	
	@Override
	public ArrayList<MasterVO> memberListService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<MasterVO> memberList = adminMapper.memberList(masterVO);
		
		return memberList;
	}

	@Override
	public int typeCCountService() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.typeCCount();
		
		return result;
	}

	@Override
	public int typeECountService() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.typeECount();
		
		return result;
	}

	@Override
	public int statusNCountService() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.statusNCount();
		
		return result;
	}

	@Override
	public int statusYCountService() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.statusYCount();
		
		return result;
	}
	
	@Override
	public ArrayList<MasterVO> topAddrService() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<MasterVO> addrList = adminMapper.topAddr();
		
		return addrList;
	}
	
	@Override
	public MasterVO detailMemberService(String m_id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		return adminMapper.detailMember(m_id);
	}

	@Override
	public int updateYStatusService(String m_id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.updateYStatus(m_id);
		return result;
	}

	@Override
	public int updateNStatusService(String m_id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.updateNStatus(m_id);
		
		return result;
	}

	@Override
	public MasterVO faqMemberCheckService(String m_id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		return adminMapper.faqMemberCheck(m_id);
	}

	@Override
	public int faqCountService() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.faqCount();
		
		return result;
	}

	@Override
	public ArrayList<FAQVO> faqListService() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<FAQVO> faqList = adminMapper.faqList();
		
		return faqList;
	}

	@Override
	public int adminCheckService(String m_id, String m_password) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.adminCheck(m_id, m_password);
		
		return result;
	}
	
	@Override
	public int faqInsertService(FAQVO faqVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.faqInsert(faqVO);
		
		return result;
	}

	@Override
	public FAQVO faqDetailService(int f_num) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		return adminMapper.faqDetail(f_num);
	}

	@Override
	public int faqUpdateService(FAQVO faqVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.faqUpdate(faqVO);
		
		return result;
	}

	@Override
	public int faqDeleteService(int f_num) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.faqDelete(f_num);
		
		return result;
	}

	// ========================================================================
	
	//호준님 (신고, 매칭)
	@Override
	public int matchCountService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.matchCount(masterVO);
		
		return result;
	}
	
	@Override
	public ArrayList<MasterVO> matchListService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<MasterVO> matchList = adminMapper.matchList(masterVO);
		
		return matchList;
	}
	
	@Override
	public int dangerCountService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.dangerCount(masterVO);
		
		return result;
	}
	
	@Override
	public ArrayList<MasterVO> dangerListService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<MasterVO> dangerList = adminMapper.dangerList(masterVO);
		
		return dangerList;
	}
	
	@Override
	public void dangerOKService(String d_id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		adminMapper.dangerOK(d_id);
		
	}
	
	@Override
	public void dangerNOService(String d_id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		adminMapper.dangerNO(d_id);
		
	}

}