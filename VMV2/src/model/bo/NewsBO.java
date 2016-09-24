package model.bo;

import java.util.ArrayList;

import model.bean.News;
import model.dao.NewsDAO;

public class NewsBO {
	NewsDAO dao = new NewsDAO();
	
	public ArrayList<News> getAllNews() {
		return dao.getAllNews();
	}
	
	public ArrayList<News> getNewsLimit(int start, int limit) {
		return dao.getNewsLimit(start, limit);
	}
	
	public News getNewsById(int newsId) {
		return dao.getNewsById(newsId);
	}
	
	public int insertNews(News news) {
		return dao.insertNews(news);
	}
	
	public int updateNews(News news) {
		return dao.updateNews(news);
	}
	
	public int deleteNews(int newsId) {
		return dao.deleteNews(newsId);
	}
	
	public int countNews() {
		return dao.countNews();
	}
}
