package com.hzyc.design.controller;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbUtils {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	//������������ȡ����
	public void getConnection(){
		try {
			//��������
			Class.forName("com.mysql.jdbc.Driver");
			//��ȡ����
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/design2", "root","mysql");
			//����������
			stmt = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	//�������ݿ�(����(insert)��ɾ��(delete)���޸�(update))
	public int update(String sql){
		
		int result = -1;
		try {
			//��ȡ����
			getConnection();
			//�������
			result = stmt.executeUpdate(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	//һ��ִ��
public int[] Batch(List<String> sqlList){
		
		
     	try {
     		getConnection();
     		
     		for(int i = 0;i < sqlList.size();i++){
     			stmt.addBatch(sqlList.get(i));
     		}
     		
			int [] array = stmt.executeBatch();
			return array;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return null;
		
	}
	
	
	
	//��ѯ���ݿ�(select)
	public ArrayList<Map<String, String>> query(String sql){
		ArrayList<Map<String, String>> rsList = null;
		
		try {
			rsList = new ArrayList<Map<String,String>>();
			//��ȡ����
			getConnection();
			//�������
			rs = stmt.executeQuery(sql);
			//��ȡ���ݿ��Ľṹ--->������ṹ����
			ResultSetMetaData rsmd = rs.getMetaData();
			//ÿnextһ�Σ����Ի�ȡһ����¼��������һ����Ҫ�洢��map��
			while(rs.next()){
				//�ӿڻص���
				Map<String,String> rsMap = new HashMap<String, String>();
				for(int i = 1;i <= rsmd.getColumnCount();i++){
					String columnName = rsmd.getColumnName(i);
					//�ֶ�ֵ
					String columnValue = rs.getString(columnName);
					
					rsMap.put(columnName, columnValue);
				}
				rsList.add(rsMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return rsList;
	}
	//���·�װһ������ֵΪArrayList<String[]>��ʽ�ķ�����������ʾ��Table�ϡ�
	public ArrayList<String []> queryForTable(String sql){
		
		ArrayList<String[]> rsList = null;
		try {
			rsList = new ArrayList<String[]>();
			getConnection();
			rs = stmt.executeQuery(sql);
			//��ȡ���ݿ��Ľṹ--->������ṹ����
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				//����һ��String���͵�����
				String []array = new String[rsmd.getColumnCount()];
				for(int i = 0;i < rsmd.getColumnCount();i++){
					String columnName = rsmd.getColumnName(i+1);
					//�ֶ�ֵ
					String columnValue = rs.getString(columnName);
					
					//���ֶ�ֵ�洢��������
					array[i] = columnValue;
				}
				
				rsList.add(array);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close();
		}
		
		
		return rsList;
	}
	
	//�ر���Դ
	public void close(){
		try {
			if(rs != null){
				rs.close();
			}
			if(stmt != null){
				stmt.close();
			}
			if(conn != null){
				conn.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
