<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="messageBody">

	<h1>Drag and Drop Rows in TreeGrid</h1>
	<table title="Folder Browser" id="tt_code" class="easyui-treegrid" style="width:700px;height:250px">
		<thead>
			<tr>
				<th data-options="field:'id'" 			width="20%">CodeID</th>			
				<th data-options="field:'name'" 	width="20%">명칭</th>
				<th data-options="field:'attr1'" 	width="12%">값</th>
				<th data-options="field:'attr2'" 	width="12%">속성1</th>
				<th data-options="field:'attr3'" 	width="12%">속성2</th>
				<th data-options="field:'attr4'" 	width="12%">속성3</th>
				<th data-options="field:'attr5'" 	width="12%">속성4</th>
				
			</tr>
		</thead>
	</table>

	<div id="tb_code" style="height:auto">
		<a href="javascript:void(0)" class="easyui-linkbutton testCodeBtn" data-options="iconCls:'icon-add',plain:true"   >메세지코드 추가</a>
		
	</div>
		
	<script type="text/javascript" src="/admin/js/treegrid-dnd.js"></script>
	<script type="text/javascript">
		var data = [
			  {
				    "id": "1",
				    "name": "test",
				    "attr1": "attr1" ,
				    "attr2": "attr1" ,
				    "attr3": "attr1" ,
				    "attr4": "1" ,
				    
				    "children":[
				      {
				        "id": "11",
				        "name": "test2",
				        "attr1": "attr1",
				        "attr2": "attr1",
				        "attr3": "attr1",
				        "attr4": "11"
				      }   
				      ,
				      {
				        "id": "12",
				        "name": "test3",
				        "attr1": "attr1",
				        "attr2": "attr1",
				        "attr3": "attr1",
				        "attr4": "12"
				      }   
				      ,
				      {
				        "id": "13",
				        "name": "test4",
				        "attr1": "attr1",
				        "attr2": "attr1",
				        "attr3": "attr1",
				        "attr4": "13"
				      }      
				    ]
				  }
				]
	</script>	

	
	<script>
	
		$('#tt_code').treegrid({
			data : data				,
			rownumbers: true 	,
			idField: 'id',
			treeField: 'id',				
			onLoadSuccess: function(row){
				$(this).treegrid('enableDnd', row?row.id:null);
			}		
			,
			onDrop: function(targetRow,sourceRow,point)
			{
				console.log(targetRow);
				console.log(sourceRow);
				console.log(point);
				
				var rowIndex = $("#tt_code").treegrid("getRowIndex", sourceRow);
				
				console.log("rowIndex => " + rowIndex);
			}
		
		
		
		});
		
		
		
		
		
	
		$(".testCodeBtn").on("click", function(){
			
			
			var node = $('#tt_code').treegrid('getSelected');
			if (node){
				
				var child_node = $('#tt_code').treegrid('getChildren', node.id);
				console.log(child_node);
				
			    var nodes = [{
			        	"id"		 : "",
			        	"name"  : "Raspberry" ,
			        	"attr1"   : "Raspberry" ,
			        	"attr2"   : "Raspberry" ,
			        	"attr3"   : "Raspberry" ,
			        	"attr4"   : child_node.length + 1 
			    	}
			    
			    ];
			    $('#tt_code').treegrid('append', {
			        parent:node.id,
			        data:nodes
			    });
			}	
			
			
		});
	

	
	</script>

</body>
</html>