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
	//加载驱动，获取连接
	public void getConnection(){
		try {
			//加载驱动
			Class.forName("com.mysql.jdbc.Driver");
			//获取连接
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/design2", "root","mysql");
			//创建语句对象
			stmt = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	//更新数据库(增加(insert)，删除(delete)，修改(update))
	public int update(String sql){
		
		int result = -1;
		try {
			//获取连接
			getConnection();
			//发送语句
			result = stmt.executeUpdate(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	//一起执行
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
	
	
	
	//查询数据库(select)
	public ArrayList<Map<String, String>> query(String sql){
		ArrayList<Map<String, String>> rsList = null;
		
		try {
			rsList = new ArrayList<Map<String,String>>();
			//获取连接
			getConnection();
			//发送语句
			rs = stmt.executeQuery(sql);
			//获取数据库表的结构--->结果集结构对象
			ResultSetMetaData rsmd = rs.getMetaData();
			//每next一次，可以获取一条记录，并且这一条需要存储到map中
			while(rs.next()){
				//接口回调：
				Map<String,String> rsMap = new HashMap<String, String>();
				for(int i = 1;i <= rsmd.getColumnCount();i++){
					String columnName = rsmd.getColumnName(i);
					//字段值
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
	//重新封装一个返回值为ArrayList<String[]>形式的方法，用于显示在Table上。
	public ArrayList<String []> queryForTable(String sql){
		
		ArrayList<String[]> rsList = null;
		try {
			rsList = new ArrayList<String[]>();
			getConnection();
			rs = stmt.executeQuery(sql);
			//获取数据库表的结构--->结果集结构对象
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				//创建一个String类型的数组
				String []array = new String[rsmd.getColumnCount()];
				for(int i = 0;i < rsmd.getColumnCount();i++){
					String columnName = rsmd.getColumnName(i+1);
					//字段值
					String columnValue = rs.getString(columnName);
					
					//将字段值存储到数组中
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
	
	//关闭资源
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
