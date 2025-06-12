package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Category;

public class CategoryDAO implements DAOInterface<Category> {
	
	@Override
	public ArrayList<Category> selectAll() {
		ArrayList<Category> result = new ArrayList<>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM category";
			PreparedStatement st = con.prepareStatement(sql);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String categoryId = rs.getString("categoryid");
				String categoryName = rs.getString("categoryname");
				
				Category category = new Category(categoryId, categoryName);
				result.add(category);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Category selectById(Category t) {
		Category result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM category WHERE categoryid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getCategoryId());
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				String categoryId = rs.getString("categoryid");
				String categoryName = rs.getString("categoryname");
				
				result = new Category(categoryId, categoryName);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Category t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO category (categoryid, categoryname) VALUES (?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getCategoryId());
			st.setString(2, t.getCategoryName());
			
			result = st.executeUpdate();
			
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result +" dòng bị thay đổi!");
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertAll(ArrayList<Category> arr) {
		int count = 0;
		for (Category category : arr) {
			count += this.insert(category);
		}
		return count;
	}

	@Override
	public int delete(Category t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE FROM category WHERE categoryid=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getCategoryId());
			
			System.out.println(sql);
			result = st.executeUpdate();
			
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result +" dòng bị thay đổi!");
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteAll(ArrayList<Category> arr) {
		int count = 0;
		for (Category category : arr) {
			count += this.delete(category);
		}
		return count;
	}

	@Override
	public int update(Category t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "UPDATE category SET categoryname=? WHERE categoryid=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getCategoryName());
			st.setString(2, t.getCategoryId());
			
			System.out.println(sql);
			result = st.executeUpdate();
			
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result +" dòng bị thay đổi!");
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// Hàm tự sinh ra mã category
	public String generateNextCategoryId() {
		String nextId = "C001"; // giá trị mặc định nếu bảng rỗng

		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT categoryId FROM category ORDER BY categoryId DESC LIMIT 1";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String lastId = rs.getString("categoryId"); // VD: C015
				int nextNum = Integer.parseInt(lastId.substring(1)) + 1;
				nextId = String.format("C%03d", nextNum); // VD: C016
			}

			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Lỗi khi sinh mã danh mục mới!");
		}

		return nextId;
	}
	
	public static void main(String[] args) {
		CategoryDAO dao = new CategoryDAO();
		
		ArrayList<Category> categories = dao.selectAll();
		for (Category category : categories) {
			System.out.println(category);
		}
		
	}
}