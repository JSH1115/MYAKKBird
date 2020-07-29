package com.bit.myakkbird.wish;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WishController {
	
	@Autowired
	private WishService wishService;
	
	@RequestMapping(value="/check_like.ak", produces="application/json;charset=UTF-8")
	public int checkLike(int b_num, String m_id) {
		
		int result = wishService.checkLikeService(b_num, m_id);
		
		return result;
		
	}
	
	@RequestMapping(value="/check_member.ak", produces="application/json;charset=UTF-8")
	public int checkMember(String m_id) {
		
		int result = wishService.checkMemberService(m_id);
		
		if(result == 1) {
			System.out.println("회원 O");
		} else {
			System.out.println("회원 X");
		}
		
		return result;
	}
	
	@RequestMapping(value="/check_worker.ak", produces="application/json;charset=UTF-8")
	public int checkWorker(String m_id) {
		
		int result = wishService.checkWorkerService(m_id);
		
		if(result == 1) {
			System.out.println("찜하기 근로자 O");
		} else {
			System.out.println("찜하기 근로자 X");
		}
		
		return result;
	}
	
	@RequestMapping(value="/check_likeRe.ak", produces="application/json;charset=UTF-8")
	public int checkLikeRe(int b_num, String m_id) {
		
		int result = wishService.checkLikeReService(b_num, m_id);
		
		if(result == 1) {
			System.out.println(b_num + "번 게시글 찜 추가 된 상태");
		} else {
			System.out.println(b_num + "번 게시글 찜 추가 안된 상태");
		}
		
		return result;
	}
	
	@RequestMapping(value="/insert_like.ak", produces="application/json;charset=UTF-8")
	public int insertLike(int b_num, String m_id) {
		
		int result = wishService.insertLikeService(b_num, m_id);
		
		if(result == 1) {
			System.out.println(b_num + "번 게시글 찜 추가 성공!");
		} else {
			System.out.println(b_num + "번 게시글 찜 추가 실패!");
		}
		
		return result;
	}
	
	@RequestMapping(value="/delete_like.ak", produces="application/json;charset=UTF-8")
	public int deleteLike(int b_num, String m_id) {
		
		int result = wishService.deleteLikeService(b_num, m_id);
		
		if(result == 1) {
			System.out.println(b_num + "번 게시글 찜 삭제 성공!");
		} else {
			System.out.println(b_num + "번 게시글 찜 삭제 실패!");
		}
		
		return result;
	}

}
