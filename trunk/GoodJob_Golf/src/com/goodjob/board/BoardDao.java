/**
 * 
 */
package com.goodjob.board;

import java.sql.Connection;
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
import com.goodjob.sql.BBS;

/**
 * @author Administrator
 * 
 */
public class BoardDao {

	public List<BoardDto> getList(Map<String,String> data) {

		List<BoardDto> list = null;
		Connection conn = null;
		
		String field = StringUtils.defaultIfEmpty(data.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
		int npage = NumberUtils.toInt(data.get("npage"), 1);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			
			ResultSetHandler rsh = new BeanListHandler(BoardDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if("name".equals(field)){
				where = "WHERE name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("subject".equals(field)){
				where = "WHERE subject LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("content".equals(field)){
				where = "WHERE content LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			
			//페이징
			params.add(((npage-1)* BBS.per_page));
			params.add((npage*BBS.per_page));
			
			list = (List<BoardDto>) qr.query(conn , String.format(BBS.list, where), rsh , params.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;

	}

	/**
	 * 글 총수
	 * @param tableName
	 * @param field
	 * @param keyword
	 * @return
	 */
	public int getTotalCount(Map<String,String> data) {
		Connection conn = null;
		Map<String, Integer> map = null;
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
			if("name".equals(field)){
				where = "WHERE name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("subject".equals(field)){
				where = "WHERE subject LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("content".equals(field)){
				where = "WHERE content LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			
			map = (Map) qr.query(conn, String.format(BBS.totalcnt, where) , rsh , params.toArray());

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return map.get("cnt");
	}

	/**
	 * 게시판 상세
	 * @param tableName
	 * @param seq
	 * @return
	 */
	public BoardDto getView(String tableName , int seq){
		
		BoardDto dto = null;
		Connection conn = null;
		try {
			
			ArrayList<Integer> params = new ArrayList<Integer>();
			params.add(seq);
			
			conn = DBManager.getConnection();
			ResultSetHandler rsh = new BeanHandler(BoardDto.class);
			QueryRunner qr = new QueryRunner();
			dto = (BoardDto) qr.query(conn, BBS.totalcnt , rsh , params.toArray());

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return dto;
	}
	
	public void setReadcount(String tableName , int seq){
		BoardDto dto = null;
		Connection conn = null;
		try {
			
			ArrayList<Integer> params = new ArrayList<Integer>();
			params.add(seq);
			
			conn = DBManager.getConnection();
			ResultSetHandler rsh = new BeanHandler(BoardDto.class);
			QueryRunner qr = new QueryRunner();
			
			int result = qr.update(conn, BBS.readcount, seq);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public int getMaxSeq(String tableName){
		
		BoardDto dto = null;
		Connection conn = null;
		Map<String,Integer> map = null;
		try {
			
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			map = (Map) qr.query(conn, BBS.max , rsh);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return map.get("seq");
	}
	
	/**
	 * 업데이트
	 * @param dto
	 */
	public void setUpdate(String tableName , BoardDto dto) {

		Connection conn = null;
		Map<String, Integer> map = null;
		try {

			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			params.add(dto.getName());
			params.add(dto.getEmail());
			params.add(dto.getSubject());
			params.add(dto.getContent());
			params.add(dto.getIshtml());
			params.add(dto.getSeq());

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, BBS.update, params);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}

	/**
	 * 글 등록
	 * @param tableName
	 * @param dto
	 */
	public void setInsert(String tableName , BoardDto dto) {
		
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			params.add(dto.getName());
			params.add(dto.getEmail());
			params.add(dto.getSubject());
			params.add(dto.getContent());
			params.add(dto.getIshtml());
			params.add(dto.getSeq());

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, BBS.update, params);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
	}
	
	/**
	 * 글 삭제
	 * @param tableName
	 * @param seq
	 */
	public void setDelete(String tableName , int seq){
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, BBS.delete, seq);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
}
