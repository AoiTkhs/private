package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.SearchAction;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//単にlogin画面に遷移させるだけのメソッド
		String path="/WEB-INF/jsp/search.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//ページIDの取得
		String pageId = request.getParameter("pageId");
		//ボタンの名前の取得
		String button = request.getParameter("submit");
		//次に飛ぶところのURLをNULLで宣言して、処理によって値を格納する
		String url = null;
		System.out.println(pageId);
		System.out.println(button);

		// 検索ボタンが押されたらここが処理される
		if(pageId.equals("LAONE") && button.equals("検索")) {
			//アクションをインスタンス化
			System.out.println("01");
			SearchAction action = new SearchAction(request);
			System.out.println("000");
			url = action.search();
		}

		//JSPさんへ処理を依頼する
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
