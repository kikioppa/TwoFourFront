package culturelandFront.core.tld;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.util.PropUtil;

public class PagingTag extends TagSupport {
	
	private static final long serialVersionUID = 1L;

	private ListHelper listHelper;
	
	private String cssClass = "pagenation";	// 페이징 div 클래스
	
	private String firstIcon = "first";			// 처음으로 아이콘
		
	private String prevIcon = "prev";			// 이전 아이콘
	
	private String nextIcon = "next";			// 다음 아이콘
	
	private String lastIcon = "end";			// 마지막으로 아이콘
	
	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	
	public ListHelper getListHelper() {
		return listHelper;
	}

	public void setListHelper(ListHelper listHelper) {
		this.listHelper = listHelper;
	}

	/** @return the firstIcon */
	public String getFirstIcon() {
		if( NdnUtil.isEmpty(firstIcon) ) {
			return "";
		} else {
			return this.firstIcon; 
		}	
	}

	/** @param firstIcon the firstIcon to set */
	public void setFirstIcon(String firstIcon) {
		this.firstIcon = firstIcon;
	}

	/** @return the prevIcon */
	public String getPrevIcon() {
		if( NdnUtil.isEmpty(prevIcon) ) {
			return "이전";
		} else {
			return this.prevIcon; 
		}
	}

	/** @param prevIcon the prevIcon to set */
	public void setPrevIcon(String prevIcon) {
		this.prevIcon = prevIcon;
	}

	/** @return the nextIcon */
	public String getNextIcon() {
		if( NdnUtil.isEmpty(nextIcon) ) {
			return "다음";
		} else {
			return this.nextIcon; 
		}
	}

	/** @param nextIcon the nextIcon to set */
	public void setNextIcon(String nextIcon) {
		this.nextIcon = nextIcon;
	}

	/** @return the lastIcon */
	public String getLastIcon() {
		if( NdnUtil.isEmpty(lastIcon) ) {
			return "";
		} else {
			return this.lastIcon; 
		}
	}

	/** @param lastIcon the lastIcon to set */
	public void setLastIcon(String lastIcon) {
		this.lastIcon = lastIcon;
	}


	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		String contextPath = pageContext.getServletContext().getContextPath();
		ServletRequest request = pageContext.getRequest();
		
		String baseImgPath = contextPath + "/images";
		
		int totalCount 	= listHelper.getTotalCount();
		int curPage 	= listHelper.getCurPage();
		int cntPerPage 	= listHelper.getCntPerPage();
		int cntPerblock = 10;		
		
		
		String url = "";
		String queryString = "";
		
		url = listHelper.getCurUrl();
		if( !NdnUtil.isEmpty(listHelper.getUrlParam()) )  {
			queryString = "&amp;" + listHelper.getUrlParam();
		} 
		
		try {
			
			int totalPage = 0;
			int blockNum = 0;
			int totalBlock = 0;

			// 페이지 설정에 필요한 값 연산
			if ( totalCount > 0) {

				if ( totalCount % cntPerPage == 0) {
					totalPage = (int) ( totalCount / cntPerPage);
				} else {
					totalPage = (int) ( totalCount / cntPerPage) + 1;
				}
			
				if ( curPage % cntPerblock == 0) {
					blockNum = (int)(curPage/cntPerblock);
				} else {
					blockNum = (int)(curPage/cntPerblock)+1;
				}
				
				if (totalPage % cntPerblock == 0) {
					totalBlock = (int) (totalPage / cntPerblock);
				} else {
					totalBlock = (int) (totalPage / cntPerblock) + 1;
				}
			}
		
			

			
			StringBuffer pageBuf = new StringBuffer();
			pageBuf.append("<div class=\"" + this.cssClass + "\">\n");
			
			
			
			if (totalPage > 0) {
				
				pageBuf.append("<span class='page-arrow'>");
				
						// 처음으로
						pageBuf.append("<a href='#' class='arrow first btn-icon m-icon' ")				
											.append(" onclick='go_paging(1)'  >")
										.append( getFirstIcon() + "</a>\n");
		
						
						// 이전
						if (blockNum > 1) {
						
							pageBuf.append("<a href='#' class='arrow prev btn-icon m-icon' ")				
												.append(" onclick='go_paging(").append((blockNum-2) * cntPerblock +1).append(")'  >")
											.append( getPrevIcon() + "</a>\n");
							
						} else {
							
							pageBuf.append("<a href='#' class='arrow prev btn-icon m-icon' >")
											.append( getPrevIcon() + "</a>\n");
						}
				
				
				pageBuf.append("</span>");
				pageBuf .append("<ul class='page-num'>");
				
				// 페이지 
				for (int i = ((blockNum - 1) * cntPerblock + 1); i <= (blockNum * cntPerblock); i++) {
					if (i > totalPage) {
						break;
					} else {
						if (i != curPage) {
							pageBuf.append("<li><a href='#' ")				
												.append(" onclick='go_paging(").append(i).append(")'  >").append(i)
											.append( "</a></li>\n");
							
						} else {
							pageBuf.append("<li class='on'><a href='#'  class='on' >").append(i).append("</a></li>\n");
						}
					}
				}
				
				pageBuf.append("</ul>");
				pageBuf.append("<span class='page-arrow'>");
				
						// 다음
						if (blockNum != totalBlock) {					
							pageBuf.append("<a href='#' class='arrow next btn-icon m-icon' ")				
												.append(" onclick='go_paging(").append((blockNum * cntPerblock + 1)).append(")'  >")
											.append( getNextIcon() + "</a>\n");					
						} else {								
							pageBuf.append("<a href='#' class='arrow next btn-icon m-icon' >")
											.append( getNextIcon() + "</a>\n");
						}
						
						// 마지막으로
						pageBuf.append("<a href='#' class='arrow end btn-icon m-icon' ")				
											.append(" onclick='go_paging(").append(totalPage).append(")'  >")
										.append( getLastIcon() + "</a>\n");
//						
				
				
				pageBuf.append("</span>");
				
				
			}
			pageBuf.append("</div>");
			
			
			out.println(pageBuf.toString());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

}
