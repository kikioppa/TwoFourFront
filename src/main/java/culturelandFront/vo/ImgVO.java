package culturelandFront.vo;

public class ImgVO {
	private String img_path;	//full path
	private String img_url;		//full url
	private String img_name;	//file name only
	private String img_ext;		//ext
	private String makefoler;
	private String img_folder;
	private String img_width;
	
	
	
	
	public String getImg_width() {
		return img_width;
	}
	public void setImg_width(String img_width) {
		this.img_width = img_width;
	}
	public String getImg_folder() {
		return img_folder;
	}
	public void setImg_folder(String img_folder) {
		this.img_folder = img_folder;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getImg_ext() {
		return img_ext;
	}
	public void setImg_ext(String img_ext) {
		this.img_ext = img_ext;
	}
	public String getMakefoler() {
		return makefoler;
	}
	public void setMakefoler(String makefoler) {
		this.makefoler = makefoler;
	}
	@Override
	public String toString() {
		return "ImgVO [img_path=" + img_path + ", img_url=" + img_url + ", img_name=" + img_name + ", img_ext="
				+ img_ext + ", makefoler=" + makefoler + ", img_folder=" + img_folder + ", img_width=" + img_width
				+ "]";
	}
	
	
}
