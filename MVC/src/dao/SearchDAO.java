package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.User;

public class SearchDAO {
	Connection con=null;

	public SearchDAO(Connection con) {
		this.con=con;
	}

	//ログインして、合致したデータがあった場合はUser型の値を返却する（無ければnull)
	public ArrayList<User> search(String name,int age) throws SQLException, ClassNotFoundException {

		//あらかじめreturn用の変数を用意しておく
		ArrayList<User> list = new ArrayList<User>();
		// JDBCドライバを読み込む
		Class.forName("org.h2.Driver");

		String sql =null;
		// SQL文を準備する
		if(age==999) {
			sql = "select * from user where name like ? ";
		}else {
			sql = "select * from user where name like ? and age = ?";
		}
		PreparedStatement pStmt = con.prepareStatement(sql);
		// SQL文を完成させる
		pStmt.setString(1,"%"+name+"%");
		if(age!=999) {
			pStmt.setInt(2,age);
		}

		// SQL文を実行し、結果表を取得する
		ResultSet rs = pStmt.executeQuery();

		// 結果表をコレクションにコピーする
		while (rs.next()) {
			System.out.println(rs.getString("id"));
			User user = new User();
			user.setId(rs.getString("id"));
			user.setName(rs.getString("name"));
			user.setAge(rs.getInt("age"));
			list.add(user);
		}

		if(list.size()==0) {
			list=null;
		}

		// 結果を返す
		return list;

	}
}
