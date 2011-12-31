package com.goodjob.order;

import java.sql.Connection;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import com.goodjob.db.DBManager;
import com.goodjob.order.dto.GolfLinkDto;
import com.goodjob.sql.ORDER;

public class GolfLinkDao {
	public List<GolfLinkDto> getList(String tableName , Map<String,String> data){
		List<GolfLinkDto> list = null;
		Connection conn = null;
		
		String field = StringUtils.defaultIfEmpty(data.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
		int npage = NumberUtils.toInt(data.get("npage"), 1);
		int per_page = NumberUtils.toInt(data.get("per_page"), ORDER.per_page);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			
			//요값은 무조건있어야지요~
			where = "WHERE menu_seq = ? " ;
			params.add(data.get("menu_seq"));
			
			if("golflink_name".equals(field) && keyword.length()>0){
				where += "AND golflink_name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_day".equals(field) && keyword.length()>0){
				where += "AND reserve_day LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_name".equals(field) && keyword.length()>0){
				where += "AND reserve_name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("product_price".equals(field) && keyword.length()>0){
				where += "AND product_price LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("process_status".equals(field) && keyword.length()>0){
				where += "AND process_status LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			
			//페이징
			params.add(((npage-1)* per_page));
			params.add(per_page);
			
			list = (List<GolfLinkDto>)qr.query(conn , MessageFormat.format(ORDER.list, tableName, where), rsh , params.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public int getTotalCount(String tableName , Map<String,String> data) {
		Connection conn = null;
		Map<String, Long> map = null;
		try {
			
			String field = StringUtils.defaultIfEmpty(data.get("field"), "");
			String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
			int npage = NumberUtils.toInt(data.get("npage"), 1);
			
			ArrayList<Object> params = new ArrayList<Object>();
			
			conn = DBManager.getConnection();

			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			
			//요값은 무조건있어야지요~
			where = "WHERE menu_seq = ? " ;
			params.add(data.get("menu_seq"));
			
			if("golflink_name".equals(field) && keyword.length()>0){
				where += "AND golflink_name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_day".equals(field) && keyword.length()>0){
				where += "AND reserve_day LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_name".equals(field) && keyword.length()>0){
				where += "AND reserve_name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("product_price".equals(field) && keyword.length()>0){
				where += "AND product_price LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("process_status".equals(field) && keyword.length()>0){
				where += "AND process_status LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			
			map = (Map<String, Long>)qr.query(conn, MessageFormat.format(ORDER.totalcnt, tableName , where) , rsh , params.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return NumberUtils.toInt(map.get("cnt")+"");
	}
	
	public void setStatusUpdate(String tableName, Map<String,String> data){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();

			String reserve_seq = StringUtils.defaultIfEmpty(data.get("reserve_seq"), "");
			String booking_day = StringUtils.defaultIfEmpty(data.get("booking_day"), "");
			String booking_time = StringUtils.defaultIfEmpty(data.get("booking_time"), "");
			String product_price = StringUtils.defaultIfEmpty(data.get("product_price"), "");
			String process_status = StringUtils.defaultIfEmpty(data.get("process_status"), "");
			
			ArrayList<Object> bind = new ArrayList<Object>();
			
			String setQuery = "";
			if(booking_day.length() > 0){
				setQuery += ",booking_day = ? " ;
				bind.add(booking_day);
			}else if(booking_time.length() > 0){
				setQuery += ",booking_time = ? " ;
				bind.add(booking_time);
			}else if(product_price.length() > 0){
				setQuery += ",product_price = ? " ;
				bind.add(product_price);
			}else if(process_status.length() > 0){
				setQuery += ",process_status = ? " ;
				bind.add(process_status);
			}
			if(setQuery.length() > 0){
				setQuery = setQuery.substring(1);
			}
			
			bind.add(reserve_seq);
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, MessageFormat.format(ORDER.update, tableName, setQuery), bind.toArray());
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}
	}
}
