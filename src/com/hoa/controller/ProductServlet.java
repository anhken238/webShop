package com.hoa.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoa.common.ConstantValue;
import com.hoa.common.Validation;
import com.hoa.exception.DBException;
import com.hoa.exception.ProcessException;
import com.hoa.model.Product;
import com.hoa.service.IProductService;
import com.hoa.service.ProductImpl;
import com.oracle.wls.shaded.org.apache.bcel.generic.SWITCH;

/**
 * Creator NguyenDucAnh
 * 
 * 2021/05/08 13:22:16
 */
@MultipartConfig()
@WebServlet(name = "ProductServlet", urlPatterns = { "/Products" })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
		super();
	}

	IProductService iProductService = new ProductImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "delete":
			try {
				deleteProduct(request, response);
			} catch (DBException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			try {
				int pageSize = 5, startRow = 0, pageNow = 1;
				if (!new Validation().isNull(request.getParameter("pageNo"))
						&& !new Validation().isNull(request.getParameter("pageSize"))) {
					pageSize = Integer.parseInt(request.getParameter("pageSize"));
					if (Integer.parseInt(request.getParameter("pageNo")) <= 1) {
						startRow = 0;
					} else {
						startRow = Integer.parseInt(request.getParameter("pageNo")) * 5 - 5;
						pageNow = Integer.parseInt(request.getParameter("pageNo"));
					}
				}

				showListProduct(request, response, pageSize, startRow, pageNow, ConstantValue.STATUS_SHOW);
			} catch (DBException e) {
				e.printStackTrace();
			}
			break;
		}
	}

	private void showListProduct(HttpServletRequest request, HttpServletResponse response, int pageSize, int startRow,
			int pageNow, String status) throws DBException {
		String notificationMess = "";
		int count = 0;
		String path = "product/List.jsp";
		List<Product> productList = new ArrayList<Product>();
		if (startRow <= 1 && !ConstantValue.STATUS_SHOW.equals(status)) {
			startRow = 0;
		} else {
			startRow = pageNow * 5 - 5;
		}
		try {
			count = this.iProductService.getTotalRecord();
			productList = this.iProductService.getList(startRow, pageSize);

		} catch (DBException e) {
			throw new DBException(e);
		}
		if (productList.size() > 0) {
			notificationMess = "Danh Sách Sản Phẩm Có Trong Kho.";
		} else {
			notificationMess = "Hiện Không Có Sản Phẩm Nào Trong Kho !";
		}
		RequestDispatcher rq = request.getRequestDispatcher(path);
		int pageTotal = (int) Math.ceil(((double) count / (double) pageSize));
		switch (status) {
		case ConstantValue.STATUS_EDIT_OK:
			response.setContentType("text/html;charset=UTF-8");
			request.setAttribute("type", "OK");
			request.setAttribute("successNotification", "Cập nhật sản phẩm thành công.");
			break;
		case ConstantValue.STATUS_EDIT_ERR:
			response.setContentType("text/html;charset=UTF-8");
			request.setAttribute("errCreateNotification", "Mã sản phẩm không hợp lệ");
		case ConstantValue.STATUS_CREATE_OK:
			response.setContentType("text/html;charset=UTF-8");
			request.setAttribute("type", "OK");
			request.setAttribute("successNotification", "Tạo sản phẩm thành công");
			break;
		case ConstantValue.STATUS_CREATE_ERR:
			response.setContentType("text/html;charset=UTF-8");
			request.setAttribute("errCreateNotification", "MÃ SẢN PHẨM đã tồn tại !");
			break;
		case ConstantValue.STATUS_DELETE_ERR:
			response.setContentType("text/html;charset=UTF-8");
			request.setAttribute("type", "ERROR");
			request.setAttribute("successNotification", "Không tìm thấy sản phẩm cần XÓA !");
			break;
		case ConstantValue.STATUS_DELETE_OK:
			response.setContentType("text/html;charset=UTF-8");
			request.setAttribute("type", "OK");
			request.setAttribute("successNotification", "Xóa sản phẩm thành công");
			break;
			
		case ConstantValue.STATUS_EXCEPTION:
			response.setContentType("text/html;charset=UTF-8");
			request.setAttribute("type", "ERROR");
			request.setAttribute("successNotification", "Đã xảy ra lỗi ! Xin thực hiện lại.");
			break;
		default:
			break;
		}
		request.setAttribute("listProduct", productList);
		request.setAttribute("totalRecord", count);
		request.setAttribute("totalPage", pageTotal);
		request.setAttribute("pageNow", pageNow);
		request.setAttribute("notificationMess", notificationMess);
		try {
			rq.forward(request, response);
			return;
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (!new Validation().isNull(action)) {
			switch (action) {
			case "create":
				try {
					createProduct(request, response);
				} catch (DBException e2) {
					e2.printStackTrace();
				}
				break;
			case "edit":
				try {
					editProduct(request, response);
				} catch (DBException e1) {
					e1.printStackTrace();
				}
				break;
			case "delete":
				try {
					deleteMultiplesProduct(request, response);
				} catch (DBException e) {
					e.printStackTrace();
				}
				break;
			default:

				break;
			}
		} else {
			throw new ProcessException(ConstantValue.ERROR_NOTFOUND);
		}
	}

	/**
	 * @param request
	 * @param response
	 * @throws DBException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void deleteMultiplesProduct(HttpServletRequest request, HttpServletResponse response)
			throws DBException, ServletException, IOException {
		String ids = request.getParameter("ids");
		int pageNow = 0, startRow = 0 ;
		if (new Validation().isNull(ids)) {
			if(new Validation().isNull(request.getParameter("pageNo"))) {
				pageNow = Integer.parseInt(request.getParameter("pageNo"));
				startRow = Integer.parseInt(request.getParameter("pageNo"));
				showListProduct(request, response, 5, startRow, pageNow, ConstantValue.STATUS_EXCEPTION);
				return;
			}
			//case id error
		}
		StringBuilder idList = this.handleIds(ids);
		this.iProductService.deleteMultiplesProducts(idList);
		pageNow = Integer.parseInt(request.getParameter("pageNo"));
		startRow = Integer.parseInt(request.getParameter("pageNo"));
		showListProduct(request, response, 5, startRow, pageNow, ConstantValue.STATUS_DELETE_OK);
		return;
	}

	private StringBuilder handleIds(String ids) {
		String[] idArray = ids.split(",");
		StringBuilder idList = new StringBuilder();
		for (int i = 0; i < idArray.length; i++) {
			if (i == idArray.length - 1) {
				idList.append(" '");
				idList.append(idArray[i]);
				idList.append("' ");
				break;
			}
			idList.append(" '");
			idList.append(idArray[i]);
			idList.append("', ");
		}
		return idList;
	}

	private void editProduct(HttpServletRequest request, HttpServletResponse response) throws DBException {
		Product product = new Product();
		String status = "", limitDateDB = "", manufacturing_dateDB = "";
		boolean checkFlg = false;
		String code = request.getParameter("code");
		int startRow = 0, pageNow;
		if (!new Validation().isNull(request.getParameter("pageNo"))) {
			startRow = Integer.parseInt(request.getParameter("pageNo"));
			pageNow = Integer.parseInt(request.getParameter("pageNo"));
		} else {
			throw new DBException(String.valueOf(startRow), ConstantValue.ERROR_NOTFOUND);
		}
		try {
			String codeDb = this.iProductService.getProductById(code).getCode();
			limitDateDB = this.iProductService.getProductById(code).getLitmiDate();
			manufacturing_dateDB = this.iProductService.getProductById(code).getManufacturingDate();

			if (new Validation().isNull(code) || codeDb.equals("code")) {
				showListProduct(request, response, 5, startRow, pageNow, ConstantValue.STATUS_EDIT_ERR);
				return;
			}
		} catch (DBException e) {
			e.printStackTrace();
			throw new DBException(e);
		}
		String name = request.getParameter("name");
		float price = Float.parseFloat(request.getParameter("price"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String manufacturing_date = request.getParameter("manufacturingDate");
		String limit_date = request.getParameter("limitDate");
		String description = request.getParameter("description");
		int timeWarning = new Validation().isNull(request.getParameter("timeWarningEdit")) ? 7
				: Integer.parseInt(request.getParameter("timeWarningEdit"));
		if (!(limit_date.equals(limitDateDB) || manufacturing_date.equals(manufacturing_dateDB))) {
			status = getStatus(manufacturing_date, limit_date, timeWarning);
			checkFlg = true;
		}
//		String image = request.getParameter("image");

		product.setCode(code);
		product.setName(name);
		product.setPrice(price);
		product.setAmount(amount);
		product.setManufacturingDate(manufacturing_date);
		product.setLitmiDate(limit_date);
		product.setDescription(description);
		product.setStatus(status);
		try {
			this.iProductService.edit(product, checkFlg);
			showListProduct(request, response, 5, startRow, pageNow, ConstantValue.STATUS_EDIT_OK);
			return;
		} catch (DBException e) {
			e.printStackTrace();
		}

	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
			throws DBException, ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		int pageNow = 0, startRow = 0 ;
		if (!new Validation().isNull(id)) {
			try {
				if(new Validation().isNull(request.getParameter("pageNo"))) {
					pageNow = Integer.parseInt(request.getParameter("pageNo"));
					startRow = Integer.parseInt(request.getParameter("pageNo"));
					showListProduct(request, response, 5, startRow, pageNow, ConstantValue.STATUS_EXCEPTION);
					return;
				}
				if(new Validation().isNull(this.iProductService.getProductById(id).getCode())) {
					pageNow = Integer.parseInt(request.getParameter("pageNo"));
					startRow = Integer.parseInt(request.getParameter("pageNo"));
					showListProduct(request, response, 5, startRow, pageNow, ConstantValue.STATUS_DELETE_ERR);
					return;
				}
				this.iProductService.deleteById(id);
				pageNow = Integer.parseInt(request.getParameter("pageNo"));
				startRow = Integer.parseInt(request.getParameter("pageNo"));
				showListProduct(request, response, 5, startRow, pageNow, ConstantValue.STATUS_DELETE_OK);
				return;
			} catch (DBException e) {
				e.printStackTrace();
				throw new DBException(e);
			}
		}
	}

	private void createProduct(HttpServletRequest request, HttpServletResponse response)
			throws DBException, ServletException, IOException {
		Product product = new Product();
		String code = request.getParameter("code");
		int startRow = 0, pageNow = 0;
		if (!new Validation().isNull(request.getParameter("pageNo"))) {
			pageNow = Integer.parseInt(request.getParameter("pageNo"));
			startRow = Integer.parseInt(request.getParameter("pageNo"));
		}
		try {
			String codeDB = this.iProductService.getProductById(code).getCode();
			if (new Validation().isNull(code) || code.equals(codeDB)) {
				showListProduct(request, response, 5, startRow, pageNow, ConstantValue.STATUS_CREATE_ERR);
				return;
			}
		} catch (DBException e) {
			e.printStackTrace();
			throw new DBException(e);
		}

		String name = request.getParameter("name");
		float price = Float.parseFloat(request.getParameter("price"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String manufacturing_date = request.getParameter("manufacturingDate");
		String limit_date = request.getParameter("limitDate");
		String description = request.getParameter("description");
		int timeWarning = new Validation().isNull(request.getParameter("timeWarningAdd")) ? 7
				: Integer.parseInt(request.getParameter("timeWarningAdd"));
//		String image = request.getParameter("image");

		product.setCode(code);
		product.setName(name);
		product.setPrice(price);
		product.setAmount(amount);
		product.setManufacturingDate(manufacturing_date);
		product.setLitmiDate(limit_date);
		product.setDescription(description);
		product.setStatus(getStatus(manufacturing_date, limit_date, timeWarning));
//		product.setImage(image);
		response.setContentType("text/html;charset=UTF-8");
		this.iProductService.create(product);
		int total = 0 , pageSize =5;
		total = this.iProductService.getTotalRecord();
		int pageFinally = (int) Math.ceil(((double) total / (double) pageSize));
		startRow = pageFinally;
		showListProduct(request, response, pageSize, startRow, pageFinally, ConstantValue.STATUS_CREATE_OK);
		return;
	}

	private String getStatus(String start, String end, int timeWarning) {
		long longTime;
		String status = "";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate from = LocalDate.parse(start, formatter);
		LocalDate to = LocalDate.parse(end, formatter);
		longTime = ChronoUnit.DAYS.between(from, to);
		if (!new Validation().isNull(end)) {
			if (longTime > timeWarning) {
				status = ConstantValue.STATUS_OK;
			} else if (longTime <= timeWarning && longTime >= 0) {
				status = ConstantValue.STATUS_WARNING;
			} else {
				status = ConstantValue.STATUS_NOTOK;
			}
		} else {
			status = ConstantValue.STATUS_OK;
		}
		return status;
	}

}
