package com.hoa.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
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

/**
 * Servlet implementation class ProductServlet
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
		case "create":
			createProduct(request, response);
			break;
		case "showEditForm":
			showEditForm(request, response);
			break;
		case "delete":
			try {
				deleteProduct(request, response);
			} catch (DBException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			showListProduct(request, response);
			break;
		}
	}

	private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
		String notificationMess = "";
		String path = "product/List.jsp";
		List<Product> productList = new ArrayList<Product>();
		try {
			productList = this.iProductService.getList();
		} catch (DBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (productList.size() > 0) {
			notificationMess = "Danh Sách Sản Phẩm Có Trong Kho !";
		} else {
			notificationMess = "Hiện Không Có Sản Phẩm Nào Trong Kho";
		}
		RequestDispatcher rq = request.getRequestDispatcher(path);
		request.setAttribute("listProduct", productList);
		request.setAttribute("notificationMess", notificationMess);
		try {
			rq.forward(request, response);
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
		if (!new Validation().checkNull(action)) {
			switch (action) {
			case "create":
				createProduct(request, response);
				break;
			case "edit":
				showEditForm(request, response);
				break;
			case "delete":
				try {
					deleteProduct(request, response);
				} catch (DBException e) {
					// TODO Auto-generated catch block
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

	private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
			throws DBException, ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String path = "product/List.jsp";
		if (!new Validation().checkNull(id)) {
			try {
				List<Product> productList = (List<Product>) this.iProductService.deleteById(id);
				request.setAttribute("listProduct", productList);
				RequestDispatcher rqDispatcher = request.getRequestDispatcher(path);
				rqDispatcher.forward(request, response);
			} catch (DBException e) {
				e.printStackTrace();
				throw new DBException(e);
			}
		}

	}

	private void createProduct(HttpServletRequest request, HttpServletResponse response) {
		Product product = new Product();
		String path = "product/List.jsp";
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		float price = Float.parseFloat(request.getParameter("price"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String manufacturing_date = request.getParameter("manufacturingDate");
		String limit_date = request.getParameter("limitDate");
		String description = request.getParameter("description");
		int timeWarning = new Validation().checkNull(request.getParameter("timeWarning1")) ? 7
				: Integer.parseInt(request.getParameter("timeWarning1"));
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
		try {
			List<Product> productList = this.iProductService.create(product);
			request.setAttribute("listProduct", productList);
			RequestDispatcher reqDispatcher = request.getRequestDispatcher(path);
			request.setAttribute("notificationMess", "Tạo sản phẩm thành công");
			reqDispatcher.forward(request, response);
		} catch (DBException | ServletException | IOException e) {
			e.printStackTrace();
		}

	}

	private String getStatus(String start, String end, int timeWarning) {
		long longTime;
		String status = "";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate from = LocalDate.parse(start, formatter);
		LocalDate to = LocalDate.parse(end, formatter);
		longTime = ChronoUnit.DAYS.between(from,to);
		if (!new Validation().checkNull(end)) {
			if (longTime > timeWarning) {
				status = "Bình Thường";
			} else if (longTime <= timeWarning && longTime >= 0) {
				status = "Sắp Hết Hạn Sử Dụng !";
			} else {
				status = "Hết Hạn Sử Dụng";
			}
		} else {
			status = "Bình Thường";
		}
		return status;
	}

}
