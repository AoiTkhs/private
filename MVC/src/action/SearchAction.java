package action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import model.User;
import service.SearchService;

public class SearchAction {
	HttpServletRequest request=null;

	public SearchAction(HttpServletRequest request) {
		System.out.println("001");
		this.request=request;
	}

	public String search() throws UnsupportedEncodingException  {
		request.setCharacterEncoding("UTF-8");
		//最初にありえない値をセットしておく
		int age=999;
		//値を取得する
		String name = request.getParameter("name");
		System.out.println("002");

		if(!request.getParameter("age").equals("")) {
			age = Integer.parseInt(request.getParameter("age"));
		}

		//Serviceに処理を委譲する
		SearchService service = new SearchService();
		ArrayList<User> list = service.search(name,age);

		//戻ってきた値がnullだったら
		if(list == null) {
			request.setAttribute("msg", "※ヒットしませんでした");
			return "/WEB-INF/jsp/search.jsp";
		//ちゃんと入っていたら
		}else {
			//戻ってきたlistをrequestに格納し、servletに次のＪＳＰのパスを送る
			request.setAttribute("list", list);
			return "/WEB-INF/jsp/search.jsp";
		}
	}
}
