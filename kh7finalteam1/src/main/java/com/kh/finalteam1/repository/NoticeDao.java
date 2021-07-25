package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.NoticeDto;
import com.kh.finalteam1.entity.NoticeVo;

public interface NoticeDao {
	List<NoticeVo> noticeList();
	
	NoticeVo noticeDetail(int noticeNo);
	
	boolean noticeDelete(int noticeNo);
	
	void noticeInsert(NoticeDto noticeDto);
}