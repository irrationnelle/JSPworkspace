package service;

import java.util.List;

import dao.MapDAO;
import vo.MapVO;

public class MapService {
	// ╫л╠шео(singleton)
	private static MapService instance;
	public static MapService getInstance(){
		if(instance == null)
			instance = new MapService();
		return instance;
	}
	private MapService(){}
	
	public String getXML(String title) {
		MapDAO dao = MapDAO.getInstance();
		MapVO map = dao.selectMap(title);
		
		String result = "<?xml version='1.0' encoding='UTF-8'?>\n" 
					  + "<item>\n" 
					  + "<title>" + map.getTitle() + "</title>\n"
					  + "<lat>" + map.getLat() + "</lat>\n"
					  
					  + "<lng>" + map.getLng() + "</lng>\n"
					  + "</item>";
		
		return result;
	}
}