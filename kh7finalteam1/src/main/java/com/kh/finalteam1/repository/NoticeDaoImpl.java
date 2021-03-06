package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.NoticeDto;
import com.kh.finalteam1.vo.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeVo> noticeList() {
		return sqlSession.selectList("notice.list");
	}
	
	@Override
	public NoticeVo noticeDetail(int noticeNo) {
		return sqlSession.selectOne("notice.search", noticeNo);
	}
	
	@Override
	public boolean noticeDelete(int noticeNo) {
		int count = sqlSession.delete("notice.delete", noticeNo);
		return count>0;
	}
	
	@Override
	public void noticeInsert(NoticeDto noticeDto) {
		sqlSession.insert("notice.insert", noticeDto);
	}
	
	@Override
	public NoticeVo noticeGet(int noticeNo) {
		return sqlSession.selectOne("notice.get", noticeNo);
	}
	
	@Override
	public void noticeUpdate(NoticeDto noticeDto) {
		sqlSession.update("notice.update", noticeDto);
	}
	
	@Override
	public void noticeCount(int noticeNo) {
		sqlSession.update("notice.count", noticeNo);
	}
}
