package com.cdc.mapper;

import java.util.List;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ScoreDTO;

public interface ScoreBoardMapper {
	
	public List<ScoreDTO> getList(Long mno);
	public List<ScoreDTO> getLatestList(PageInfoDTO pageInfo);
	public List<ScoreDTO> getLikeList(PageInfoDTO pageInfo);
	public List<ScoreDTO> getDislikeList(PageInfoDTO pageInfo);
	public int tableCount(Long mno);
	public void register(ScoreDTO scoreDTO);
	public void delete(Long sno);
	public ScoreDTO read(Long sno);
	public List<Integer> getTotalScore();
	public int getTotalCount();	//나중에 영화번호를 통해서 카운트하는 메서드로 변환해야한다.
}
