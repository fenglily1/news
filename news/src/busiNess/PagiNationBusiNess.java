package busiNess;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.NewsDao;

public class PagiNationBusiNess {

	public JSONObject getPageSizeNews(JSONObject inputJosn){
		NewsDao newsDao=new NewsDao();
		JSONObject returnJsonData=new JSONObject();
		Integer totalNews=newsDao.getTotalNews();
		Integer totalPages=totalNews%util.StaticParameters.PAGESIZE==0?totalNews/util.StaticParameters.PAGESIZE:totalNews/util.StaticParameters.PAGESIZE+1;
		Object currentPageO = inputJosn.get("currentPage");
//		System.out.println("currentPageO="+currentPageO);
		Integer currentPage=Integer.parseInt(currentPageO.toString());
//		System.out.println("currentPage="+currentPage);
		JSONArray jsonContent=newsDao.getPageSizeJsonArray(currentPage);
		returnJsonData.put("newTotalPages", totalPages);
		returnJsonData.put("jsonContent", jsonContent);
		return returnJsonData;
	}

}
