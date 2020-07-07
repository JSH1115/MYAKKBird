package com.bit.myakkbird.mypage;


import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private BoardService boardService;
	
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
	public String BoardInsertProcess(String m_id, int m_heart, BoardVO boardVO, 
			HttpServletResponse response) throws Exception {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(m_heart == 0) {
			writer.write("<script>alert('하트가 부족합니다!');location.href='./heart.ak';</script>");
		} else {
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
				return "home";
			} 
		}
		
		return null;
	}
	
	//본인 게시물 5개 미리 불러오기
	@RequestMapping(value="/BoardLoad.ak")
	public String BoardLoad(HttpSession session, MemberVO memberVO, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		System.out.println(m_id);
		ArrayList<MasterVO> boardList = 
				boardService.clientBoardListService(m_id);
		model.addAttribute("boardList", boardList);
		model.addAttribute("m_id", m_id);
		
		return "mypage/BoardLoad";
	}
	
	//게시물 수정 전 기본정보 불러오기
	@RequestMapping(value="/boardUpdate.ak")
	public String boardUpdate(int b_num, Model model) {
		
		BoardVO boardVO = boardService.updateCallService(b_num);
		model.addAttribute("boardVO", boardVO);
		
		return "mypage/BoardUpdate";
	}
	
	//게시글 자세히 보기
	@RequestMapping(value="/BoardDetail.ak") 
	public String BoardDetail(int b_num, Model model, HttpSession session) throws Exception {
		
		BoardVO vo = boardService.getDetail(b_num);		//게시글
		model.addAttribute("board", vo);
		
		BoardVO apply_count = boardService.applyCount(b_num);	//지원자 수
		session.setAttribute("apply_cnt",apply_count.getApply_cnt());
		model.addAttribute("apply_count", apply_count);

		return "mypage/BoardDetail";
	}
	
}