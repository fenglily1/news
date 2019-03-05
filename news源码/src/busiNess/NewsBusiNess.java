package busiNess;

import java.util.Date;

import org.json.JSONObject;

import dao.NewsDao;
import modle.News;

public class NewsBusiNess {
	//整理数据准备持久化
	public Integer safeNews(JSONObject inputJosn) {
		News news=new modle.News();
		news.setContent(inputJosn.getString("content"));
		news.setCreateTime(new  Date());
		news.setDetail(inputJosn.getString("detail"));
		news.setNewsImg(inputJosn.getString("newsImg"));
		news.setTitle(inputJosn.getString("title"));
		NewsDao newsDao=new NewsDao();
		newsDao.createOrUpdate(news);
		Integer totalNews=newsDao.getTotalNews();
		Integer totalPages=totalNews%util.StaticParameters.PAGESIZE==0?totalNews/util.StaticParameters.PAGESIZE:totalNews/util.StaticParameters.PAGESIZE+1;
		return totalPages;
	}

}
