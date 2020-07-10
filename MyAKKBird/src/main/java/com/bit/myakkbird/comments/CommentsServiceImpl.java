package com.bit.myakkbird.comments;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.CommentsMapper;

@Service("mCommentsService")
public class CommentsServiceImpl implements CommentsService {
	
	@Autowired
	private SqlSession sqlSession;
	
	//댓글리스트
	@Override
	public List<CommentsVO> commentsList(int b_num) {
		
		CommentsMapper mCommentsMapper = sqlSession.getMapper(CommentsMapper.class);
		List<CommentsVO> commentslist = mCommentsMapper.commentsList(b_num);

		return commentslist;
	}
	
	//댓글개수구하기
	@Override
	public List<CommentsVO> commentsCount(int b_num) {
		CommentsMapper mCommentsMapper = sqlSession.getMapper(CommentsMapper.class);
		List<CommentsVO> commentsCount = mCommentsMapper.commentsCount(b_num);
		
		return commentsCount;
	}
	
	//댓글입력
	@Override
	public int commentsInsert(CommentsVO comments) {
		CommentsMapper mCommentsMapper = sqlSession.getMapper(CommentsMapper.class);
		int res = mCommentsMapper.commentsInsert(comments);
		return res;
	}
	//대댓글입력
	@Override
	public int commentsReplyInsert(CommentsVO comments) {
		CommentsMapper mCommentsMapper = sqlSession.getMapper(CommentsMapper.class);
		int res = mCommentsMapper.commentsReplyInsert(comments);
		return res;
	}
	//댓글수정
	@Override
	public int commentsUpdate(CommentsVO comments) {
		CommentsMapper mCommentsMapper = sqlSession.getMapper(CommentsMapper.class);
		int res = mCommentsMapper.commentsUpdate(comments);
		return res;
	}
	//댓글삭제
	@Override
	public int commentsDelete(CommentsVO commentsVO) {
		CommentsMapper mCommentsMapper = sqlSession.getMapper(CommentsMapper.class);
		int res = mCommentsMapper.commentsDelete(commentsVO);
		
		return res;
	}


}
