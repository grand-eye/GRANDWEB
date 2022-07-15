<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <title>title</title>
<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>    
     <script type="text/javascript">
     	$(document).ready(function(){
            // 옵션추가 버튼 클릭시
            $("#addItemBtn").click(function(){
                var cloneTr = $("#fileTable tr:eq(1)");
                var newitem = cloneTr.clone();
                newitem.find("input:text").each(function() {
                    this.value = "";
                });
                newitem.find("input[name='idxArry']").val("0");
                newitem.find(".delBtn").removeAttr("disabled");
                $("#fileTable").append(newitem);
            });
            
         	// 삭제버튼 클릭시
           $(".delBtn").live("click", function(){
                var clickedRow = $(this).parent().parent();
                clickedRow.remove();
            });
         	
        	// 저장버튼 클릭시
           $('.submitData').click(function(e) {
        	   var dataNm = "";
	    	   var datacnt = 0;
	    	   var datachak = "Y";
	    	   $("#fileTable tr").each(function() {
		    	    $(this).find("input:text").each(function() {
		    			if($(this).val() == "") {
		    				if(dataNm == "") { dataNm = $(this).attr("data-nm"); }
		    				datachak = "N";
		    			} else {
		    				datacnt++;
	    				}
		    			
		    			if(datacnt > 0 && datachak == "N") {
		    				alert(dataNm + '을 입력해주세요.');
			    	    	return false; 
			    	    }
		    		}); 
		    	    if(datacnt > 0 && datachak == "N") {
			    	    return false; 
		    	    } else {
		    	    	datacnt = 0;
		        	    datachak = "Y";
		    	    }
	    	    }); 

	    	    if(confirm("저장하시겠습니까?")) {
	    	    	$.ajax({
	    	             type: 'post',
	    	             url: '/setFileInfo',
	    	             data: $('#frm').serialize(),
	    	             success: function () {
	    	              alert("저장되었습니다.");
	    	              location.reload();
	    	             }
	    	           });
	    	       e.preventDefault();
	    	    }
           });
        });
    </script>


</head>
<body>
	<form name="frm" id="frm" method="post" onsubmit="return false">
		<button type="button" id="addItemBtn">카데고리 추가</button>
		<table id="fileTable" border="1px">
			<thead>
			    <tr>
			        <th>카데고리코드</th>
			        <th>카데고리명</th>
			        <th>파일경로</th>
			        <th>파일확장자</th>
			        <th>파일사이즈</th>
			        <th>삭제</th>
			    </tr>
			</thead>
			<tbody>
			    <c:forEach items="${fileInfoList}" var="file">
			        <tr>
			            <td>
			            	<input type="hidden" name="idxArry" value="${file.idx}">
			            	<input type="text" name="cateCode" value="${file.cateCode}" data-nm="카데고리코드">
		            	</td>
			            <td><input type="text" name="cateNm" value="${file.cateNm}" data-nm="카데고리명"></td>
			            <td><input type="text" name="filePath" value="${file.filePath}" data-nm="파일경로"></td>
			            <td><input type="text" name="fileExt" value="${file.fileExt}" data-nm="파일확장자"></td>
			            <td><input type="text" name="fileSize" value="${file.fileSize}" data-nm="파일사이즈"></td>
			            <td><button type="button" class="btn btn-default delBtn" disabled="disabled">삭제</button></td>
			        </tr>
			    </c:forEach>
			    <c:if test="${empty fileInfoList && fileInfoList.size() == 0}" >
				    <tr>
			            <td>
			            	<input type="hidden" name="idxArry" value="0">
			            	<input type="text" name="cateCode" value="" data-nm="카데고리코드">
		            	</td>
			            <td><input type="text" name="cateNm" value="" data-nm="카데고리명"></td>
			            <td><input type="text" name="filePath" value="" data-nm="파일경로"></td>
			            <td><input type="text" name="fileExt" value="" data-nm="파일확장자"></td>
			            <td><input type="text" name="fileSize" value="" data-nm="파일사이즈"></td>
			            <td><button type="button" class="btn btn-default delBtn">삭제</button></td>
			        </tr>
		        </c:if>
		    </tbody>
		</table>
		<!--<button type="button" class="btn btn-default" onclick="submit_form();">저장</button>-->
	    <button type="button" class="btn btn-default submitData">저장</button>
	</form>
</body>
</html>


