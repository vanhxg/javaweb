package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Brand;
import model.DetailOrder;
import model.Order;
import model.Product;
import model.ProductStat;

public class DetailOrderDAO implements DAOInterface<DetailOrder>{
	
	@Override
	public ArrayList<DetailOrder> selectAll() {
		ArrayList<DetailOrder> ketQua = new ArrayList<DetailOrder>();
	    try {
	        // Bước 1: Tạo kết nối
	        Connection con = JDBCUtil.getConnection();

	        // Bước 2: Tạo đối tượng statement
	        String sql = "SELECT d.detailorderid, d.orderid, p.productid, d.quantityorder, p.productcost, d.totalprice "
	                + "FROM detailorder d "
	                + "JOIN product p ON d.productid = p.productid "
	                + "ORDER BY d.detailorderid";
	        PreparedStatement st = con.prepareStatement(sql);

	        // Bước 3: Thực thi SQL
	        System.out.println(sql);
	        ResultSet rs = st.executeQuery();

	        // Bước 4: Xử lý kết quả
	        while (rs.next()) {
	            String detailOrderId = rs.getString("detailorderid");
	            String orderId = rs.getString("orderid");
	            String productId = rs.getString("productid");
	            int quantityOrder = rs.getInt("quantityorder");
	            
	            int totalPrice = rs.getInt("totalprice");

	            // Lấy đối tượng Product từ ProductDAO
	            Product product = new ProductDAO().selectById(new Product(productId));

	            Order order = new OrderDAO().selectById(new Order(orderId));
;

	            // Tạo đối tượng DetailOrder
	            DetailOrder detailOrder = new DetailOrder(detailOrderId, order, product, quantityOrder, totalPrice);

	            ketQua.add(detailOrder);
	        }

	        // Bước 5: Đóng kết nối
	        JDBCUtil.closeConnection(con);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return ketQua;
	}
	
	public ArrayList<DetailOrder> getOrderDetailsByOrderId(String orderId) {
	    ArrayList<DetailOrder> list = new ArrayList<>();
	    try {
	        Connection con = JDBCUtil.getConnection();
	        String sql = "SELECT d.detailorderid, d.orderid, p.productid, d.quantityorder, p.productcost, d.totalprice "
	                   + "FROM detailorder d "
	                   + "JOIN product p ON d.productid = p.productid "
	                   + "WHERE d.orderid = ?";
	        PreparedStatement st = con.prepareStatement(sql);
	        st.setString(1, orderId);
	        ResultSet rs = st.executeQuery();

	        while (rs.next()) {
	            String detailOrderId = rs.getString("detailorderid");
	            String oid = rs.getString("orderid");
	            String productId = rs.getString("productid");
	            int quantityOrder = rs.getInt("quantityorder");
	            
	            int totalPrice = rs.getInt("totalprice");

	            Product product = new ProductDAO().selectById(new Product(productId));
	            Order order = new OrderDAO().selectById(new Order(oid));

	            DetailOrder detailOrder = new DetailOrder(detailOrderId, order, product, quantityOrder, totalPrice);
	            list.add(detailOrder);
	        }
	        JDBCUtil.closeConnection(con);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	// ==========BỔ SUNG===========
	//	===========================
	// Hàm trả về sản phẩm
	public DetailOrder getDetailOrderByOrderId(String orderId) {
	    DetailOrder detail = null;
	    try {
	        Connection con = JDBCUtil.getConnection();
	        String sql = "SELECT d.*, p.productname, p.productimage FROM detailorder d "
	                   + "JOIN products p ON d.productid = p.productid "
	                   + "WHERE d.orderid = ?";
	        PreparedStatement st = con.prepareStatement(sql);
	        st.setString(1, orderId);
	        ResultSet rs = st.executeQuery();

	        if (rs.next()) {
	            detail = new DetailOrder();
	            detail.setDetailOrderId(rs.getString("detailorderid"));
	            detail.setQuantityOrder(rs.getInt("quantityorder"));
	            detail.setTotalPrice(rs.getInt("totalprice"));

	            // set thông tin sản phẩm rút gọn
	            detail.setProductName(rs.getString("productname"));
	            detail.setProductImage(rs.getString("productimage"));
	        }

	        JDBCUtil.closeConnection(con);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return detail;
	}


	@Override
	public DetailOrder selectById(DetailOrder t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(DetailOrder t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(ArrayList<DetailOrder> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(DetailOrder t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<DetailOrder> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(DetailOrder t) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// ==========BỔ SUNG===========
	//	===========================
	// Hàm lấy doanh thu theo tháng
	public int getRevenueByMonth(int month, int year) {
	    int revenue = 0;
	    try {
	        Connection con = JDBCUtil.getConnection();

	        String sql = """
	            SELECT SUM(d.totalprice) AS total 
	            FROM detailorder d  
	            JOIN `order` o ON d.orderid = o.orderid
	            WHERE MONTH(o.creatorder) = ? AND YEAR(o.creatorder) = ?
	        """;

	        PreparedStatement st = con.prepareStatement(sql);
	        st.setInt(1, month);
	        st.setInt(2, year);

	        ResultSet rs = st.executeQuery();
	        if (rs.next()) {
	            revenue = rs.getInt("total"); // Vì kiểu dữ liệu của totalprice là INT
	        }

	        JDBCUtil.closeConnection(con);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return revenue;
	}
	
	// ==========BỔ SUNG===========
	//	===========================
	// Lấy ra top 5 sản phẩm bán chạy nhất
	public ArrayList<ProductStat> getTop5BestSellingProducts() {
	    ArrayList<ProductStat> list = new ArrayList<>();
	    try {
	        Connection con = JDBCUtil.getConnection();
	        String sql = """
	            SELECT p.productname, SUM(d.quantityorder) AS quantitySold
	            FROM detailorder d
	            JOIN product p ON d.productid = p.productid
	            GROUP BY p.productname
	            ORDER BY quantitySold DESC
	            LIMIT 5
	        """;
	        PreparedStatement st = con.prepareStatement(sql);
	        ResultSet rs = st.executeQuery();

	        while (rs.next()) {
	            String name = rs.getString("productname");
	            int sold = rs.getInt("quantitySold");
	            list.add(new ProductStat(name, sold));
	        }

	        JDBCUtil.closeConnection(con);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}


	
	public static void main(String[] args) {
//		DetailOrderDAO bd = new DetailOrderDAO();

		DetailOrderDAO dao = new DetailOrderDAO();

	    // Ví dụ: kiểm tra doanh thu tháng 6 năm 2025
	    int month = 6;
	    int year = 2025;

	    int revenue = dao.getRevenueByMonth(month, year);

	    System.out.println("Doanh thu tháng " + month + "/" + year + " là: " + revenue + " VND");

		ArrayList<ProductStat> kq = dao.getTop5BestSellingProducts();
		for (ProductStat detail : kq) {
			System.out.println(detail.toString());
		}
		 
	}
}
