package kr.or.rfy.recipeBoard.model.vo;

public class OurRecipe {

	private int boardNo;
	private String title;
	private String subTitle;
	private String levelName;
	private String timeName;
	private String filePath;
	
	public OurRecipe() {
		super();
	}


	public OurRecipe(int boardNo, String title, String subTitle, String levelName, String timeName, String filePath) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.subTitle = subTitle;
		this.levelName = levelName;
		this.timeName = timeName;
		this.filePath = filePath;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getSubTitle() {
		return subTitle;
	}


	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}


	public String getLevelName() {
		return levelName;
	}


	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}


	public String getTimeName() {
		return timeName;
	}


	public void setTimeName(String timeName) {
		this.timeName = timeName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
	
	
}
