/**
 * 
 */
package com.goodjob.board;

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
import com.goodjob.sql.BBS;

/**
 * @author Administrator
 * 
 */
public class BoardDao {

	public List<BoardDto> getList(String tableName , Map<String,String> data) {

		List<BoardDto> list = null;
		Connection conn = null;
		
		String field = StringUtils.defaultIfEmpty(data.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
		int npage = NumberUtils.toInt(data.get("npage"), 1);
		int per_page = NumberUtils.toInt(data.get("per_page"), BBS.per_page);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			
			ResultSetHandler rsh = new BeanListHandler(BoardDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if("name".equals(field) && keyword.length()>0){
				where = "WHERE name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("subject".equals(field) && keyword.length()>0){
				where = "WHERE subject LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("content".equals(field) && keyword.length()>0){
				where = "WHERE content LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			
			//페이징
			params.add(((npage-1)* per_page));
			params.add(per_page);
			
			list = (List<BoardDto>) qr.query(conn , MessageFormat.format(BBS.list, tableName, where), rsh , params.toArray());
			
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
			if("name".equals(field) && keyword.length()>0){
				where = "WHERE name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("subject".equals(field) && keyword.length()>0){
				where = "WHERE subject LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("content".equals(field) && keyword.length()>0){
				where = "WHERE content LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			
			map = (Map<String, Long>)qr.query(conn, MessageFormat.format(BBS.totalcnt, tableName , where) , rsh , params.toArray());

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return NumberUtils.toInt(map.get("cnt")+"");
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
			
			if(seq > 0 ){
				ArrayList<Integer> params = new ArrayList<Integer>();
				params.add(seq);
				
				conn = DBManager.getConnection();
				ResultSetHandler rsh = new BeanHandler(BoardDto.class);
				QueryRunner qr = new QueryRunner();
				dto = (BoardDto) qr.query(conn, String.format(BBS.view,tableName) , rsh , params.toArray());
			}
			else{
				dto = new BoardDto();
			}
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
			
			int result = qr.update(conn, String.format(BBS.readcount,tableName) , seq);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public Long getMaxSeq(String tableName){
		
		BoardDto dto = null;
		Connection conn = null;
		Map<String,Long> map = null;
		try {
			
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			map = (Map) qr.query(conn, String.format(BBS.max,tableName) , rsh);

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
			queryRunner.update(conn, String.format(BBS.update,tableName) , params.toArray());

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
			
			Long seq = this.getMaxSeq(tableName);
			
			ArrayList<Object> params = new ArrayList<Object>();
			params.add(seq);
			params.add(dto.getMem_id());
			params.add(dto.getName());
			params.add(dto.getEmail());
			params.add(dto.getSubject());
			params.add(dto.getContent());
			params.add(dto.getPassword());
			params.add(dto.getFilename());
			params.add("A");			//position
			params.add(seq);
			params.add(dto.getIshtml());
			params.add(dto.getWriteip());
			params.add(dto.getNotice());

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, String.format(BBS.insert,tableName) , params.toArray());

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
	public boolean setDelete(String tableName , int seq){
		
		boolean isDel = false;
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, String.format(BBS.delete,tableName) , seq);
			
			isDel = true;
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return isDel;
	}
	
	public String Position(String pos, String org_pos)
    {
        if(org_pos == null || "".equals(org_pos))
            org_pos = "A";
        int n = pos.length();
        int m = org_pos.length();
        if(n == m)
        {
            pos = (new StringBuilder(String.valueOf(pos))).append("A").toString();
        } else
        {
            char t_pos = pos.charAt(n - 1);
            int ascii = t_pos + 1;
            t_pos = (char)ascii;
            pos = (new StringBuilder(String.valueOf(pos))).append(t_pos).toString();
        }
        return pos;
    }
	
	public List<JoinBoardDto> getJoinList(Map<String,String> data) {
		
		List<JoinBoardDto> list = null;
		Connection conn = null;
		
		String region = StringUtils.trimToEmpty(data.get("region"));
		String sex = StringUtils.trimToEmpty(data.get("sex"));
		String age = StringUtils.trimToEmpty(data.get("age"));
		String join_no = StringUtils.trimToEmpty(data.get("join_no"));
		String keyword = StringUtils.trimToEmpty(data.get("keyword"));
		
		int npage = NumberUtils.toInt(data.get("npage"), 1);
		int per_page = NumberUtils.toInt(data.get("per_page"), BBS.per_page);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			
			ResultSetHandler rsh = new BeanListHandler(JoinBoardDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			StringBuilder where = new StringBuilder();
			if(keyword.length()>0){
				where.append("and content LIKE concat('%',?,'%') ");
				params.add(keyword);
			}
			if(region.length()>0){
				where.append("and region = ? ");
				params.add(region);
			}
			if(sex.length()>0){
				where.append("and sex = ? ");
				params.add(sex);
			}
			if(age.length()>0){
				where.append("and age = ? ");
				params.add(age);
			}
			if(join_no.length()>0){
				where.append("and join_no < ? ");
				params.add(join_no);
			}
			
			//페이징
			params.add(((npage-1)* per_page));
			params.add(per_page);
			
			list = (List<JoinBoardDto>) qr.query(conn , MessageFormat.format(BBS.join_list,where.toString()), rsh , params.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public int getJoinTotalCount(Map<String,String> data){
		
		Connection conn = null;
		Map<String, Long> map = null;
		try {
			
			String field = StringUtils.defaultIfEmpty(data.get("field"), "");
			String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
			
			ArrayList<Object> params = new ArrayList<Object>();
			
			conn = DBManager.getConnection();

			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if("name".equals(field) && keyword.length()>0){
				where = "WHERE name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("subject".equals(field) && keyword.length()>0){
				where = "WHERE subject LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("content".equals(field) && keyword.length()>0){
				where = "WHERE content LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			
			map = (Map<String, Long>)qr.query(conn, String.format(BBS.join_totalcnt, where) , rsh , params.toArray());

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return NumberUtils.toInt(map.get("cnt")+"");
	}
	
	public JoinBoardDto getJoinView(int join_no){
		
		JoinBoardDto jDto = new JoinBoardDto();
		Connection conn = null;
		try {
			
			if(join_no > 0 ){
				
				Object[] params = {join_no};
				
				conn = DBManager.getConnection();
				ResultSetHandler rsh = new BeanHandler(JoinBoardDto.class);
				QueryRunner qr = new QueryRunner();
				jDto = (JoinBoardDto) qr.query(conn, BBS.join_view , rsh , params);
			}
			else{
				jDto = new JoinBoardDto();
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return jDto;
	}
	
	public void setJoinReadcount(int join_no){
		Connection conn = null;
		try {
			conn = DBManager.getConnection();
			ResultSetHandler rsh = new BeanHandler(BoardDto.class);
			QueryRunner qr = new QueryRunner();
			
			int result = qr.update(conn, BBS.join_readcount , join_no);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public void setJoinUpdate(JoinBoardDto jDto){
		
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			params.add(jDto.getJoin_name());
			params.add(jDto.getTel1());
			params.add(jDto.getTel2());
			params.add(jDto.getTel3());
			params.add(jDto.getRegion());
			params.add(jDto.getGolflink_name());
			params.add(jDto.getSex());
			params.add(jDto.getAge());
			params.add(jDto.getJoin_person());
			params.add(jDto.getRounding_dt());
			params.add(jDto.getPrice_info1());
			params.add(jDto.getPrice_info2());
			params.add(jDto.getPrice_info3());
			params.add(jDto.getContent());
			params.add(jDto.getJoin_no());

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, BBS.join_update , params.toArray());

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public void setJoinInsert(JoinBoardDto jDto){
		
		Connection conn = null;
		try {

			conn = DBManager.getConnection();
			
			ArrayList<Object> params = new ArrayList<Object>();
			params.add(jDto.getJoin_name());
			params.add(jDto.getTel1());
			params.add(jDto.getTel2());
			params.add(jDto.getTel3());
			params.add(jDto.getRegion());
			params.add(jDto.getGolflink_name());
			params.add(jDto.getSex());
			params.add(jDto.getAge());
			params.add(jDto.getJoin_person());
			params.add(jDto.getRounding_dt());
			params.add(jDto.getPrice_info1());
			params.add(jDto.getPrice_info2());
			params.add(jDto.getPrice_info3());
			params.add(jDto.getContent());
			
			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, BBS.join_insert , params.toArray());

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
	}
	
	public boolean setJoinStatus(int join_no){
		
		boolean isUpdate = false;
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, BBS.join_status , join_no);
			
			isUpdate = true;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return isUpdate;
	}
	
	/**
	 * 조인 글 삭제
	 * @param join_no
	 * @return
	 */
	public boolean setJoinDelete(int join_no){
		
		boolean isDel = false;
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			QueryRunner queryRunner = new QueryRunner();
			
			queryRunner.update(conn, BBS.join_delete , join_no);
			queryRunner.update(conn, BBS.join_cdelete , join_no);
			
			isDel = true;
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return isDel;
	}
	
	/**
	 * 조인 게시판 코멘트 리스트
	 * @param join_no
	 * @return
	 */
	public List<JoinBoardDto> getJoinCommentList(int join_no) {
		
		Connection conn = null;
		List<JoinBoardDto> list = null;
		try {
			
			Object[] params = {join_no};
			
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new BeanListHandler(JoinBoardDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<JoinBoardDto>) qr.query(conn , BBS.join_clist, rsh , params);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	/**
	 * 댓글 저장
	 * @param jDto
	 */
	public void setCommentInsert(JoinBoardDto jDto){
		
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			params.add(jDto.getJoin_no());
			params.add(jDto.getCmt_name());
			params.add(jDto.getComment());
			
			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, BBS.join_cinsert , params.toArray());
			
			queryRunner.update(conn, BBS.join_apply , jDto.getJoin_no());
			

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 댓글 삭제
	 * @param cmt_no
	 * @return
	 */
	public boolean setCommentDelete(int cmt_no){
		
		boolean isDel = false;
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, BBS.join_cdelete , cmt_no);
			
			isDel = true;
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return isDel;
	}
}
