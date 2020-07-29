package com.bit.myakkbird.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberVO;

public interface AdminService {
	
	//회원관리, FAQ관리
	public MasterVO adminProfileService(String m_id);
	public int memberCountService(MasterVO masterVO);
	public ArrayList<MasterVO> memberListService(MasterVO masterVO);
	
	public int typeCCountService();
	public int typeECountService();
	public int statusNCountService();
	public int statusYCountService();
	public ArrayList<MasterVO> topAddrService();
	
	public MasterVO detailMemberService(String m_id);
	public int updateYStatusService(String m_id);
	public int updateNStatusService(String m_id);
	
	public MasterVO faqMemberCheckService(String m_id);
	public int faqCountService();
	public ArrayList<FAQVO> faqListService();
	public int adminCheckService(String m_id, String m_password);
	public int faqInsertService(FAQVO faqVO);
	public FAQVO faqDetailService(int f_num);
	public int faqUpdateService(FAQVO faqVO);
	public int faqDeleteService(int f_num);
	
	//호준님 (신고, 매칭)
	public int matchCountService(MasterVO masterVO);
	public ArrayList<MasterVO> matchListService(MasterVO masterVO);

	public int dangerCountService(MasterVO masterVO);
	public ArrayList<MasterVO> dangerListService(MasterVO masterVO);
	
	public void dangerOKService(String d_id);
	public void dangerNOService(String d_id);
	
	
	public int dStatusDCountService();
	public int dStatusOCountService();
	public int dStatusXCountService();
	
	public int dangerACountService();
	public int dangerBCountService();
	public int dangerCCountService();
	public int dangerDCountService();
	public int dangerECountService();
	
	public int acceptDCountService();
	public int acceptYCountService();
	public int acceptNCountService();
	
	public ArrayList<MasterVO> topAddrMatchService();
}