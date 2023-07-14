package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.SearchDAO;
import model.User;

public class SearchService {

	public ArrayList<User> search(String name ,int age) {
		Connection con = null;
		try {
			Class.forName("org.h2.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}
		ArrayList<User> list = new ArrayList<User>();
		try {
			//ここは自分のところのDBの場所に書き換えよう
			con = DriverManager.getConnection("jdbc:h2:file:C:/ysl7Data/ysl2023", "sa", "");
			SearchDAO dao = new SearchDAO(con);
			//必要であれば、ここでトランザクションをスタートする（不要な場合は書かない）
			//con.setAutoCommit(false);
			list = dao.search(name, age);
			//トランザクションがある場合はこちらに書く（無ければ書かない）
			//con.commit();
		}catch(SQLException e) {
			e.printStackTrace();
			//トランザクションがある場合はこちらに書く（無ければ丸ごと書かない）
			/*try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO 自動生成された catch ブロック
				e1.printStackTrace();
			}*/
			//Exceptionが出ているのでuserをnullで返す
			return list;
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			//トランザクションがある場合はこちらに書く（無ければ丸ごと書かない）
			/*try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO 自動生成された catch ブロック
				e1.printStackTrace();
			}*/
			//Exceptionが出ているのでuserをnullで返す
			return list;
		}
		// データベースを切断
		if (con != null) {
			try {
				con.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				//Exceptionが出ているのでuserをnullで返す
				return list;
			}
		}
		return list;
	}
}
