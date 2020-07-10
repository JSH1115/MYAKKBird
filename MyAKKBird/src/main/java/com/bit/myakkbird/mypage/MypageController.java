package com.bit.myakkbird.mypage;


import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bit.myakkbird.accept.AcceptService;
import com.bit.myakkbird.accept.AcceptVO;
import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberService;
import com.bit.myakkbird.member.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private AcceptService acceptService;
	
	//글쓰기양식
	@RequestMapping(value="/BoardWrite.ak") 
	public String BoardWrite(HttpSession session, MemberVO memberVO, Model model) {
		
		String id = (String)session.getAttribute("m_id");
		memberVO.setM_id(id);
		memberVO = boardService.memberLookUpService(memberVO);
		
		model.addAttribute("memberVO", memberVO);
		
		return "mypage/BoardWrite";
	}
	
	//글쓰기등록
	@RequestMapping(value="/board_insertProcess.ak")
	public String BoardInsertProcess(HttpSession session, String m_id, 
			BoardVO boardVO, Model model) throws Exception {
		
		int result = boardService.UpdateHeartServiec(m_id);
			
		if(result == 1) {
			MultipartFile mf = boardVO.getFile();
			String uploadPath = "C:\\Project156\\myakkbirdUpload\\";
			//지정한 위치에 파일 저장        
	        if(mf.getSize() != 0) {// 첨부된 파일이 있을때            
	            //mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));   
				String originalFileExtension = 
						mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = 
						UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	        	
				mf.transferTo(new File(uploadPath+storedFileName)); // 예외처리 기능 필요함.
				boardVO.setB_org_file(mf.getOriginalFilename());
				boardVO.setB_up_file(storedFileName);
	        } else { // 첨부된 파일이 없을때
				boardVO.setB_org_file("");
				boardVO.setB_up_file("");
			}
		        
			boardService.insertBoardService(boardVO);
			
			session.setAttribute("id", m_id);
			String m_type = memberService.mypage_menu(m_id);
			model.addAttribute("m_type", m_type);
			
			return "member/mypage_menu";
		}
		
		return null;
	}
	
	//본인 게시물 5개 미리 불러오기
	@RequestMapping(value="/BoardLoad.ak")
	public String BoardLoad(HttpSession session, MemberVO memberVO, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		System.out.println("BoardLoad 세션 아이디 : " + m_id);
		ArrayList<MasterVO> boardList = 
				boardService.clientBoardListService(m_id);
		model.addAttribute("boardList", boardList);
		model.addAttribute("m_id", m_id);
		
		return "mypage/BoardLoad";
	}
	
	//게시물 수정 전 기본정보 불러오기
	@RequestMapping(value="/boardUpdate.ak")
	public String boardUpdate(HttpSession session, int b_num, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		MasterVO masterVO = 
				boardService.updateCallService(b_num, m_id);
		
		model.addAttribute("masterVO", masterVO);
		
		return "mypage/BoardUpdate";
	}
	
	//게시물 수정하기
	@RequestMapping(value="/board_updateProcess.ak")
	public String boardUpdateProcess(HttpSession session, String m_id, 
			BoardVO boardVO, Model model) throws Exception {
		MultipartFile mf = boardVO.getFile();
		String uploadPath = "C:\\Project156\\myakkbirdUpload\\";
		//지정한 위치에 파일 저장        
        if(mf.getSize() != 0) {// 첨부된 파일이 있을때            
            //mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));   
			String originalFileExtension = 
					mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = 
					UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
        	
			mf.transferTo(new File(uploadPath+storedFileName)); // 예외처리 기능 필요함.
			boardVO.setB_org_file(mf.getOriginalFilename());
			boardVO.setB_up_file(storedFileName);
        } else { // 첨부된 파일이 없을때
			boardVO.setB_org_file("");
			boardVO.setB_up_file("");
		}
        
        boardService.updateBoardService(boardVO);
        
        session.setAttribute("id", m_id);
		String m_type = memberService.mypage_menu(m_id);
		model.addAttribute("m_type", m_type);
        
        return "member/mypage_menu";
		
	}
	
	//게시글 자세히 보기
	@RequestMapping(value="/BoardDetail.ak") 
	public String BoardDetail(int b_num, Model model, HttpSession session, AcceptVO acceptVO) throws Exception {
		
		//게시글 내용 불러오기
		BoardVO vo = boardService.getDetail(b_num);		
		model.addAttribute("board", vo);
		
		//지원자 수 구하기
		BoardVO apply_count = boardService.applyCount(b_num);	
		session.setAttribute("apply_cnt",apply_count.getApply_cnt());
		model.addAttribute("apply_count", apply_count);
		
		//프로필사진불러오기
		String id = vo.getM_id().toString();
		MemberVO memberVO = memberService.profile(id);
		String m_img;
		if(memberVO.getM_photo() == null) {
			m_img = "no_img";
		} else {
			m_img = memberVO.getM_photo().toString();
		}
		session.setAttribute("m_img", m_img);
		
		//해당게시글에 대한 신청이력 체크하기
		AcceptVO apply_chk = acceptService.applyChk(acceptVO);
		String abc = Integer.toString(apply_chk.getApply_chk());
		model.addAttribute("apply_chk",abc);

		return "mypage/BoardDetail";
	}
	
}
