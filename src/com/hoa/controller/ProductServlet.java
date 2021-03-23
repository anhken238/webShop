package com.hoa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
@WebServlet(name = "ProductServlet", urlPatterns = {"/Products"})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	IProductService iProductService = new ProductImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
				editProdict(request, response);
				break;
			case "delete":
				deleteProdict(request, response);
				break;
			default:
				
				break;
			}
		} else {
			throw new ProcessException(ConstantValue.ERROR_NOTFOUND);
		}
		doGet(request, response);
	}

	private void editProdict(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void deleteProdict(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void createProduct(HttpServletRequest request, HttpServletResponse response) {
		Product product = new Product();
		String path = "/index.html";
		
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String amount = request.getParameter("amount");
		String manufacturing_date = request.getParameter("manufacturingDate");
		String limit_date = request.getParameter("litmiDate");
		String description = request.getParameter("description");
		String image = request.getParameter("image");
		
		product.setCode(code);
		product.setName(name);
		product.setPrice(price);
		product.setAmount(amount);
		product.setManufacturingDate(manufacturing_date);
		product.setLitmiDate(limit_date);
		product.setDescription(description);
		product.setImage(image);
		try {
			this.iProductService.create(product);
			RequestDispatcher reqDispatcher = request.getRequestDispatcher(path);
			request.setAttribute("notificationMess", "Tạo sản phẩm thành công");
			reqDispatcher.forward(request, response);
		} catch (DBException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	
	

}
