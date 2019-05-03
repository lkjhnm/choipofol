package com.cdc.service;

import java.util.List;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.PageVO;
import com.cdc.domain.ScoreDTO;

public interface ScoreBoardService {
	
	public List<ScoreDTO> getList(Long mno);
	public List<ScoreDTO> getListWithPaging(PageInfoDTO pageInfo);
	public int getTableCount(Long mno);
	public void register(ScoreDTO scoreDTO);
	public void delete(Long sno);
	public ScoreDTO read(Long sno);
}
