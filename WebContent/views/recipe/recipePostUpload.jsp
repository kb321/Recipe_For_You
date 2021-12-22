<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/assets/css/recipePostUpload.css">
<title>냉장고를 부탁해</title>

</head>
<body>
	<div id="wrapper">
		<div class="header">
			<%@ include file="/views/commons/header.jsp"%>
		</div>
		<div id="contents">
			<h1 class="main-title">CREATE A RECIPE</h1>
			<h2 class="sub-title">여러분만의 맛있고 특별한 레시피를 공유해주세요.</h2>
			<form id="formList">
				<div class="recipeCode">
					<select name="recipe_Code">
						<option>레시피 분류</option>
						<option value="recipe_01">한식</option>
						<option value="recipe_02">양식</option>
						<option value="recipe_03">일식</option>
						<option value="recipe_04">중식</option>
						<option value="recipe_05">분식</option>
						<option value="recipe_06">채식</option>
						<option value="recipe_07">다이어트</option>
						<option value="recipe_08">밑반찬</option>
						<option value="recipe_09">안주</option>
					</select> <select name="levle_Code">
						<option value>난이도</option>
						<option value="levle_01">초급</option>
						<option value="levle_02">중급</option>
						<option value="levle_03">고급</option>
					</select> <select name="time_Code">
						<option value>조리시간</option>
						<option value="time_01">10분</option>
						<option value="time_02">20분</option>
						<option value="time_03">30분</option>
						<option value="time_04">40분</option>
						<option value="time_05">50분</option>
						<option value="time_06">60분이상</option>
					</select>
				</div>
				<div id="thumbnail">
					<label for="thumbnailImage"><div id="thumbnailUpload">
						</div></label>
				</div>
				<div class="recipeContent">
					<input type=text name="title" class="recipeContentInput"
						placeholder="레시피 제목을 입력해주세요" /></br> <input type=text name="subTitle"
						class="recipeContentInput" maxlength="20"
						placeholder="레시피를 간단히 설명해주세요(20자 이내)" /></br>
				</div>
				<hr style="width: 650px; margin: 0 auto; margin-top: 15px;">
				<div id="ingredient" class="titleArea">
					<span>재료</span> <select name="big_Code">
						<option value>대분류</option>
						<option value="product_01">반찬/김치</option>
						<option value="product_02">정육/계란</option>
						<option value="product_03">수산/해산/건어물</option>
						<option value="product_04">채소/과일</option>
						<option value="product_05">견과/쌀</option>
						<option value="product_06">면류</option>
						<option value="product_07">간편식/조리식품</option>
						<option value="product_08">과일청/잼</option>
						<option value="product_09">디저트</option>
						<option value="product_10">장류/조미료</option>
						<option value="product_11">유제품</option>
					</select> <select name="middle_Code">
						<option value>중분류</option>
					</select> <select name="ingredient_Code" id="ingredient_Code">
						<option value>소분류</option>
						<option value="kimchi">김치</option>
						<option value="pork_neck">목살</option>
						<option value="eggplant">가지</option>
						<option value="potato">감자</option>
						<option value="apple">사과</option>
					</select> <input type="text" maxlength="10" name="ingredient_Num"
						id="ingredient_Num" placeholder="계량 정보 / 예)300g" />
					<button id="ingredientBtn" type="button">추가</button>
				</div>
				<div id="idgredientContent" style="width: 650px; margin: 10px auto;">
					<ul id="ingredientList" style="margin: 0px; padding: 0px;">
						<li>돼지고기 <span>300g</span>
						</li>
						<li>청주 <span>한 큰술</span>
						</li>
					</ul>
				</div>

				<script>
					$('#ingredientBtn')
							.click(
									function() {

										var $ingredientSelect = $('#ingredient_Code option:selected');
										var ingredient = $ingredientSelect
												.text();
										var $ingredient_Num = $(
												'#ingredient_Num').val();
										var liTag = document
												.createElement("li");
										var spanTag = document
												.createElement("span");

										spanTag.innerHTML = $ingredient_Num;
										liTag.innerHTML = ingredient;
										liTag.appendChild(spanTag);

										if (ingredient != "소분류"
												&& $ingredient_Num.length > 0) {
											$('#ingredientList')[0]
													.appendChild(liTag);
										} else {
											alert("재료 및 계랑 정보를 입력해주세요.");
										}
										;
									})
				</script>
				<div id="recipeStep" class="titleArea">
					<span>조리법</span>
					<button type="button" id="stepBtn">Step 추가</button>
				</div>
				<div id="stepArea" style="width: 650px; margin: 20px auto;">
					<div id="stepItem_1" class="step">
						<p>Step1</p>
						<label for="recipeImage_1">
						<div id="stepImage_1" class="stepImage" style="margin-right: 5px;"></div>
						</label>
						<div id="stepText_1" class="stepText">
							<textarea id="step_text_1" class="stepText"
								placeholder="조리법을 설명해주세요" style="resize: none;"></textarea>
						</div>
					</div>
				</div>
				<div id="recipeUpload">
				<input type="submit" value="작성하기"/>
				<button type="button"><a href="/">취소</a></button>
				</div>
			</form>
			<form id="fileUpload">
				<input type="file" id="thumbnailImage" style="display: none;" /> <input
					type="file" id="recipeImage_1" style="display: none;" />
			</form>

			<script>
				var count = 2;

				$('#stepBtn').click(function() {

					var parentDiv = document.createElement("div");
					var imageDiv = document.createElement("div");
					var textDiv = document.createElement("div");
					var pTag = document.createElement("p");
					var labelTag = document.createElement("label");
					var textareaTag = document.createElement("textarea");
					var inputTag = document.createElement("input");

					parentDiv.id = "stepItem_" + count;
					parentDiv.setAttribute("class", "step");
					pTag.innerText = "Step" + count;
					labelTag.setAttribute("for", "recipeImage_" + count);
					imageDiv.setAttribute("id", "stepImage_" + count)
					imageDiv.setAttribute("class", "stepImage");
					labelTag.appendChild(imageDiv);
					textDiv.setAttribute("id", "stepText_" + count)
					textDiv.setAttribute("class", "stepText");
					textareaTag.setAttribute("id", "step_text_" + count)
					textareaTag.setAttribute("class", "stepText");
					textareaTag.setAttribute("placeholder", "조리법을 설명해주세요");
					textareaTag.setAttribute("style", "resize:none");
					textDiv.appendChild(textareaTag);
					parentDiv.appendChild(pTag);
					parentDiv.appendChild(labelTag);
					parentDiv.appendChild(textDiv);
					console.log(parentDiv);

					inputTag.setAttribute("type", "file");
					inputTag.setAttribute("id", "recipeImage_" + count);
					inputTag.setAttribute("style", "display:none");

					$('#stepArea')[0].appendChild(parentDiv);
					$('#fileUpload')[0].appendChild(inputTag);
					count++;
				})
			</script>
		</div>
		<div id="footer">
				<%@ include file="/views/commons/footer.jsp"%>
			</div>
</body>
</html>