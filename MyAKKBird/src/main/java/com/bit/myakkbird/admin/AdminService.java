package com.bit.myakkbird.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberVO;

public interface AdminService {
	
	// 회원관리, FAQ관리
	// 관리자 프로필
	public MasterVO adminProfileService(String m_id);
	// 총 회원 수
	public int memberCountService(MasterVO masterVO);
	// 회원 목록
	public ArrayList<MasterVO> memberListService(MasterVO masterVO);
	// 고객 회원 수
	public int typeCCountService();
	// 근로자 회원 수
	public int typeECountService();
	// 활동 중인 회원 수
	public int statusNCountService();
	// 탈퇴한 회원 수
	public int statusYCountService();
	// 가장 많이 사는 주소
	public ArrayList<MasterVO> topAddrService();
	// 회원 자세히 보기
	public MasterVO detailMemberService(String m_id);
	// 회원 탈퇴 시키기
	public int updateYStatusService(String m_id);
	// 회원 복귀 시키기
	public int updateNStatusService(String m_id);
	// FAQ 회원 체크
	public MasterVO faqMemberCheckService(String m_id);
	// FAQ 목록 총 개수
	public int faqCountService();
	// FAQ 목록
	public ArrayList<FAQVO> faqListService();
	// FAQ 관리자인지 체크
	public int adminCheckService(String m_id, String m_password);
	// FAQ 작성
	public int faqInsertService(FAQVO faqVO);
	// FAQ 자세히 보기
	public FAQVO faqDetailService(int f_num);
	// FAQ 수정 불러오기
	public FAQVO faqUpdateCall(int f_num);
	// FAQ 수정
	public int faqUpdateService(FAQVO faqVO);
	// FAQ 삭제
	public int faqDeleteService(int f_num);
	

	//호준님 (신고, 매칭)
	public int matchCountService(MasterVO masterVO);
	public ArrayList<MasterVO> matchListService(MasterVO masterVO);

	public int dangerCountService(MasterVO masterVO);
	public ArrayList<MasterVO> dangerListService(MasterVO masterVO);
	
	public void dangerOKService(String d_num);
	public void dangerNOService(String d_num);
	
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