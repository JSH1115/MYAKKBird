package com.bit.myakkbird.mypage;


import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String BoardWrite(HttpSession session, HttpServletResponse response,
			MemberVO memberVO, Model model) throws Exception {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		String id = (String)session.getAttribute("m_id");
		
		if(id == null) {
			writer.write("<script>alert('로그인 필요!');"
					+ "location.href='./loginform.ak';</script>");
		}
		
		memberVO.setM_id(id);
		memberVO = boardService.memberLookUpService(memberVO);
		
		model.addAttribute("memberVO", memberVO);
		
		return "mypage/BoardWrite";
	}
	
	//글쓰기등록
	@RequestMapping(value="/board_insertProcess.ak")
	public String BoardInsertProcess(MultipartHttpServletRequest mtfRequest,
			String m_id, BoardVO boardVO, Model model) throws Exception {
		
		int result = boardService.UpdateHeartServiec(m_id);
		
		if(result == 1) {
			List<MultipartFile> fileList = mtfRequest.getFiles("file");
			ArrayList<String> saveFileName = new ArrayList<String>();
			String uploadPath = "C:\\Project156\\myakkbirdUpload\\";
			// 파일 업로드 안 할 경우
			if(fileList.size() == 1 && fileList.get(0).getOriginalFilename().equals("")) {
				boardVO.setB_up_file("");
				boardVO.setB_up_file2("");
				boardVO.setB_up_file3("");
			// 파일 업로드 할 경우
			} else {
				for(int i = 0; i < fileList.size(); i++) {
					String storedFileName = UUID.randomUUID().toString().replaceAll("-", "");
					
					String originalFileName = 
							fileList.get(i).getOriginalFilename().substring(
									fileList.get(i).getOriginalFilename().lastIndexOf("."));
					
					saveFileName.add(storedFileName + originalFileName); 
					System.out.println("저장된 파일 : "+ saveFileName.get(i));
					
					String savePath = uploadPath + saveFileName.get(i);
					System.out.println("저장된 파일 경로 : " + savePath);
					
					fileList.get(i).transferTo(new File(savePath));
				}
				
				// 파일 2개 업로드
				if(saveFileName.size() == 2) {
					System.out.println("파일 2개 업로드");
					boardVO.setB_up_file(saveFileName.get(0));
					boardVO.setB_up_file2(saveFileName.get(1));
					boardVO.setB_up_file3("");
				// 파일 1개 업로드
				} else if(saveFileName.size() == 1) {
					System.out.println("파일 1개 업로드");
					boardVO.setB_up_file(saveFileName.get(0));
					boardVO.setB_up_file2("");
					boardVO.setB_up_file3("");
				// 파일 3개 업로드
				} else {
					System.out.println("파일 3개 업로드");
					boardVO.setB_up_file(saveFileName.get(0));
					boardVO.setB_up_file2(saveFileName.get(1));
					boardVO.setB_up_file3(saveFileName.get(2));
				}
			}
			
			boardService.insertBoardService(boardVO);
			
			return "redirect:/profile.ak?id="+m_id;
		}
		
		return null;
	}
	
	//본인 게시물 이동하기
	@RequestMapping(value="/BoardLoad.ak")
	public String BoardLoad(HttpSession session, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		
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
	public String boardUpdateProcess(MultipartHttpServletRequest mtfRequest, 
			String m_id, MasterVO masterVO, BoardVO boardVO, Model model) throws Exception {
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		ArrayList<String> saveFileName = new ArrayList<String>();
		String uploadPath = "C:\\Project156\\myakkbirdUpload\\";
		// 기존 이미지로 업로드 할 경우
		if(fileList.size() == 1 && fileList.get(0).getOriginalFilename().equals("")) {
		// 파일 업로드 할 경우
		} else {
			for(int i = 0; i < fileList.size(); i++) {
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "");
				
				String originalFileName = 
						fileList.get(i).getOriginalFilename().substring(
								fileList.get(i).getOriginalFilename().lastIndexOf("."));
				
				saveFileName.add(storedFileName + originalFileName); 
				System.out.println("저장된 파일 : "+ saveFileName.get(i));
				
				String savePath = uploadPath + saveFileName.get(i);
				System.out.println("저장된 파일 경로 : " + savePath);
				
				fileList.get(i).transferTo(new File(savePath));
			}
			
			// 파일 2개 업로드
			if(saveFileName.size() == 2) {
				System.out.println("파일 2개 업로드");
				boardVO.setB_up_file(saveFileName.get(0));
				boardVO.setB_up_file2(saveFileName.get(1));
				boardVO.setB_up_file3("");
			// 파일 1개 업로드
			} else if(saveFileName.size() == 1) {
				System.out.println("파일 1개 업로드");
				boardVO.setB_up_file(saveFileName.get(0));
				boardVO.setB_up_file2("");
				boardVO.setB_up_file3("");
			// 파일 3개 업로드
			} else {
				System.out.println("파일 3개 업로드");
				boardVO.setB_up_file(saveFileName.get(0));
				boardVO.setB_up_file2(saveFileName.get(1));
				boardVO.setB_up_file3(saveFileName.get(2));
			}
		}
        
        boardService.updateBoardService(boardVO);
        
		return "redirect:/BoardLoad.ak";
		
	}
	
	//게시글 자세히 보기
	@RequestMapping(value="/BoardDetail.ak") 
	public String BoardDetail(int b_num, Model model, HttpSession session, AcceptVO acceptVO) throws Exception {
		
		String type_id = (String)session.getAttribute("m_id");
		if(type_id != null) {
			// 멤버 타입 구하기
			String m_type = memberService.mypage_menu(type_id);
			model.addAttribute("m_type", m_type);	
			//하트개수 구하기
			int heart = memberService.heartCnt(type_id);
			//System.out.println("하트개수:"+heart);
			model.addAttribute("heart", heart);
		}
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
	
	//좋아요 게시글 보기
	@RequestMapping(value="/likeBoard.ak")
	public String likeBoardList(HttpSession session, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		
		model.addAttribute("m_id", m_id);
		
		return "mypage/LikeBoard";
	}
	
}
