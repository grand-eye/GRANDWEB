<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function () {
	// 검색어 입력 영역 엔터키 처리
	setTimeout(function () {
		var $t = $('#search_box${_prefix}');
		$t.textbox('textbox').on("keydown", function (e) {
			if (e.keyCode == 13) {
				$t.textbox("getIcon", 0).trigger("click");				
			}
		});
	}, 1000);	// 도저히 EasyUI textbox의 onLoad 잡을 방법을 못찾겠다!!
});
</script>