package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.mindrot.jbcrypt.BCrypt;
import java.sql.Date;
import model.Customer;

public class CustomerDAO implements DAOInterface<Customer> {

    @Override
    public ArrayList<Customer> selectAll() {
        ArrayList<Customer> ketQua = new ArrayList<>();
        try (Connection con = JDBCUtil.getConnection()) {
            String sql = "SELECT * FROM customer WHERE is_deleted = FALSE";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ketQua.add(createCustomerFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    @Override
    public Customer selectById(Customer t) {
        Customer ketQua = null;
        try (Connection con = JDBCUtil.getConnection()) {
            String sql = "SELECT * FROM customer WHERE customerid = ? AND is_deleted = FALSE";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getCustomerId());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ketQua = createCustomerFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    @Override
    public int insert(Customer t) {
        int ketQua = 0;
        try (Connection con = JDBCUtil.getConnection()) {
            // Hash password nếu chưa mã hóa
            String rawPassword = t.getPassword();
            if (rawPassword != null && !rawPassword.startsWith("$2a$")) {
                t.setPassword(BCrypt.hashpw(rawPassword, BCrypt.gensalt()));
            }

            String sql = "INSERT INTO customer (customerid, username, password, customername, customergender, "
                    + "customerdate, customeraddress, customermobiphone, customeremail, customeradmin, is_deleted) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, FALSE)";
            PreparedStatement st = con.prepareStatement(sql);
            setPreparedStatementForInsertUpdate(st, t);
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    // Xóa mềm: đánh dấu is_deleted = TRUE và set deleted_at = CURRENT_TIMESTAMP
    @Override
    public int delete(Customer t) {
        return softDelete(t.getCustomerId());
    }

    public int softDelete(String customerId) {
        int ketQua = 0;
        try (Connection con = JDBCUtil.getConnection()) {
            String sql = "UPDATE customer SET is_deleted = TRUE, deleted_at = CURRENT_TIMESTAMP WHERE customerid = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, customerId);
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    // Xóa cứng (dùng cho thùng rác)
    public int hardDelete(String customerId) {
        int ketQua = 0;
        try (Connection con = JDBCUtil.getConnection()) {
            String sql = "DELETE FROM customer WHERE customerid = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, customerId);
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    // Khôi phục xóa mềm (restore)
    public int restore(String customerId) {
        int ketQua = 0;
        try (Connection con = JDBCUtil.getConnection()) {
            String sql = "UPDATE customer SET is_deleted = FALSE, deleted_at = NULL WHERE customerid = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, customerId);
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    // Lấy danh sách các customer đã bị xóa mềm (thùng rác)
    public ArrayList<Customer> selectAllDeleted() {
        ArrayList<Customer> list = new ArrayList<>();
        try {
            Connection conn = JDBCUtil.getConnection();
            String sql = "SELECT * FROM customer WHERE is_deleted = TRUE"; // hoặc TRUE nếu DB dùng kiểu BOOLEAN
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getString("customerid"));
                customer.setUsername(rs.getString("username"));
                customer.setPassword(rs.getString("password"));
                customer.setCustomerName(rs.getString("customername"));
                customer.setCustomerGender(rs.getString("customergender"));
                customer.setCustomerDate(rs.getDate("customerdate"));
                customer.setCustomerAddress(rs.getString("customeraddress"));
                customer.setCustomerMobiphone(rs.getString("customermobiphone"));
                customer.setCustomerEmail(rs.getString("customeremail"));
                customer.setIsAdmin(rs.getString("customeradmin"));
                customer.setDeleted(rs.getBoolean("is_deleted"));
                customer.setDeletedAt(rs.getTimestamp("deleted_at"));

                list.add(customer);
            }

            JDBCUtil.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // Cập nhật thông tin customer (update)
    @Override
    public int update(Customer t) {
        int ketQua = 0;
        try (Connection con = JDBCUtil.getConnection()) {
            String rawPassword = t.getPassword();
            if (rawPassword != null && !rawPassword.startsWith("$2a$")) {
                t.setPassword(BCrypt.hashpw(rawPassword, BCrypt.gensalt()));
            }

            String sql = "UPDATE customer SET username = ?, password = ?, customername = ?, customergender = ?, "
                    + "customerdate = ?, customeraddress = ?, customermobiphone = ?, customeremail = ?, customeradmin = ? "
                    + "WHERE customerid = ?";
            PreparedStatement st = con.prepareStatement(sql);
            setPreparedStatementForInsertUpdate(st, t);
            st.setString(11, t.getCustomerId());
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    // Các phương thức tiện ích và hỗ trợ
    private Customer createCustomerFromResultSet(ResultSet rs) throws SQLException {
        return new Customer(
            rs.getString("customerid"),
            rs.getString("username"),
            rs.getString("password"),
            rs.getString("customername"),
            rs.getString("customergender"),
            rs.getDate("customerdate"),
            rs.getString("customeraddress"),
            rs.getString("customermobiphone"),
            rs.getString("customeremail"),
            rs.getString("customeradmin"),
            rs.getBoolean("is_deleted"),
            rs.getTimestamp("deleted_at")
        );
    }

    private void setPreparedStatementForInsertUpdate(PreparedStatement st, Customer t) throws SQLException {
        st.setString(1, t.getCustomerId());
        st.setString(2, t.getUsername());
        st.setString(3, t.getPassword());
        st.setString(4, t.getCustomerName());
        st.setString(5, t.getCustomerGender());
        st.setDate(6, t.getCustomerDate());
        st.setString(7, t.getCustomerAddress());
        st.setString(8, t.getCustomerMobiphone());
        st.setString(9, t.getCustomerEmail());
        st.setString(10, t.getIsAdmin());
    }

    @Override
    public int insertAll(ArrayList<Customer> arr) {
        int count = 0;
        for (Customer c : arr) {
            count += insert(c);
        }
        return count;
    }

    @Override
    public int deleteAll(ArrayList<Customer> arr) {
        int count = 0;
        for (Customer c : arr) {
            count += softDelete(c.getCustomerId());
        }
        return count;
    }

    // Tự động xóa cứng các bản ghi đã xóa mềm quá 10 ngày
    public int autoDeleteOldRecords() {
        int ketQua = 0;
        try (Connection con = JDBCUtil.getConnection()) {
            String sql = "DELETE FROM customer WHERE is_deleted = TRUE AND deleted_at < DATE_SUB(NOW(), INTERVAL 10 DAY)";
            PreparedStatement st = con.prepareStatement(sql);
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    // Sinh mã customerId tự động dạng KH001, KH002...
    public String generateNextCustomerId() {
        String nextId = "KH001";
        try (Connection con = JDBCUtil.getConnection()) {
            String sql = "SELECT customerid FROM customer ORDER BY customerid DESC LIMIT 1";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String lastId = rs.getString("customerid");
                int nextNum = Integer.parseInt(lastId.substring(2)) + 1;
                nextId = String.format("KH%03d", nextNum);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nextId;
    }

	// Hàm mã hóa lại mật khẩu cho tất cả khách hàng nếu chưa được mã hóa
	public void encryptExistingPasswords() {
	    ArrayList<Customer> customers = this.selectAll();
	    for (Customer customer : customers) {
	        String currentPassword = customer.getPassword();
	        System.out.println("Tài khoản: " + customer.getUsername());
	        System.out.println("Mật khẩu hiện tại: " + currentPassword);

	        if (currentPassword != null && !currentPassword.startsWith("$2a$")) {
	            String hashedPassword = BCrypt.hashpw(currentPassword, BCrypt.gensalt());
	            System.out.println("Mật khẩu sau mã hóa: " + hashedPassword);

	            customer.setPassword(hashedPassword);
	            int kq = this.update(customer);  // update không mã hóa nữa
	            System.out.println("Kết quả update: " + kq);
	        } else {
	            System.out.println("Bỏ qua vì mật khẩu đã mã hóa hoặc null.");
	        }
	    }
	}
	
	// Lấy số lượng khách hàng role = user
	public int getCountUser() {
	    int count = 0;
	    try {
	        // Bước 1: Tạo kết nối đến CSDL
	        Connection con = JDBCUtil.getConnection();

	        // Bước 2: Tạo câu lệnh SQL (giả định customeradmin = '0' là user)
	        String sql = "SELECT COUNT(*) AS total FROM customer WHERE customeradmin = 'user'";
	        PreparedStatement st = con.prepareStatement(sql);

	        // Bước 3: Thực thi câu lệnh SQL
	        ResultSet rs = st.executeQuery();

	        // Bước 4: Xử lý kết quả
	        if (rs.next()) {
	            count = rs.getInt("total");
	        }

	        // Bước 5: Ngắt kết nối
	        JDBCUtil.closeConnection(con);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return count;
	}
	
	public int getCountGender(String gender) {
	    int count = 0;
	    try {
	        Connection con = JDBCUtil.getConnection();
	        String sql = "SELECT COUNT(*) FROM customer WHERE customergender = ?";
	        PreparedStatement st = con.prepareStatement(sql);
	        st.setString(1, gender);
	        ResultSet rs = st.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	        JDBCUtil.closeConnection(con);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}
	
	
	public static void main(String[] args) { 
//		CustomerDAO bd = new CustomerDAO();
//	 
//		 // Mã hóa lại toàn bộ mật khẩu chưa được mã hóa
//		 bd.encryptExistingPasswords();
//		 // Kiểm tra lại danh sách khách hàng 
//		 ArrayList<Customer> kq = bd.selectAll();
//		 for (Customer cs : kq) { 
//			 System.out.println(cs.toString()); 
//			 } 
//		 }
		CustomerDAO dao = new CustomerDAO();
	    int userCount = dao.getCountUser();
	    System.out.println("Số lượng customer có vai trò là user: " + userCount);
	    int genderCount = dao.getCountGender("Nam");
	    System.out.println("Số lượng customer Nam: " + genderCount);
	}

	public Customer getCustomerById(String customerId) {
		    String sql = "SELECT * FROM customer WHERE customerid = ? AND is_deleted = 0";
		    try (
		    		//Tạo kết nối đến CSDL
		    	Connection con = JDBCUtil.getConnection();
		        PreparedStatement ps = con.prepareStatement(sql)) {
		    	
		    	
		        ps.setString(1, customerId);
		        
		        //Thực thi câu lệnh SQL
		        try (ResultSet rs = ps.executeQuery()) {
		        	//Xử lý kết quả
		            if (rs.next()) {
		                Customer customer = new Customer();
		                customer.setCustomerId(rs.getString("customerid"));
		                customer.setUsername(rs.getString("username"));
		                customer.setPassword(rs.getString("password"));
		                customer.setCustomerName(rs.getString("customername"));
		                customer.setCustomerGender(rs.getString("customergender"));
		                customer.setCustomerDate(rs.getDate("customerdate"));
		                customer.setCustomerAddress(rs.getString("customeraddress"));
		                customer.setCustomerMobiphone(rs.getString("customermobiphone"));
		                customer.setCustomerEmail(rs.getString("customeremail"));
		                customer.setIsAdmin(rs.getString("customeradmin"));
		                return customer;
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return null;
	}
}