<%@page import="com.hoa.common.Validation"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

#notificaption {
	float: right;
	margin: 55px 150px 0px 0px;
	padding: 8px;
	color: #f5f5f5;
	width: 200px;
	height: 55px;
	border-radius: 3px;
}

.spanNotif {
	text-align: left;
	word-wrap: break-all;
}

#btnclose {
	float: right;
	width: 1px;
	height: 1px;
	font-weight: bold;
}

.active {
	color: red;
}
</style>
<script type="text/javascript">
	// show/hide time warning of product
	$(document).ready(function() {
		var patternDate = $("#limitDateAdd").val();
		$("#textWarningAdd").hide();
		$("#limitDateAdd").change(function() {
			$("#textWarningAdd").show();
			if ($("#limitDateAdd").val() === patternDate) {
				$("#textWarningAdd").hide();
			}
		});
	});
	$(document).ready(function() {
		var patternDate = $("#limitDateEdit").val();
		$("#textWarningEdit").hide();
		$("#limitDateEdit").change(function() {
			$("#textWarningEdit").show();
			if ($("#limitDateEdit").val() === patternDate) {
				$("#textWarningEdit").hide();
			}
		});
	});

	// save data when click button add product
	function saveData() {
		var $a = $('#formAdd :input');
		$a.each(function() {
			localStorage.setItem(this.name, $(this).val());
		})
	}

	$(document).ready(
			function() {
				console.log($('#errorCreateMess').val());
				var mesesager = $('#errorCreateMess').val();
				if (mesesager == 'null' || mesesager == '') {
					$('#errorCreateMess').attr('type', 'hidden');
				} else {
					$('#addEmployeeModal').modal('show');
					$('#errorCreateMess').attr('type', 'text');
					/* var $a = $('#formAdd :input');
					$a.each(function() {
						$(this).val(localStorage.getItem(this.name));
					}) */
					$("#nameAdd").val(localStorage.getItem('name'));
					$("#priceAdd").val(localStorage.getItem('price'));
					$("#codeAdd").val(localStorage.getItem('code'));
					$("#amountAdd").val(localStorage.getItem('amount'));
					$("#descriptionAdd").val(
							localStorage.getItem('description'));
					$("#manufacturingDateAdd").val(
							localStorage.getItem('manufacturingDate'));
					$("#limitDateAdd").val(localStorage.getItem('limitDate'));
					$("#valueTimeWarning").val(
							localStorage.getItem('timeWarningAdd'));
					$("#textWarningAdd").show();

				}

			});

	//event ONCLICK of checkbox select all
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

	// event ONCLICK of checkbox product
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

	//get row data from table then show in edit form
	function updateFunction(e) {
		var elem = $(e.target);
		var parentRow = elem.parents('tr');
		/*   $("#row_name").val(parentRow.find("[name='name']").text()); */
		$("#nameEdit").val(parentRow.find("[name='name']").text());
		$("#priceEdit").val(parentRow.find("[name='price']").text());
		$("#codeEdit").val(parentRow.find("[name='code']").text());
		$("#amountEdit").val(parentRow.find("[name='amount']").text());
		$("#descriptionEdit")
				.val(parentRow.find("[name='description']").text());
		/*dd-mm-yy -> mm-dd-yy*/
		var date = formatDate(parentRow.find("[name='manufacturingDate']")
				.text());
		$("#manufacturingDateEdit").val(date);

		var date = formatDate(parentRow.find("[name='limitDate']").text());
		$("#limitDateEdit").val(date);
		$("#timeWarningAdd").val(
				parentRow.find("[name='timeWarningAdd']").text());
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
	$(document).ready(
			function() {
				var type = $('#typeError').val();
				var messError = $('#errNotification').val();
				var messSuccess = $('#successNotification').val();
				if (type == 'null' || type == '') {
					$("#notificaption").hide();
				} else {
					if (type == 'OK') {
						$("#notificaption").show().slideUp(3000);
						$("#errNotification").hide();
						$("#notificaption").attr('style',
								'background-color: #5cb85c;');
					} else if (type == 'ERROR') {
						$("#notificaption").show().slideUp(3000);
						$("#successNotification").hide();
						$("#notificaption").attr('style',
								'background-color: #d9534f;');
					}
				}
			})

	$(document).ready(function() {
		$("#btnclose").click(function() {
			$("#notificaption").hide();
		});
	})
	$(document).ready(function() {
		var pageNow = $('#pageNow').val();
		var idPageClick = '#pageItem' + pageNow;
		$(idPageClick).attr('class', 'page-item active');
	});
</script>
</head>
<body>
	<input type="hidden" value=<%=request.getAttribute("type")%>
		id="typeError">
	<div id="notificaption" style="background-color: green;">
		<button id="btnclose" data-dismiss="notificaption" type="button">&times;</button>
		<span class="spanNotif" id="errNotification"><%=request.getAttribute("errNotification")%></span>
		<span class="spanNotif" id="successNotification"><%=request.getAttribute("successNotification")%></span>
	</div>
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
												style="color: black; font-family: inherit;">T??m Ki???m</span>
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#contains">T??n S???n Ph???m</a></li>
											<li><a href="#its_equal">M?? S???n Ph???m</a></li>
											<li><a href="#greather_than">Tr???ng Th??i</a></li>
											<li class="divider"></li>
											<li><a href="#all">Anything</a></li>
										</ul>
									</div>
									<input type="hidden" name="search_param" value="all"
										id="search_param"> <input type="text"
										style="height: 38px; width: 99%;" class="form-control"
										name="x" placeholder="Search ..."> <span
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
							data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Th??m
								S???n Ph???m</span></a> <a href="#deleteEmployeeModal" id="deleteMultiples"
							class="btn btn-danger disabled" data-toggle="modal"><i
							class="material-icons">&#xE15C;</i> <span>X??a S???n Ph???m</span></a>
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
						<th>M??S???nPh???m</th>
						<th>T??nS???nPh???m</th>
						<th>????nGi??</th>
						<th>S???L?????ng</th>
						<th>Ng??yS???nXu???t</th>
						<th>Ng??yH???tH???n</th>
						<th>M?? T??? S???n Ph???m</th>
						<th>Tr???ngTh??i</th>
						<th>S???a/X??a</th>
					</tr>
				</thead>
				<tbody>
					<%
					int total = 0, length = 0, pageNow = 0;
				if (!new Validation().isNull(String.valueOf(request.getAttribute("totalRecord")))
						&& !new Validation().isNull(String.valueOf(request.getAttribute("totalPage")))
						&& !new Validation().isNull(String.valueOf(request.getAttribute("pageNow")))) {
					total = Integer.parseInt(String.valueOf(request.getAttribute("totalRecord")));
					length = Integer.parseInt(String.valueOf(request.getAttribute("totalPage")));
					pageNow = Integer.parseInt(String.valueOf(request.getAttribute("pageNow")));
				}
				%>
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
								href="${pageContext.request.contextPath}/Products?action=delete&id=${product.getCode()}&pageNo=<%=pageNow%>"
								class="delete" data-toggle="modal"
								onclick="return confirm('B???n c?? ch???c ch???n th???c hi???n thao t??c x??a?');"><i
									class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text">
					Showing <b> <select name="forma"
						onChange="window.location.href=this.value">
							<option
								value="${pageContext.request.contextPath}/Products?action=showlist&pageNo=<%=pageNow%>&pageSize=5">5</option>
							<%-- <option
								value="${pageContext.request.contextPath}/Products?action=showlist&pageNo=<%=pageNow%>&pageSize=10">10</option>
							<option
								value="${pageContext.request.contextPath}/Products?action=showlist&pageNo=<%=pageNow%>&pageSize=15">15</option> --%>
					</select>
					</b> out of <b><%=request.getAttribute("totalRecord")%></b> entries
				</div>

				<input type="hidden" id="pageNow" value="<%=pageNow%>">
				<ul class="pagination">
					<li class="page-item"><a
						href="${pageContext.request.contextPath}/Products?action=showlist&pageNo=<%=pageNow-1%>&pageSize=5">Previous</a></li>
					<%
						for (int i = 1; i <= length; i++) {
					%>
					<li class="page-item" id="pageItem<%=i%>"
						onclick="activeTagLI(event)"><a
						href="${pageContext.request.contextPath}/Products?action=showlist&pageNo=<%=i%>&pageSize=5"
						class="page-link"><%=i%></a></li>
					<%
						}
					%>
					<li class="page-item"><a
						href="${pageContext.request.contextPath}/Products?action=showlist&pageNo=<%=pageNow+1%>&pageSize=5"
						class="page-link">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- add Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="formAdd"
					action="${pageContext.request.contextPath}/Products?action=create"
					method="post" onsubmit="return saveData();">
					<input style="margin-top: 10px; margin-left: 10px; color: red;"
						type="hidden" id="errorCreateMess" class="errorCreateMess"
						value="<%=request.getAttribute("errCreateNotification")%>"
						disabled>
					<div class="modal-header">
						<h4 class="modal-title">Add Product</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>M?? S???n Ph???m</label> <input type="text" id="codeAdd"
								class="form-control" name="code" required>
						</div>
						<div class="form-group">
							<label>T??n S???n Ph???m</label> <input type="text" id="nameAdd"
								class="form-control" name="name" required>
						</div>
						<div class="form-group">
							<label>????n Gi??</label> <input class="form-control" type="number"
								id="priceAdd" name="price" min="0.00" max="1000000000000.00"
								step="0.01" required />
						</div>
						<div class="form-group">
							<label>S??? L?????ng</label> <input type="number" min="0"
								id="amountAdd" max="1000000" class="form-control" name="amount"
								required>
						</div>
						<div class="form-group">
							<label>Ng??y S???n Xu???t</label> <input type="Date"
								class="form-control" name="manufacturingDate"
								id="manufacturingDateAdd" required>
						</div>
						<div class="form-group">
							<label>Ng??y H???t H???n</label> <input id="limitDateAdd" type="DATE"
								class="form-control" name="limitDate" required>
						</div>
						<div class="form-group" id="textWarningAdd">
							<span style="color: red; margin-top: 5px;">S??? c???nh b??o
								tr?????c <input style="width: 15%; height: 70%;" type="number"
								id="valueTimeWarning" placeholder="day" name="timeWarningAdd">
								ng??y khi s???n ph???m h???t h???n
							</span>
						</div>
						<div class="form-group">
							<label>M?? T??? S???n Ph???m</label>
							<textarea class="form-control" name="description"
								id="descriptionAdd" required></textarea>
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
							<label>M?? S???n Ph???m</label> <input type="text" id="codeEdit"
								name="code" class="form-control" required>
						</div>
						<div class="form-group">
							<label>T??n S???n Ph???m</label> <input type="text" id="nameEdit"
								name="name" class="form-control" required>
						</div>
						<div class="form-group">
							<label>????n Gi??</label> <input class="form-control" type="number"
								id="priceEdit" name="price" min="0.00" max="1000000000000.00"
								step="0.01" required />
						</div>
						<div class="form-group">
							<label>S??? L?????ng</label> <input type="number" min="0"
								id="amountEdit" name="amount" max="1000000" class="form-control"
								required>
						</div>
						<div class="form-group">
							<label>Ng??y S???n Xu???t</label> <input type="Date"
								id="manufacturingDateEdit" name="manufacturingDate"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Ng??y H???t H???n</label> <input id="limitDateEdit"
								name="limitDate" type="DATE" class="form-control" required>
						</div>
						<div class="form-group" id="textWarningEdit">
							<span style="color: red; margin-top: 5px;">S??? c???nh b??o
								tr?????c <input style="width: 15%; height: 70%;" type="number"
								placeholder="day" name="timeWarningEdit"> ng??y khi s???n
								ph???m h???t h???n
							</span>
						</div>
						<div class="form-group">
							<label>M?? T??? S???n Ph???m</label>
							<textarea class="form-control" id="descriptionEdit"
								name="description" required></textarea>
						</div>
						<input type="hidden" name="pageNo" value="<%=pageNow%>">
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
				<form method="post"
					action="${pageContext.request.contextPath}/Products?action=delete">
					<div>
						<input type="hidden" name="ids" id="ids"> <input
							type="hidden" name="pageNo" value="<%=pageNow%>">
					</div>
					<div class="modal-header">
						<h4 class="modal-title">X??a C??c S???n Ph???m !</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>B???n Ch???c Ch???n X??a Nh???ng S???n Ph???m ???? Ch???n?</p>
						<p class="text-warning">
							<small>Mu???n xem s???n ph???m ???? x??a h??y click v??o danh s??ch
								s???n ph???m ???? x??a</small>
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