package model.bean;

import java.sql.Timestamp;

public class News {
	private int newsId;
	private String title;
	private String content;
	private String image;
	private Timestamp createdDate;
	
	public News(int newsId, String title, String content, String image, Timestamp createdDate) {
		this.newsId = newsId;
		this.title = title;
		this.content = content;
		this.image = image;
		this.createdDate = createdDate;
	}

	public News(String title, String content, String image, Timestamp createdDate) {
		this.title = title;
		this.content = content;
		this.image = image;
		this.createdDate = createdDate;
	}

	public News() {

	}

	public int getNewsId() {
		return newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "New [newId=" + newsId + ", title=" + title + ", content=" + content + ", image=" + image
				+ ", createdDate=" + createdDate + "]";
	}
	
	
}
