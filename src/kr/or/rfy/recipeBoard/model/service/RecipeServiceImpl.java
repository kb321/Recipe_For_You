package kr.or.rfy.recipeBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kr.or.rfy.commons.JDBCTemplate;
import kr.or.rfy.recipeBoard.model.doa.RecipeDAO;
import kr.or.rfy.recipeBoard.model.vo.OurRecipe;
import kr.or.rfy.recipeBoard.model.vo.Recipe;

public class RecipeServiceImpl implements RecipeService {
	
	RecipeDAO rDAO = new RecipeDAO();

	@Override
	public HashMap<String, Object> selectAllPostList(int currentPage) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		//1.한페이지에 n개의 글을 가져올 것인지 설정
		int recordCountPerPage =12;
		ArrayList<OurRecipe> list =rDAO.selectAllPostPageList(conn,currentPage,recordCountPerPage);
			
		//2.해당 페이지에 필요한 네비바 생성
		// 하나의 pageNavi bar에 보여질 navi 갯수를 설정
		
		int naviCountPerPage=5;
		
		String pageNavi = rDAO.getNavi(conn,naviCountPerPage,recordCountPerPage,currentPage);
		
		JDBCTemplate.close(conn);
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("list", list);
		hm.put("pageNavi", pageNavi);
		
		return hm;
	}

}
