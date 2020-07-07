package com.bit.mapper;

import java.util.ArrayList;

import com.bit.myakkbird.mainpoint.MasterVO;

public interface MainPointMapper {
	public ArrayList<MasterVO> selectBoard(String b_address_road);
}
