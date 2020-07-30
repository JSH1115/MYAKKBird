package com.bit.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.admin.FAQVO;
import com.bit.myakkbird.mainpoint.MasterVO;

public interface AdminMapper {
	
	// 회원관리, FAQ관리
	// 관리자 프로필
	public MasterVO adminProfile(String m_id);
	// 총 회원 수
	public int memberCount(MasterVO masterVO);
	// 회원 목록
	public ArrayList<MasterVO> memberList(MasterVO masterVO);
	// 고객 회원 수
	public int typeCCount();
	// 근로자 회원 수
	public int typeECount();
	// 활동 중인 회원 수
	public int statusNCount();
	// 탈퇴한 회원 수
	public int statusYCount();
	// 가장 많이 사는 주소
	public ArrayList<MasterVO> topAddr();
	// 회원 자세히 보기
	public MasterVO detailMember(String m_id);
	// 회원 탈퇴 시키기
	public int updateYStatus(String m_id);
	// 회원 복귀 시키기
	public int updateNStatus(String m_id);
	// FAQ 회원 체크
	public MasterVO faqMemberCheck(String m_id);
	// FAQ 목록 총 개수
	public int faqCount();
	// FAQ 목록
	public ArrayList<FAQVO> faqList();
	// FAQ 관리자인지 체크
	public int adminCheck(
			@Param("m_id") String m_id, 
			@Param("m_password") String m_password);
	// FAQ 작성
	public int faqInsert(FAQVO faqVO);
	// FAQ 자세히 보기
	public FAQVO faqDetail(int f_num);
	// FAQ 수정 불러오기
	public FAQVO faqUpdateCall(int f_num);
	// FAQ 수정
	public int faqUpdate(FAQVO faqVO);
	// FAQ 삭제
	public int faqDelete(int f_num);

	
	// 호준님 (매칭, 신고 내역)
	public int matchCount(MasterVO masterVO);
	public ArrayList<MasterVO> matchList(MasterVO masterVO);
	
	public int dangerCount(MasterVO masterVO);
	public ArrayList<MasterVO> dangerList(MasterVO masterVO);

	public void dangerOK(String d_num);
	public void dangerNO(String d_num);
	
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