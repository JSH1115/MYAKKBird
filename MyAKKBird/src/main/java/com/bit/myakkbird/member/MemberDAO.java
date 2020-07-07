package com.bit.myakkbird.member;

import java.util.Date;

public interface MemberDAO {
	 public MemberVO login(MemberVO dto);
     
	    // �ڵ��α��� üũ�� ��쿡 ����� ���̺� ���ǰ� ��ȿ�ð��� �����ϱ� ���� �޼���
	    public void keepLogin(String uid, String sessionId, Date next);
	     
	    // ������ �α����� ���� �ִ���, �� ��ȿ�ð��� ���� ���� ������ ������ �ִ��� üũ�Ѵ�.
	    public MemberVO checkUserWithSessionKey(String sessionId);

}
