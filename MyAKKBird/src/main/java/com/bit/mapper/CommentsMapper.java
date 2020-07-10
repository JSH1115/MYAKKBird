package com.bit.mapper;

import java.util.List;

import com.bit.myakkbird.comments.CommentsVO;

public interface CommentsMapper {
	public List<CommentsVO> commentsList(int b_num);		//댓글리스트
	public List<CommentsVO> commentsCount(int b_num);		//댓글개수구하기
	public int commentsInsert(CommentsVO comments);			//댓글등록
	public int commentsReplyInsert(CommentsVO comments);	//대댓글등록
	public int commentsUpdate(CommentsVO comments);			//댓글수정
	public int commentsDelete(CommentsVO commentsVO);		//댓글삭제
}
