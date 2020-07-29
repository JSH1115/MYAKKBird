package com.bit.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.admin.FAQVO;
import com.bit.myakkbird.mainpoint.MasterVO;

public interface AdminMapper {
	
	//회원관리, FAQ관리
	public MasterVO adminProfile(String m_id);
	public int memberCount(MasterVO masterVO);
	public ArrayList<MasterVO> memberList(MasterVO masterVO);
	
	public int typeCCount();
	public int typeECount();
	public int statusNCount();
	public int statusYCount();
	public ArrayList<MasterVO> topAddr();
	
	public MasterVO detailMember(String m_id);
	public int updateYStatus(String m_id);
	public int updateNStatus(String m_id);
	
	public MasterVO faqMemberCheck(String m_id);
	public int faqCount();
	public ArrayList<FAQVO> faqList();
	public int adminCheck(
			@Param("m_id") String m_id, 
			@Param("m_password") String m_password);
	public int faqInsert(FAQVO faqVO);
	public FAQVO faqDetail(int f_num);
	public FAQVO faqUpdateCall(int f_num);
	public int faqUpdate(FAQVO faqVO);
	public int faqDelete(int f_num);

	
	// 호준님 (매칭, 신고 내역)
	public int matchCount(MasterVO masterVO);
	public ArrayList<MasterVO> matchList(MasterVO masterVO);
	
	public int dangerCount(MasterVO masterVO);
	public ArrayList<MasterVO> dangerList(MasterVO masterVO);

	public void dangerOK(String d_id);
	public void dangerNO(String d_id);
	
	public int dStatusDCount();
	public int dStatusOCount();
	public int dStatusXCount();
	
	public int dangerACount();
	public int dangerBCount();
	public int dangerCCount();
	public int dangerECount();
	public int dangerDCount();
	
	public int acceptDCount();
	public int acceptYCount();
	public int acceptNCount();
	
	public ArrayList<MasterVO> topAddrMatch();
}