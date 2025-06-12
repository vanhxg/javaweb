package homeController;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import model.Order;
import model.DetailOrder;
import model.Customer;

@WebServlet("/xuathoadon")
public class xuathoadonController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    response.setContentType("application/pdf");
	    response.setHeader("Content-Disposition", "attachment; filename=hoadon.pdf");

	    try {
	        Document document = new Document();
	        PdfWriter.getInstance(document, response.getOutputStream());
	        document.open();

	        // Lấy thông tin từ session hoặc DB
	        HttpSession session = request.getSession();
	        Order order = (Order) session.getAttribute("orderConfirm");


	        if (order == null) {
	            document.add(new Paragraph("Khong tim thay don hang trong session 😢"));
	            document.close();
	            return;
	        }
	        
	        Customer customer = order.getCustomer(); // tách ra từ order

	        document.add(new Paragraph("HOA DON MUA HANG"));
	        document.add(new Paragraph("Ten khach hang: " + customer.getUsername()));
            document.add(new Paragraph("Email: " + customer.getCustomerEmail()));
            document.add(new Paragraph("SDT: " + customer.getCustomerMobiphone()));
	        document.add(new Paragraph("Phuong thuc thanh toan: " + order.getPaymentMethod()));
	        document.add(new Paragraph("------------------------------------------------"));

	        for (DetailOrder detail : order.getOrderDetails()) {
	            String tenSP = detail.getProductName();
	            int soLuong = detail.getQuantityOrder();
	            int gia = detail.getTotalPrice();
	            
	            document.add(new Paragraph(tenSP + " - SL: " + soLuong + " - Giá: " + gia + " VND"));
	        }


	        document.add(new Paragraph("------------------------------------------------"));
	        document.add(new Paragraph("Cam on ban da mua hang ❤"));

	        document.close();
	    } catch (com.itextpdf.text.DocumentException e) {
	        e.printStackTrace(); // hoặc log lỗi
	        response.getWriter().write("Loi khi xuat hoa don PDF");
	    }
	}

}

