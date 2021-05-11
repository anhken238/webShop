<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MANAGE PRODUCT</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
<
script src ="https: //ajax.googleapis.com /ajax/libs/jquery/1.11.1
	/jquery.min.js "> </script>body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	margin: 30px 0;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn-group {
	float: right;
}

.table-title .btn {
	color: #fff;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
/* Custom checkbox */
.custom-checkbox {
	position: relative;
}

.custom-checkbox input[type="checkbox"] {
	opacity: 0;
	position: absolute;
	margin: 5px 0 0 3px;
	z-index: 9;
}

.custom-checkbox label:before {
	width: 18px;
	height: 18px;
}

.custom-checkbox label:before {
	content: '';
	margin-right: 10px;
	display: inline-block;
	vertical-align: text-top;
	background: white;
	border: 1px solid #bbb;
	border-radius: 2px;
	box-sizing: border-box;
	z-index: 2;
}

.custom-checkbox input[type="checkbox"]:checked+label:after {
	content: '';
	position: absolute;
	left: 6px;
	top: 3px;
	width: 6px;
	height: 11px;
	border: solid #000;
	border-width: 0 3px 3px 0;
	transform: inherit;
	z-index: 3;
	transform: rotateZ(45deg);
}

.custom-checkbox input[type="checkbox"]:checked+label:before {
	border-color: #03A9F4;
	background: #03A9F4;
}

.custom-checkbox input[type="checkbox"]:checked+label:after {
	border-color: #fff;
}

.custom-checkbox input[type="checkbox"]:disabled+label:before {
	color: #b8b8b8;
	cursor: auto;
	box-shadow: none;
	background: #ddd;
}
/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
}

.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}

.modal .modal-content {
	border-radius: 3px;
}

.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}

.modal .modal-title {
	display: inline-block;
}

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}

.modal textarea.form-control {
	resize: vertical;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
}
</style>
<script type="text/javascript">
	function getValCheckBox(e) {
		var ids = [];
		var countCheckboxPick = 0;
		var countCheckbox = 0;
		$('input[type="checkbox"]').each(function() {
			countCheckbox++;
		});
		$('input[name="options[]"]:checked').each(function() {
			ids.push($(this).val());
			countCheckboxPick++;
		});
		if (countCheckboxPick < countCheckbox - 1) {
			$('#selectAll').prop('checked', false);
		} else {
			$('#selectAll').prop('checked', true);
		}
		$('#ids').val(ids);

		// show/hide button DELETE
		if (ids.length > 0) {
			$('#deleteMultiples').attr('class', 'btn btn-danger');
		} else {
			$('#deleteMultiples').attr('class', 'btn btn-danger disabled');
		}
	}

	function getValCheckBoxAll(e) {
		var ids = [];
		// Select/Deselect checkboxes
		var checkbox = $('table tbody input[type="checkbox"]');
		var statusCheckAll = $('#selectAll').is(':checked');
		if (statusCheckAll) {
			checkbox.each(function() {
				this.checked = true;
			});
		} else {
			checkbox.each(function() {
				this.checked = false;
			});
		}
		$('input[name="options[]"]:checked').each(function() {
			ids.push($(this).val());
		});
		$('#ids').val(ids);
		// show/hide button DELETE
		if (ids.length > 0) {
			$('#deleteMultiples').attr('class', 'btn btn-danger');
		} else {
			$('#deleteMultiples').attr('class', 'btn btn-danger disabled');
		}
	}

	$(document).ready(function() {
		var patternDate = $("#limitDate1").val();
		$("#textWarning1").hide();
		$("#limitDate1").change(function() {
			$("#textWarning1").show();
			if ($("#limitDate1").val() === patternDate) {
				$("#textWarning1").hide();
			}
		});
	});
	$(document).ready(function() {
		var patternDate = $("#limitDate2").val();
		$("#textWarning2").hide();
		$("#limitDate2").change(function() {
			$("#textWarning2").show();
			if ($("#limitDate2").val() === patternDate) {
				$("#textWarning2").hide();
			}
		});
	});

	function updateFunction(e) {
		var elem = $(e.target);
		var parentRow = elem.parents('tr');
		/*   $("#row_name").val(parentRow.find("[name='name']").text()); */
		$("#name").val(parentRow.find("[name='name']").text());
		$("#price").val(parentRow.find("[name='price']").text());
		$("#code").val(parentRow.find("[name='code']").text());
		$("#amount").val(parentRow.find("[name='amount']").text());
		$("#description").val(parentRow.find("[name='description']").text());
		/*dd-mm-yy -> mm-dd-yy*/
		var date = formatDate(parentRow.find("[name='manufacturingDate']")
				.text());
		$("#manufacturingDate").val(date);

		var date = formatDate(parentRow.find("[name='limitDate']").text());
		$("#limitDate2").val(date);
		//considering you saved the values are male and female in db
		/*  
		if (parentRow.find("[name='gender']").text() == 'male') {
				$('[value="M"]').attr('checked', true)
			}
			else {
				$('[value="F"]').attr('checked', true)
			} 
		
		$("#birthdate").val(parentRow.find("[name='birthdate']").text());
		 */
	}

	function formatDate(dateInput) {
		var datearray = dateInput.split("-");
		var newdate = datearray[1] + '-' + datearray[0] + '-' + datearray[2];

		var d = new Date(newdate), month = '' + (d.getMonth() + 1), day = ''
				+ d.getDate(), year = d.getFullYear();

		if (month.length < 2)
			month = '0' + month;
		if (day.length < 2)
			day = '0' + day;

		return [ year, month, day ].join('-');
	}
</script>
</head>
<body>
	<div class="container">
		<h2 Style="margin-bottom: 2%">
			<a href="${pageContext.request.contextPath}/Products?action=showlist">Manage
				<b>Products</b>
			</a>
		</h2>
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">

						<div class="row">
							<div class="col-sm-8">
								<div class="input-group">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle"
											style="color: red;" data-toggle="dropdown">
											<span id="search_concept"
												style="color: black; font-family: inherit;">Filter by</span>
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#contains">Contains</a></li>
											<li><a href="#its_equal">It's equal</a></li>
											<li><a href="#greather_than">Greather than ></a></li>
											<li><a href="#less_than">Less than < </a></li>
											<li class="divider"></li>
											<li><a href="#all">Anything</a></li>
										</ul>
									</div>
									<input type="hidden" name="search_param" value="all"
										id="search_param"> <input type="text"
										style="height: 38px" class="form-control" name="x"
										placeholder="Search ..."> <span
										class="input-group-btn">
										<button class="btn btn-default btn-sm" type="button"
											style="height: 38px; color: red;">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>

					</div>
					<div class="col-sm-4" style="float: right;">
						<a href="#addEmployeeModal" class="btn btn-success"
							data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm
								Sản Phẩm</span></a> <a href="#deleteEmployeeModal" id="deleteMultiples"
							class="btn btn-danger disabled" data-toggle="modal"><i
							class="material-icons">&#xE15C;</i> <span>Xóa Sản Phẩm</span></a>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								onclick="getValCheckBoxAll(event)" type="checkbox"
								id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th>MãSảnPhẩm</th>
						<th>TênSảnPhẩm</th>
						<th>ĐơnGiá</th>
						<th>SốLượng</th>
						<th>NgàySảnXuất</th>
						<th>NgàyHếtHạn</th>
						<th>Mô Tả Sản Phẩm</th>
						<th>TrạngThái</th>
						<th>Sửa/Xóa</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listProduct}" var="product">
						<tr data-row-name="${product.getCode()}">
							<td><span class="custom-checkbox"> <input
									onclick="getValCheckBox(event)" type="checkbox" id="checkbox1"
									name="options[]" value="${product.getCode()}"> <label
									for="checkbox1"></label>
							</span></td>
							<td name="code">${product.getCode()}</td>
							<td name="name">${product.getName()}</td>
							<td name="price">${product.getPrice()}</td>
							<td name="amount">${product.getAmount()}</td>
							<td name="manufacturingDate">${product.getManufacturingDate()}</td>
							<td name="limitDate">${product.getLitmiDate()}</td>
							<td name="description">${product.getDescription()}</td>
							<td>${product.getStatus()}</td>
							<td><a href="#editEmployeeModal" class="edit"
								onclick="updateFunction(event)" data-toggle="modal"><i
									class="material-icons" data-toggle="tooltip" title="Edit"
									data-record="${product.getCode()}">&#xE254;</i></a> <a
								href="${pageContext.request.contextPath}/Products?action=delete&id=${product.getCode()}"
								class="delete" data-toggle="modal"
								onclick="return confirm('Are you sure you want to delete this item?');"><i
									class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text">
					Showing <b>5</b> out of <b>25</b> entries
				</div>
				<ul class="pagination">
					<li class="page-item disabled"><a href="#">Previous</a></li>
					<li class="page-item"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item active"><a href="#" class="page-link">3</a></li>
					<li class="page-item"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					<li class="page-item"><a href="#" class="page-link">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form
					action="${pageContext.request.contextPath}/Products?action=create"
					method="post">
					<div class="modal-header">
						<h4 class="modal-title">Add Product</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Mã Sản Phẩm</label> <input type="text"
								class="form-control" name="code" required>
						</div>
						<div class="form-group">
							<label>Tên Sản Phẩm</label> <input type="text"
								class="form-control" name="name" required>
						</div>
						<div class="form-group">
							<label>Đơn Giá</label> <input class="form-control" type="number"
								name="price" min="0.00" max="1000000000000.00" step="0.01"
								required />
						</div>
						<div class="form-group">
							<label>Số Lượng</label> <input type="number" min="0"
								max="1000000000000" class="form-control" name="amount" required>
						</div>
						<div class="form-group">
							<label>Ngày Sản Xuất</label> <input type="Date"
								class="form-control" name="manufacturingDate" required>
						</div>
						<div class="form-group">
							<label>Ngày Hết Hạn</label> <input id="limitDate1" type="DATE"
								class="form-control" name="limitDate" required>
						</div>
						<div class="form-group" id="textWarning1">
							<span style="color: red; margin-top: 5px;">Sẽ cảnh báo
								trước <input style="width: 15%; height: 70%;" type="number"
								placeholder="day" name="timeWarning1"> ngày khi sản phẩm
								hết hạn
							</span>
						</div>
						<div class="form-group">
							<label>Mô Tả Sản Phẩm</label>
							<textarea class="form-control" name="description" required></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form
					action="${pageContext.request.contextPath}/Products?action=edit"
					method="post">
					<div class="modal-header">
						<h4 class="modal-title">Edit Product</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Mã Sản Phẩm</label> <input type="text" id="code"
								name="code" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Tên Sản Phẩm</label> <input type="text" id="name"
								name="name" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Đơn Giá</label> <input class="form-control" type="number"
								id="price" name="price" min="0.00" max="1000000000000.00"
								step="0.01" required />
						</div>
						<div class="form-group">
							<label>Số Lượng</label> <input type="number" min="0" id="amount"
								name="amount" max="1000000000000" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Ngày Sản Xuất</label> <input type="Date"
								id="manufacturingDate" name="manufacturingDate"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Ngày Hết Hạn</label> <input id="limitDate2"
								name="limitDate" type="DATE" class="form-control" required>
						</div>
						<div class="form-group" id="textWarning2">
							<span style="color: red; margin-top: 5px;">Sẽ cảnh báo
								trước <input style="width: 15%; height: 70%;" type="number"
								placeholder="day" name="timeWarning2"> ngày khi sản phẩm
								hết hạn
							</span>
						</div>
						<div class="form-group">
							<label>Mô Tả Sản Phẩm</label>
							<textarea class="form-control" id="description"
								name="description" required></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit" class="btn btn-info"
							value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="post" action="${pageContext.request.contextPath}/Products?action=delete">
					<div>
						<input type="text" name="ids" id="ids">
					</div>
					<div class="modal-header">
						<h4 class="modal-title">Xóa Các Sản Phẩm !</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Bạn Chắc Chắn Xóa Những Sản Phẩm Đã Chọn?</p>
						<p class="text-warning">
							<small>Muốn xem sản phẩm đã xóa hãy click vào danh sách
								sản phẩm đã xóa</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-danger" value="Delete">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>