package com.grand.admin.history.dao;

import java.util.List;

import com.grand.admin.history.vo.HistoryVO;

public interface HistoryDAO {
	public List<HistoryVO> selectHistory(HistoryVO vo) throws Exception;
}
