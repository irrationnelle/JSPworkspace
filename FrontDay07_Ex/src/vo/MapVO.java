package vo;

public class MapVO {
	private String title;
	private double lat;
	private double lng;
	
	public MapVO() {	}

	public MapVO(String title, double lat, double lng) {
		this.title = title;
		this.lat = lat;
		this.lng = lng;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}
	
	@Override
	public String toString() {
		return "MapVO[title: "+title+", lat: "+lat+", lng: "+lng+"]";
	}
}
