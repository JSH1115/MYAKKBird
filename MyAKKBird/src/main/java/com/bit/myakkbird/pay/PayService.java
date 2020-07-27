package com.bit.myakkbird.pay;

import java.util.ArrayList;
import java.util.HashMap;

public interface PayService {
	public void insertPay(HashMap<String,Object> params);
	public void updateHeart(HashMap<String,Object> params);
	
	public int payListCountService(String m_id);
	public ArrayList<PayVO> payListService(String m_id,
			int startrow, int endrow);
}
