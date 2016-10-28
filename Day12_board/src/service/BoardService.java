package service;

public class BoardService {
	// Singleton Pattern
	private static BoardService instance;
	public static BoardService getInstance() {
		if(instance == null)
			instance = new BoardService();
		return instance;
	}
	
	private BoardService() {
		
	}
}
