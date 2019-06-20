package com.cdc.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReviewImgDTO;
import com.cdc.domain.ReviewVO;
import com.cdc.mapper.ReviewBoardMapper;

import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Data
public class ReviewBoardServiceImpl implements ReviewBoardService{
	
	@Setter(onMethod_= {@Autowired})
	private ReviewBoardMapper mapper;

	@Override
	public List<ReviewVO> getList(PageInfoDTO pageInfo,boolean reviewlike) {
		return mapper.getList(pageInfo,reviewlike);
	}
	
	@Override
	public int count(Long mno, boolean reviewlike) {
		return mapper.count(mno,reviewlike);
	}
	
	
	@Override
	@Transactional
	public void register(ReviewVO reviewVO,List<ReviewImgDTO> imgDTO) {
		mapper.register(reviewVO);
		
		for(ReviewImgDTO img : imgDTO) {
			img.setRvno(reviewVO.getRvno());
		}
		if(imgDTO.size() != 0) {
			mapper.upload(imgDTO);
		}
	}
	
	@Override
	public ReviewVO getReview(Long rvno) {
		return mapper.getReview(rvno);
	}
	
	@Override
	@Transactional
	public void modify(ReviewVO reviewVO,List<ReviewImgDTO> imgList) {
		Long rvno = reviewVO.getRvno();
		mapper.modify(reviewVO);
		mapper.deleteImg(rvno);
		
		for(ReviewImgDTO img : imgList) {
			img.setRvno(rvno);
		}	
		if(imgList.size() != 0) {
			mapper.upload(imgList);
		}
	}
	
	@Override
	@Transactional
	public void delete(Long rvno) {
		mapper.deleteImg(rvno);
		mapper.delete(rvno);
	}

	@Override
	public String upload(MultipartFile uploadFile) {
		
		String originName = uploadFile.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		String uploadPath = getUploadPath().replaceAll("\\\\", "/");	//역슬러시 json 파싱 오류
		
		String url = "/review/showImg?fileName="+(uuid+"_"+originName)+"&uploadPath="+uploadPath;
		String jsonStr ="{\"fileName\" : \""+(uuid+"_"+originName)+"\", \"uploaded\":1 , \"url\" : \""+url+"\" }";

		
		File imgFile = new File(uploadPath, uuid+"_"+originName);
		
		try {
			uploadFile.transferTo(imgFile);			
			return jsonStr;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	
	@Override
	@Scheduled(cron = "0 0 2 * * 7")
	public void clean() {
		log.info("스케쥴러 동작------------------");
		for(Long i =1l; i<=7l; i++) {
			List<ReviewImgDTO> imgList = mapper.cleanList(i);
			delUseless(imgList);
		}
	}
	
	private void delUseless(List<ReviewImgDTO> imgList) {
		if(imgList.size() == 0 ) {
			return;
		}
		List<String> fileNames = new ArrayList<>();
		
		for(ReviewImgDTO imgFile : imgList) {
			String name = imgFile.getUuid()+"_"+imgFile.getFileName();
			fileNames.add(name);
		}
		
		String uploadPath = imgList.get(0).getUploadPath();
		
		File[] files = new File(uploadPath).listFiles();
		
		for(File file : files) {
			if(fileNames.contains(file.getName()) == false) {
				file.delete();
			};
		}
	}
	
	private String getUploadPath() {
		String uploadPath = "D:\\upload\\";	// 로컬 저장경로 부모위치
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String folderPath = (df.format(date)).replace("-",File.separator);	// 로컬 저장경로 파일 구분을 위한 폴더 경로
		
		File uploadFolder = new File(uploadPath,folderPath);		//이미지를 저장할 폴더 생성
		
		if(!uploadFolder.exists()) {
			uploadFolder.mkdirs();
		}
		return uploadPath + folderPath;
	}

	
}
