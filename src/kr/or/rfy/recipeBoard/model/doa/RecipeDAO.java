package kr.or.rfy.recipeBoard.model.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.rfy.commons.JDBCTemplate;
import kr.or.rfy.recipeBoard.model.vo.OurRecipe;
import kr.or.rfy.recipeBoard.model.vo.Recipe;

public class RecipeDAO {

	public ArrayList<OurRecipe> selectAllPostPageList(Connection conn, int currentPage, int recordCountPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OurRecipe> list = new ArrayList<OurRecipe>();
		
		//글번호의 시작과 끝번호
		 int start = currentPage * recordCountPerPage - (recordCountPerPage-1);
		 int end  = currentPage * recordCountPerPage;
		 
		 String query="SELECT * " + 
				 		"FROM(SELECT ROW_NUMBER()OVER(ORDER BY R.BOARD_NO DESC) AS NUM,R.BOARD_NO,R.SUBTITLE,R.TITLE,L.LEVEL_NAME,C.TIME_NAME,F.FILE_PATH " + 
				 		"FROM RECIPE_BOARD R " + 
				 		"LEFT JOIN COOK_TIME C ON(C.TIME_CODE=R.TIME_CODE) " + 
				 		"LEFT JOIN RECIPE_LEVEL L ON(L.LEVEL_CODE=R.LEVEL_CODE) " + 
				 		"LEFT JOIN RECIPE_FILE F ON(F.BOARD_NO=R.BOARD_NO) " + 
				 		"WHERE R.END_YN='N' AND F.FILE_NO=1) " + 
				 		"WHERE NUM BETWEEN ? AND ?";
				
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				OurRecipe o = new OurRecipe();
				
				o.setBoardNo(rset.getInt("board_no"));
				o.setTitle(rset.getString("title"));
				o.setSubTitle(rset.getString("subTitle"));
				o.setLevelName(rset.getString("level_name"));
				o.setTimeName(rset.getString("time_name"));
				o.setFilePath(rset.getString("file_path"));
				
				list.add(o);
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
			return list;
	}

	public String getNavi(Connection conn, int naviCountPerPage, int recordCountPerPage, int currentPage) {
		
		//1. 전체 몇개의 글이 있는지 확인
		int recordTotalCount = totalCount(conn);
		
		//2. 전체페이지 갯수 확인
		int pageTotalCount=0;
		if((recordTotalCount % recordCountPerPage)>0)
		{
			pageTotalCount=(recordTotalCount/recordCountPerPage)+1;
		}else
		{
			pageTotalCount=recordTotalCount/recordCountPerPage;
		}
		
		//3. 현재 페이지에 보여지는 네비 모양 만들기
		int startNavi = (((currentPage-1)/naviCountPerPage) * naviCountPerPage)+1;
		int endNavi = startNavi +(naviCountPerPage -1);
		
		//4. 예외상황-> endNavi가 pageTotalCount보다 크다면 endNavi를 pageTotalCount로 설정하기
		
		if(endNavi>pageTotalCount)
		{
			endNavi=pageTotalCount;
		}
		
		//5. 페이지 네비 모양 만들기
		
		StringBuilder sb = new StringBuilder();
		
		
		
		
		
		sb.append("<nav aria-label=Page navigation example'>");
		sb.append("<ul class='pagination justify-content-center'>");
		sb.append("<li class='page-item'>");
		

		if(startNavi!=1)
		{	sb.append("<a class='page-link' href='");
			sb.append("/recipe/recipeBoard/selectAll.do?currentPage=");
			sb.append((startNavi-1));
			sb.append("' aria-label='Previous'>");
			sb.append("<span aria-hidden='true'>< prev</span>");
			sb.append("</a>");
		}
		
	
		sb.append("</li>");
		    for(int i=startNavi; i<=endNavi; i++)
			{
				sb.append("<li class='page-item'><a class='page-link' style='color:black' href='#'>");
				sb.append(i);
				sb.append("</a>");
				sb.append("</li>");
			}
			
		   sb.append("<li class='page-item'>");
		   
		   
		   if(endNavi!=pageTotalCount)
		   {   sb.append("<a class='page-link' href='");
		   		sb.append("/recipe/recipeBoard/selectAll.do?currentPage=");
				sb.append((endNavi+1));
		   		sb.append("' aria-label='Next'>");
			   sb.append("<span aria-hidden='true'> Next ></span>");
		   }
		  
		   sb.append("</a>");
		   sb.append("</li>");
		   sb.append("</ul>");
		   sb.append("</nav>");
	
			return sb.toString();
	}

	private int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count=0;
		
		String query="SELECT COUNT(*) AS COUNT FROM RECIPE_BOARD WHERE END_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			if(rset.next())
			{
				count=rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}
		
	
	
	
}
