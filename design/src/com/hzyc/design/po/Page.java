package com.hzyc.design.po;

public class Page {
	
	private int currentPage = 1;	//定义当前页数
	
	private int position;		//表示查询记录的起始位置
	
	private int size = 10;			//表示每页显示的记录数
	
	private int total;			//定义总记录数
	private int totalPage;		//定义总页数
	
	//select * from t_province limit (N - 1) * 10 , 10;
	
	//定义计算每次查询记录的位置
	public void calculatePosition(){
		setPosition((getCurrentPage() - 1) * getSize());
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	
	
	public void pageUp(int nowPage){
		nowPage = nowPage <= 1 ? 1 : nowPage - 1;
		setCurrentPage(nowPage);
	}
	
	public void pageDown(int nowPage){
		nowPage = currentPage<=total/10+1 ?nowPage + 1:nowPage;
		setCurrentPage(nowPage);
	}
}
