package com.hzyc.design.po;

public class Page {
	
	private int currentPage = 1;	//���嵱ǰҳ��
	
	private int position;		//��ʾ��ѯ��¼����ʼλ��
	
	private int size = 10;			//��ʾÿҳ��ʾ�ļ�¼��
	
	private int total;			//�����ܼ�¼��
	private int totalPage;		//������ҳ��
	
	//select * from t_province limit (N - 1) * 10 , 10;
	
	//�������ÿ�β�ѯ��¼��λ��
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
