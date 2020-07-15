package com.bit.myakkbird.review;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	// 리뷰 작성
	@RequestMapping("/writeReview3.ak")
	public String writeReview(MultipartHttpServletRequest request, ReviewVO reviewVO) throws Exception {				
		List<MultipartFile> fileList = request.getFiles("file1");
		MultipartFile a = fileList.get(0);
		
		if(!(a.isEmpty()) || a.getSize() !=0) { // 첨부파일 비어있지 않으면(= 첨부파일 있으면)
			String uploadPath = "C:\\Project156\\myakkbirdUpload\\";
			StringBuilder allFiles = new StringBuilder("");
			for (MultipartFile mf : fileList) {
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
				mf.transferTo(new File(uploadPath + storedFileName));
				allFiles.append(storedFileName).append(",");
			}
			String af = (allFiles.deleteCharAt(allFiles.length() - 1)).toString();
			reviewVO.setR_up_file(af);
		}else{ // 첨부파일 없을 경우 
			reviewVO.setR_up_file("");
		}
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String today = sdf.format(date);
		reviewVO.setR_date(today);

		reviewService.writeReview(reviewVO);
	
		String r_id = reviewVO.getR_id();
		return "redirect:/profile.ak?id="+ r_id;

	}
	
	// 리뷰 수정 모달창을 위한 원래 값 불러오기
	@RequestMapping(value = "modifyReview.ak", method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ReviewVO getReview(@RequestParam(value="r_num") int r_num, Model model) {
		ReviewVO reviewVO = reviewService.getReview(r_num);
		return reviewVO;
	}
	
	// 리뷰 수정작업
	@RequestMapping("/modifyReviewProcess.ak")
	public String modifyReview(ReviewVO reviewVO) {
		reviewService.modifyReview(reviewVO);
		ReviewVO vo = reviewService.getReview(reviewVO.getR_num());
		
		return "redirect:profile.ak?id="+ vo.getR_id();
	}
	
	// 리뷰 삭제
	@RequestMapping("/deleteReview.ak")
	public String deleteReview(int r_num) {
		ReviewVO vo = reviewService.getReview(r_num);
		String r_id = vo.getR_id();

		reviewService.deleteLiketo(r_num); // 해당 리뷰에 좋아요 먼저 지우고
		reviewService.deleteReview(r_num); // 해당 리뷰 삭제

		return "redirect:profile.ak?id="+r_id;
	}
	
	// 리뷰 좋아요
	@RequestMapping(value = "/likeReview.ak", method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> likeReview(@RequestParam(value="r_num") int r_num, HttpSession session) {
		String m_id = (String)session.getAttribute("m_id");

		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("r_num",r_num);
		hashmap.put("m_id", m_id);
		
		reviewService.likeReview(hashmap);  // liketo 테이블에 새로운 데이터 추가
		reviewService.updateR_like(r_num); // review 테이블에 r_like수 업데이트
		ReviewVO reviewVO = reviewService.getReview(r_num);

		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("res", "OK");
		retVal.put("like_cnt", reviewVO.getR_like_cnt());

		return retVal;	
	}
	
	// 리뷰 좋아요 취소
	@RequestMapping(value = "/unlikeReview.ak", method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> unlikeReview(@RequestParam(value="r_num") int r_num, HttpSession session) {
		String m_id = (String)session.getAttribute("m_id");
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("r_num",r_num);
		hashmap.put("m_id",m_id);
		
		reviewService.unlikeReview(hashmap);
		reviewService.updateR_unlike(r_num);
		ReviewVO reviewVO = reviewService.getReview(r_num);

		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("res", "OK");
		retVal.put("like_cnt", reviewVO.getR_like_cnt());
		
		return retVal;
	}
	
}
