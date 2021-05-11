<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
		integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous" />
	<title>THÊM SẢN PHẨM</title>
	<style>
		[class^="ico-"],
		[class*=" ico-"] {
			font: normal 1em/1 Arial, sans-serif;
			display: inline-block;
		}


		.ico-times:before {
			content: "\2716";
		}
	</style>
</head>

<body>

<h2><a href="${pageContext.request.contextPath}/Products?action=showlist">list</a></h2>
<%-- 
	<div class="container">
		<form method="POST" action="<%=request.getContextPath()%>/Products?action=create" enctype="multipart/form-data"
			style="margin: auto;">
			<div class="form-group">
				<label for="">Mã Sản Phẩm</label> <input type="text" class="form-control" name="code"
					placeholder="Nhập tên của sản phẩm.">
			</div>
			<div class="form-group">
				<label for="">Tên Sản Phẩm</label> <input type="text" class="form-control" name="name"
					placeholder="Nhập tên của sản phẩm.">
			</div>
			<div class="form-group">
				<label for="">Giá Sản Phẩm</label> <input type="Number" class="form-control" name="price"
					placeholder="Nhập giá của sản phẩm.">
			</div>
			<div class="form-group">
				<label for="">Số Lượng</label> <input type="Number" class="form-control" name="amount"
					placeholder="Nhập số lượng sản phẩm.">
			</div>
			<div class="form-group">
				<label for="">Ngày Sản Xuất</label> <input type="Date" name="manufacturingDate" id=""
					class="form-control">
			</div>
			<div class="form-group">
				<label for="">Ngày Hết Hạn</label> <input type="Date" name="litmiDate" class="form-control">
			</div>
			<div class="form-group">
				<label for="">Thông Tin Chi Tiết Sản Phẩm</label>
				<textarea name="description" id="description" cols="30" rows="10" name="description"
					class="form-control"></textarea>
			</div>
			<div class="form-group">
				<input type="hidden" name="pathFile">
				<p id="listImage" type="hidden"></p>
				<input type="file" accept="image/*" id="uploadFileBtn" name="getImage" onchange="upload_File(this)">
			</div>
			<button type="submit" class="btn btn-primary" class="form-control">Thêm
				Sản Phẩm</button>
		</form>
	</div> --%>
</body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>
<script type="text/javascript">
		var arry = new Array;
		var listImage = "";
		var newList = "";
		function upload_File(input) {
			var image = input.value;
			var checkImageExist = false;
			if (arry.length > 0) {
				for (var index in arry) {
					if (arry[index] === image) {
						checkImageExist = true;
					}
				}
				if (!checkImageExist) {
					arry.push(image);
					listImage = listImage + "<form> <li class='removeFile'>" + image + "<button type='button' class='ico-times' role='img' aria-label='Cancel'  onclick = 'removeRow(this)' ></button>" + "</li> </form> ";
					document.getElementById("listImage").innerHTML = listImage;
				}

			} else {
				if (image != null) {
					arry.push(image);
					listImage = "<form> <li class='removeFile' >" + image + "<button type='button' class='ico-times' role='img' aria-label='Cancel' onclick = 'removeRow(this)' ></button>" + "</li></form> ";
					document.getElementById("listImage").innerHTML = listImage;
				}
			}
			document.getElementById("uploadFileBtn").value = "";
		}
		function removeRow(input) {
			var idx = 0;
			for (var index in arry) {
				if (arry[index] === input.parentElement.textContent) {
					idx = index;
					break;
				}
			}
			arry.splice(idx, 1);

			for (const element in arry) {
				if (newList.length > 0) {
					newList = newList + "<form> <li class='removeFile' >" + arry[element] + "<button type='button' class='ico-times' role='img' aria-label='Cancel'  onclick = 'removeRow(this)' ></button>" + "</li></form> ";
				} else {
					newList = "<form> <li class='removeFile'>" + arry[element] + "<button type='button' class='ico-times' role='img' aria-label='Cancel'   onclick = 'removeRow(this)' ></button>" + "</li> </form> ";
				}
			}
			document.getElementById("listImage").innerHTML = newList;
			newList = "";

		}
		// markdown

		var simplemde = new SimpleMDE({
			element: document.getElementById("description"),
			autoDownloadFontAwesome: true,
			autofocus: true,
			autosave: true,
			showIcons: ['code', 'table'],
			spellChecker: false,
			promptURLs: true,
			toolbar: [
				{ name: "bold", action: simpleMDE.toggleBold, className: "fa fa-bold", title: "Bold", },
				{ name: "heading-1", action: simpleMDE.toggleHeading1, className: "fa fa-header fa-header-x fa-header-1", title: "Big Heading", },
				{ name: "heading-2", action: simpleMDE.toggleHeading2, className: "fa fa-header fa-header-x fa-header-2", title: "Medium Heading", },
				{ name: "heading-3", action: simpleMDE.toggleHeading3, className: "fa fa-header fa-header-x fa-header-3", title: "Small Heading", },
				"|",
				{ name: "link", action: simpleMDE.drawLink, className: "fa fa-link no-mobile", title: "Create Link", },
				{ name: "unordered-list", action: simpleMDE.toggleUnorderedList, className: "fa fa-list-ul", title: "Generic List", },
				{ name: "ordered-list", action: simpleMDE.toggleOrderedList, className: "fa fa-list-ol", title: "Numbered List", },
				"|",
				{ name: "preview", action: simpleMDE.togglePreview, className: "fa fa-eye no-disable", title: "Toggle Preview", },
				// { name: "side-by-side", action: simpleMDE.toggleSideBySide, className: "fa fa-columns no-disable no-mobile",title: "Toggle Side by Side",},
				// { name: "fullscreen", action: simpleMDE.toggleFullScreen, className: "fa fa-arrows-alt no-disable no-mobile", title: "Toggle Fullscreen",},
				{
					name: "image",
					action: function () {
						$('#UpImage').modal("show");
					},
					className: "fa fa-image",
					title: "Upload Image",
				}
			]
		});
		simplemde.value();
		simplemde.value("This text will appear in the editor");

	</script>

</html>