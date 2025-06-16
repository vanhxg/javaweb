package homeController;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import model.Order;
import model.Product;
import model.DetailOrder;
import model.Customer;

@WebServlet("/xuathoadon")
public class xuathoadonController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String type = request.getParameter("type"); // type = "pdf" or "docx"
            if ("docx".equalsIgnoreCase(type)) {
                exportDocx(request, response);
            } else {
                exportPdf(request, response);
            }
        }
        
        private void exportPdf(HttpServletRequest request, HttpServletResponse response) throws IOException {
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=hoadon.pdf");
        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            Font titleFont = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Font boldFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
            Font normalFont = new Font(Font.FontFamily.HELVETICA, 12);

            HttpSession session = request.getSession();
            Order order = (Order) session.getAttribute("orderConfirm");

            if (order == null) {
                document.add(new Paragraph("Khong tim thay don hang trong session 😢", normalFont));
                document.close();
                return;
            }

            Customer customer = order.getCustomer();

            // Dinh dang ngay gio
            java.util.Date orderDate = order.getCreateDate();
            String formattedDate = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(orderDate);

            document.add(new Paragraph("HOA DON MUA HANG", titleFont));
            document.add(new Paragraph("Ngay dat hang: " + formattedDate, normalFont));
            document.add(new Paragraph(" "));

            document.add(new Paragraph("Ten khach hang: " + customer.getUsername(), normalFont));
            document.add(new Paragraph("Email: " + customer.getCustomerEmail(), normalFont));
            document.add(new Paragraph("SDT: " + customer.getCustomerMobiphone(), normalFont));
            document.add(new Paragraph("Phuong thuc thanh toan: " + order.getPaymentMethod(), normalFont));
            document.add(new Paragraph("------------------------------------------------"));

            // Bang chi tiet san pham
            PdfPTable table = new PdfPTable(3);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            table.addCell(new PdfPCell(new Phrase("San pham", boldFont)));
            table.addCell(new PdfPCell(new Phrase("So luong", boldFont)));
            table.addCell(new PdfPCell(new Phrase("Gia (VND)", boldFont)));

            int tongTien = 0;

            for (DetailOrder detail : order.getOrderDetails()) {
            	String tenSP = detail.getProductName() != null ? detail.getProductName() : "San pham khong ten";
                int soLuong = detail.getQuantityOrder();
                int gia = detail.getTotalPrice();
                tongTien += gia;

                table.addCell(new PdfPCell(new Phrase(tenSP, normalFont)));
                table.addCell(new PdfPCell(new Phrase(String.valueOf(soLuong), normalFont)));
                table.addCell(new PdfPCell(new Phrase(String.format("%,d", gia), normalFont)));
            }

            document.add(table);

            // Tong tien
            document.add(new Paragraph("TONG TIEN: " + String.format("%,d", tongTien) + " VND", boldFont));
            document.add(new Paragraph("------------------------------------------------"));
            document.add(new Paragraph("Cam on ban da mua hang ❤", boldFont));

            document.close();
        } catch (com.itextpdf.text.DocumentException e) {
            e.printStackTrace();
            response.getWriter().write("Loi khi xuat hoa don PDF");
        }
    }
        
        private void exportDocx(HttpServletRequest request, HttpServletResponse response) throws IOException {
            response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
            response.setHeader("Content-Disposition", "attachment; filename=hoadon.docx");

            HttpSession session = request.getSession();
            Order order = (Order) session.getAttribute("orderConfirm");

            XWPFDocument document = new XWPFDocument();
            XWPFParagraph para = document.createParagraph();
            XWPFRun run = para.createRun();

            if (order == null) {
                run.setText("Khong tim thay don hang trong session 😢");
                document.write(response.getOutputStream());
                document.close();
                return;
            }

            Customer customer = order.getCustomer();
            String formattedDate = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(order.getCreateDate());

            run.setBold(true);
            run.setFontSize(14);
            run.setText("HOA DON MUA HANG");
            run.addBreak();
            run.setBold(false);
            run.setFontSize(12);
            run.setText("Ngay dat hang: " + formattedDate);
            run.addBreak();
            run.setText("Ten khach hang: " + customer.getUsername());
            run.addBreak();
            run.setText("Email: " + customer.getCustomerEmail());
            run.addBreak();
            run.setText("SDT: " + customer.getCustomerMobiphone());
            run.addBreak();
            run.setText("Phuong thuc thanh toan: " + order.getPaymentMethod());
            run.addBreak();
            run.addBreak();

            int tongTien = 0;
            for (DetailOrder detail : order.getOrderDetails()) {
                String tenSP = detail.getProductName() != null ? detail.getProductName() : "San pham khong ten";
                int soLuong = detail.getQuantityOrder();
                int gia = detail.getTotalPrice();
                tongTien += gia;

                run.setText("- " + tenSP + " | SL: " + soLuong + " | Gia: " + String.format("%,d", gia) + " VND");
                run.addBreak();
            }

            run.addBreak();
            run.setBold(true);
            run.setText("TONG TIEN: " + String.format("%,d", tongTien) + " VND");
            run.addBreak();
            run.setText("Cam on ban da mua hang ❤");

          //  document.write(response.getOutputStream());
            ServletOutputStream out = response.getOutputStream();
            document.write(out);
            out.flush();  // Đảm bảo gửi hết dữ liệu
            out.close();  // Đóng stream sau khi xong
 
    }
        
}


