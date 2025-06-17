package com.util;

public class MyUtil {
	
	/**
	 * 전체 페이지 수 구하기
	 * @param dataCount 	총 데이터 개수
	 * @param size			한 화면에 출력할 게시물 수
	 * @return				전체 페이지 수
	 */
	public int pageCount(int dataCount, int size) {
		if(dataCount <= 0) {
			return 0;
		}
		
		return dataCount / size + (dataCount % size > 0 ? 1 : 0);
	}

	/**
	 * 페이징 처리
	 * @param current_page		현재 표시되는 페이지 번호
	 * @param total_page		전체 페이지 수
	 * @param list_url			링크를 설정할 주소
	 * @return					페이징처리 결과	
	 */
	public String paging(int current_page, int total_page, String list_url) {
		StringBuffer sb = new StringBuffer();
		
		int numPerBlock = 10;
		int currentPageSetup;
		int n, page;
		
		if(current_page < 1 || total_page < current_page) {
			return "";
		}
		
		// list_url += list_url.indexOf("?") != -1 ? "&" : "?";
		list_url += list_url.contains("?") ? "&" : "?"; // ?가 있냐없냐에 따라서 &를 붙여서 결합을 시켜야 함
		
		// currentPageSetup: 표시할 첫 페이지 - 1
		currentPageSetup = (current_page / numPerBlock) * numPerBlock; // 예를 들어서 37 페이지라고 했을 때, (37/10)*10 => 30
		
		if(current_page % numPerBlock == 0) { // % 10 == 0 이 된다는 것은 마지막 n0 페이지 라는 것이다..
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		sb.append("<div class='paginate'>");
			
		// 처음 페이지, 이전(10 페이지 전)
		n = current_page - numPerBlock;
		if(total_page > numPerBlock && currentPageSetup > 0) { // 총 페이지 수가 10이 넘지 않아서 처음 버튼을 만들 필요가 없거나.. / currentPageSetup가 0이라는 것은 첫 페이지
			sb.append("<a href='" + list_url + "page=1'>처음</a>");
			sb.append("<a href='" + list_url + "page=" + n + "'>이전</a>");
		}
		
		// 페이징
		page = currentPageSetup + 1; // 보여야하는 페이지는 11~20 이런식이기 때문에 +1을 해줘야 한다
		while(page <= total_page && page <= (currentPageSetup + numPerBlock)) {
			if(page == current_page) { // 현재 페이지는 링크를 걸면 안되고, span 태그로 만들어야 한다
				sb.append("<span>" + page + "</span>");
			} else {
				sb.append("<a href='" + list_url + "page=" + page + "'>" + page + "</a>");
			}
			page++;
		}
		
		// 다음(10페이지 후), 마지막 페이지
		n = current_page + numPerBlock;
		if(n > total_page) n = total_page; // 항상 마지막 페이지로 이동하기
		if(total_page - currentPageSetup > numPerBlock) {
			sb.append("<a href='" + list_url + "page=" + n + "'>다음</a>");
			sb.append("<a href='" + list_url + "page=" + total_page + "'>끝</a>");
		}
		
		sb.append("</div>");
		
		
		return sb.toString();
	}

}
