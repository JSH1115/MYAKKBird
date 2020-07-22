package com.bit.myakkbird.comments;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommentsController {
	
	@Autowired
	CommentsService mCommentsService;
	
	//댓글리스트
	@RequestMapping(value = "/comments_list.ak", produces = "application/json;charset=UTF-8")	
	private List<CommentsVO> commentsList(@RequestParam int b_num, Model model) throws Exception{
		List<CommentsVO> comments_list = mCommentsService.commentsList(b_num);
		model.addAttribute("comments_list", comments_list);
		
		return comments_list;
	}
	
	//댓글개수구하기
	@RequestMapping(value = "/comments_count.ak", produces = "application/json;charset=UTF-8")	
	private List<CommentsVO> commentsCount(@RequestParam int b_num, Model model) throws Exception{
		List<CommentsVO> comments_count = mCommentsService.commentsCount(b_num);
		model.addAttribute("comments_count", comments_count);
		
		return comments_count;
	}	
	
	//댓글 작성
	@RequestMapping(value="/comments_insert.ak", produces="application/json;charset=UTF-8")
	private int mCommentsServiceInsert(CommentsVO comments, HttpSession session)throws Exception{
		comments.setM_id((String)session.getAttribute("m_id"));
		
		return mCommentsService.commentsInsert(comments);
	}
	
	//대댓글 작성
	@RequestMapping(value="/comments_reply_insert.ak", produces="application/json;charset=UTF-8")
	private int mCommentsReplyInsert(CommentsVO comments, HttpSession session)throws Exception{
		comments.setM_id((String)session.getAttribute("m_id"));
		return mCommentsService.commentsReplyInsert(comments);
	}
	
	// 댓글 수정
	@RequestMapping(value="/comments_update.ak",	produces="application/json;charset=UTF-8") 
	private int mCommentsServiceUpdateProc(@RequestParam int c_num, @RequestParam String c_content) throws Exception {
		CommentsVO comments = new CommentsVO();
		comments.setC_num(c_num);
		comments.setC_content(c_content);
		
		return mCommentsService.commentsUpdate(comments);
	}
	
	// 댓글 삭제
	@RequestMapping(value="/comments_delete.ak", produces="application/json;charset=UTF-8") 
	private int mCommentsServiceDelete(@RequestParam(value="c_num") int c_num, 
			@RequestParam(value="c_re_ref") int c_re_ref, 
			HttpSession session) throws Exception {
		CommentsVO commentsVO = new CommentsVO();
		commentsVO.setM_id((String)session.getAttribute("m_id"));
		commentsVO.setC_num(c_num);
		commentsVO.setC_re_ref(c_re_ref);
		
		return mCommentsService.commentsDelete(commentsVO);
	}
}
