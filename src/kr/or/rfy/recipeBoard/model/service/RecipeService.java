package kr.or.rfy.recipeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.rfy.recipeBoard.model.vo.Recipe;

public interface RecipeService {

	HashMap<String, Object> selectAllPostList(int currentPage);

}
