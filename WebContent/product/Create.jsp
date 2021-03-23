<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/main.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form method="POST"
			action="<%=request.getContextPath()%>/Products?action=create"
			enctype="multipart/form-data" style="margin: auto;">
			<div class="form-group">
				<label for="">Mã Sản Phẩm</label> <input type="text"
					class="form-control" name="code"
					placeholder="Nhập tên của sản phẩm.">
			</div>
			<div class="form-group">
				<label for="">Tên Sản Phẩm</label> <input type="text"
					class="form-control" name="name"
					placeholder="Nhập tên của sản phẩm.">
			</div>
			<div class="form-group">
				<label for="">Giá Sản Phẩm</label> <input type="Number"
					class="form-control" name="price"
					placeholder="Nhập giá của sản phẩm.">
			</div>
			<div class="form-group">
				<label for="">Số Lượng</label> <input type="Number"
					class="form-control" name="amount"
					placeholder="Nhập số lượng sản phẩm.">
			</div>
			<div class="form-group">
				<label for="">Ngày Sản Xuất</label> <input type="Date"
					name="manufacturingDate" id="" class="form-control">
			</div>
			<div class="form-group">
				<label for="">Ngày Hết Hạn</label> <input type="Date"
					name="litmiDate" class="form-control">
			</div>
			<div class="form-group">
				<label for="">Thông Tin Chi Tiết Sản Phẩm</label>
				<textarea name="" id="" cols="30" rows="10" name="description"
					class="form-control"></textarea>
			</div>
			<div class="form-group">
				<p id="valueOfImage" type="hidden"></p>
				<input type="file"name="getImage" onchange="upload_File(this)">
			</div>
			<button type="submit" class="btn btn-primary" class="form-control">Thêm
				Sản Phẩm</button>
		</form>
	</div>
</body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>
<script type="text/javascript">
	var arry = new Array;
	var listImage = "";
	 function upload_File(input) {
	    var image  =  input.value;
	    var checkImageExist = false;
	    if(arry.length>0){
	        for (var index in arry) {
	            if(arry[index] === image){
	                checkImageExist= true;
	            }
	        }
	        if(!checkImageExist){
	            arry.push(image);
	            listImage = listImage +","+ image;
	            $( "p#listImage" ).text( listImage );
	        }
	    }else{
	        if(image != null){
	    	    arry.push(image);
	            listImage = image;
	            $( "p#listImage" ).text( image );
	        }
	    }
	}
</script>
</html>