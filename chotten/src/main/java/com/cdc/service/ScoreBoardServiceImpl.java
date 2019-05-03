package com.cdc.service;
	
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.PageVO;
import com.cdc.domain.ScoreDTO;
import com.cdc.mapper.ScoreBoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ScoreBoardServiceImpl implements ScoreBoardService{
	
	@Setter(onMethod_= {@Autowired})
	private ScoreBoardMapper mapper;
	
	
	@Override
	public List<ScoreDTO> getList(Long mno) {
		return mapper.getList(mno);
	}
	
	@Override
	public List<ScoreDTO> getListWithPaging(PageInfoDTO pageInfo){	//한줄평 기본값 최신순
		if(pageInfo.isLatest()) {
			return mapper.getLatestList(pageInfo);	
		}else if(pageInfo.isLike()) {
			return mapper.getLikeList(pageInfo);
		}else {
			return mapper.getDislikeList(pageInfo);
		}
			
		
	}
	
	
	
	@Override
	public int getTableCount(Long mno) {
		
		return mapper.tableCount(mno);
	}
	
	@Override
	public void register(ScoreDTO scoreDTO) {
		mapper.register(scoreDTO);
	}

	@Override
	public void delete(Long sno) {
		mapper.delete(sno);
	}

	@Override
	public ScoreDTO read(Long sno) {
		return mapper.read(sno);
	}
	
	
}
