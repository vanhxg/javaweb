package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Brand;

public class BrandDAO implements DAOInterface<Brand>{
	//private ArrayList<Brand> data = new ArrayList<>();
	
	@Override
	public ArrayList<Brand> selectAll() {
		ArrayList<Brand> ketQua = new ArrayList<Brand>();
		try {
			// Bước 1: Tạo kết nối
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: Tạo ra đối tượng statement
			String sql = "SELECT * FROM brand";
			PreparedStatement st = con.prepareStatement(sql);
			
			// Bước 3: Thực thi một câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			
			// Bước 4: xử lý kết quả 
			while(rs.next()) {
				String brandId = rs.getString("brandid");
				String brandName = rs.getString("brandname");
				String brandAddress = rs.getString("brandaddress");
				String brandMobiphone = rs.getString("brandmobiphone");
				
				Brand brand = new Brand(brandId, brandName, brandAddress, brandMobiphone);
				ketQua.add(brand);
			}
			
			// Bước 5: ngắt kết nối
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ketQua;
	}

	@Override
	public Brand selectById(Brand t) {
		Brand ketQua = null;
		try {
			// Bước 1: Tạo kết nối
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: Tạo ra đối tượng statement
			String sql = "SELECT * FROM brand WHERE brandid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getBrandId());
			
			// Bước 3: Thực thi một câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			
			// Bước 4: xử lý kết quả 
			while(rs.next()) {
				String brandId = rs.getString("brandid");
				String brandName = rs.getString("brandname");
				String brandAddress = rs.getString("brandaddress");
				String brandMobiphone = rs.getString("brandmobiphone");
				
				ketQua = new Brand(brandId, brandName, brandAddress, brandMobiphone);
				break;
			}
			
			// Bước 5: ngắt kết nối
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ketQua;
	}

	@Override
	public int insert(Brand t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO brand (brandid, brandname, brandaddress, brandmobiphone) "+
					" VALUES (?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getBrandId());
			st.setString(2, t.getBrandName());
			st.setString(3, t.getBrandAddress());
			st.setString(4, t.getBrandMobiphone());
			
			// Bước 3: thực thi câu lệnh SQL
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<Brand> arr) {
		int count = 0;
		for (Brand brand : arr) {
			count += this.insert(brand);
		}
		return count;
	}

	@Override
	public int delete(Brand t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from brand "+
					 " WHERE brandid=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getBrandId());
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	@Override
	public int deleteAll(ArrayList<Brand> arr) {
		int count = 0;
		for (Brand brand : arr) {
			count += this.delete(brand);
		}
		return count;
	}

	@Override
	public int update(Brand t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE brand "+
					 " SET " +
					 " brandname=?"+
					 ", brandaddress=?"+
					 ", brandmobiphone=?"+
					 " WHERE brandid=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getBrandName());
			st.setString(2, t.getBrandAddress());
			st.setString(3, t.getBrandMobiphone());
			st.setString(4, t.getBrandId());
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}
	
	// Hàm tự sinh ra mã brand
	public String generateNextBrandId() {
		String nextId = "B001"; // giá trị mặc định nếu bảng rỗng

		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT brandId FROM brand ORDER BY brandId DESC LIMIT 1";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String lastId = rs.getString("brandId"); // VD: B015
				int nextNum = Integer.parseInt(lastId.substring(1)) + 1;
				nextId = String.format("B%03d", nextNum); // VD: B016
			}

			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Lỗi khi sinh mã nhà cung cấp mới!");
		}

		return nextId;
	}


	
	public static void main(String[] args) {
		BrandDAO bd = new BrandDAO();
		ArrayList<Brand> kq = bd.selectAll();
		for (Brand brand : kq) {
			System.out.println(brand.toString());
		}
		
//		
//		 Brand b = bd.selectById(new Brand("B009", "Canifa", "23 Nguyễn Chí Thanh, Đống Đa, Hà Nội", "0989012345"));
//		 System.out.println(b);
		 
//		 Brand b_new = new Brand("B016", "Owens", "1 Nguyễn Văn Cừ, Long Biên, Hà Nội", "0956677889");
//		 //bd.insert(b_new);
//		 bd.delete(b_new);
		 
//		 Brand b = bd.selectById(new Brand("B009", "Canifa", "23 Nguyễn Chí Thanh, Đống Đa, Hà Nội", "0989012345"));
//		 System.out.println(b);
//		
//		 b.setBrandMobiphone("0398681023");
//		 bd.update(b);
		 
	}
	
}
