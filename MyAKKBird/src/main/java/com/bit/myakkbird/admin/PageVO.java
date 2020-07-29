package com.bit.myakkbird.admin;

public class PageVO {
	private int pageSize;           // 한 페이지에 보여줄 게시글 수
    private int pageBlock;          // 페이징 네비[블록] 사이즈
    private int pageNo;             // 페이지 번호
    private int startRowNo;         // 조회 시작 row 번호
    private int endRowNo;           // 조회 마지막 now 번호
    private int firstPageNo;        // 첫 번째 페이지 번호
    private int finalPageNo;        // 마지막 페이지 번호
    private int prevPageNo;         // 이전 페이지 번호
    private int nextPageNo;         // 다음 페이지 번호
    private int startPageNo;        // 시작 페이지 (페이징 네비 기준)
    private int endPageNo;          // 끝 페이지 (페이징 네비 기준)
    private int totalCount;         // 게시 글 전체 수

    private String searchFiled;     // 검색 조건
    private String searchValue;     // 검색어
    private String m_statusFiled;   // 탈퇴 체크
    private String m_statusValue;   // 탈퇴 값
    private String m_typeFiled;     // 회원 유형 체크
    private String m_typeValue;     // 회원 값
    private String d_statusFiled;   // 신고 처리 체크
    private String d_statusValue;   // 신고 처리 값
    private String d_typeFiled;     // 신고 타입 체크
    private String d_typeValue;     // 신고 타입 값
    private String a_applyFiled;    // 매칭 타입 체크
    private String a_applyValue;    // 매칭 타입 값

	public String getM_typeFiled() {
		return m_typeFiled;
	}

	public void setM_typeFiled(String m_typeFiled) {
		this.m_typeFiled = m_typeFiled;
	}

	public String getM_typeValue() {
		return m_typeValue;
	}

	public void setM_typeValue(String m_typeValue) {
		this.m_typeValue = m_typeValue;
	}

	public String getM_statusFiled() {
		return m_statusFiled;
	}

	public void setM_statusFiled(String m_statusFiled) {
		this.m_statusFiled = m_statusFiled;
	}

	public String getM_statusValue() {
		return m_statusValue;
	}

	public void setM_statusValue(String m_statusValue) {
		this.m_statusValue = m_statusValue;
	}

	public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageBlock() {
        return pageBlock;
    }

    public void setPageBlock(int pageBlock) {
        this.pageBlock = pageBlock;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getStartRowNo() {
        return startRowNo;
    }

    public void setStartRowNo(int startRowNo) {
        this.startRowNo = startRowNo;
    }

    public int getEndRowNo() {
        return endRowNo;
    }

    public void setEndRowNo(int endRowNo) {
         this.endRowNo = endRowNo;
    }

    public int getFirstPageNo() {
        return firstPageNo;
    }

    public void setFirstPageNo(int firstPageNo) {
        this.firstPageNo = firstPageNo;
    }

    public int getFinalPageNo() {
        return finalPageNo;
    }

    public void setFinalPageNo(int finalPageNo) {
        this.finalPageNo = finalPageNo;
    }

    public int getPrevPageNo() {
        return prevPageNo;
    }

    public void setPrevPageNo(int prevPageNo) {
        this.prevPageNo = prevPageNo;
    }

    public int getNextPageNo() {
        return nextPageNo;
    }

    public void setNextPageNo(int nextPageNo) {
        this.nextPageNo = nextPageNo;
    }

    public int getStartPageNo() {
        return startPageNo;
    }

    public void setStartPageNo(int startPageNo) {
        this.startPageNo = startPageNo;
    }

    public int getEndPageNo() {
        return endPageNo;
    }

    public void setEndPageNo(int endPageNo) {
        this.endPageNo = endPageNo;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.makePaging();
    }
 
    public String getSearchFiled() {
        return searchFiled;
    }

    public void setSearchFiled(String searchFiled) {
        this.searchFiled = searchFiled;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }
    
    public String getD_statusFiled() {
		return d_statusFiled;
	}

	public void setD_statusFiled(String d_statusFiled) {
		this.d_statusFiled = d_statusFiled;
	}

	public String getD_statusValue() {
		return d_statusValue;
	}

	public void setD_statusValue(String d_statusValue) {
		this.d_statusValue = d_statusValue;
	}

	public String getD_typeFiled() {
		return d_typeFiled;
	}

	public void setD_typeFiled(String d_typeFiled) {
		this.d_typeFiled = d_typeFiled;
	}

	public String getD_typeValue() {
		return d_typeValue;
	}

	public void setD_typeValue(String d_typeValue) {
		this.d_typeValue = d_typeValue;
	}

	public String getA_applyFiled() {
		return a_applyFiled;
	}

	public void setA_applyFiled(String a_applyFiled) {
		this.a_applyFiled = a_applyFiled;
	}

	public String getA_applyValue() {
		return a_applyValue;
	}

	public void setA_applyValue(String a_applyValue) {
		this.a_applyValue = a_applyValue;
	}

	private void makePaging() {
  
        // 기본 값 설정
        if (this.totalCount == 0) return; 
        if (this.pageNo == 0) this.setPageNo(1);   //기본 페이지 번호
        if (this.pageSize == 0) this.setPageSize(6); //기본 페이지 리스트 사이즈
        if (this.pageBlock == 0 ) this.setPageBlock(10); //기본 페이지 네비[블록] 사이즈
        
        //--[첫 페이지], [마지막 페이지] 계산
        int finalPage = (totalCount + (pageSize - 1)) / pageSize; // 마지막 페이지
        this.setFirstPageNo(1);   // 첫 번째 페이지 번호
        this.setFinalPageNo(finalPage); // 마지막 페이지 번호
        
        //-- [이전] , [다음] 페이지 계산
        boolean isNowFirst = pageNo == 1 ? true : false;    // 시작 페이지 (전체)
        boolean isNowFinal = pageNo == finalPage ? true : false;  // 마지막 페이지 (전체)
        if (isNowFirst) {
            this.setPrevPageNo(1); // 이전 페이지 번호
        } else {
            this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // 이전 페이지 번호
        }
        if (isNowFinal) {
            this.setNextPageNo(finalPage); // 다음 페이지 번호
        } else {
            this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // 다음 페이지 번호
        }
                
        //-- 페이징 네비[블록]을 계산
        int startPage = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 시작 페이지 (페이징 네비 기준)
        int endPage = startPage + pageBlock - 1;      // 끝 페이지 (페이징 네비 기준)

        // 페이징 네비가 만약 [20-30] 인데 마지막 페이지가 28 인 경우 
        // [29, 30] 페이지는 페이징 네비에 미노출 해야 한다.
        if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우 
            endPage = finalPage;  
        }
        this.setStartPageNo(startPage); // 시작 페이지 (페이징 네비 기준)
        this.setEndPageNo(endPage);  // 끝 페이지 (페이징 네비 기준)

        //--조회 시작 row, 조회 마지막 row 계산
        int startRowNo = ( (pageNo-1) * pageSize ) + 1;
        int endRowNo = pageNo * pageSize; 
        setStartRowNo( startRowNo );
        setEndRowNo( endRowNo );
    }


}