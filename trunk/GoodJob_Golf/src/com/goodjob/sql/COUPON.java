package com.goodjob.sql;

public class COUPON {
	public static final String chkCouponReg
	=	"SELECT " +
			" coupon_seq " +
			",coupon_name " +
			",coupon_type " +
			",coupon_code " +
			",sale_price " +
			",expiredate_start " +
			",expiredate_end " +
			",reg_user " +
			",reg_date " +
			",use_date " +
		"FROM tb_coupon " +
		"WHERE coupon_code = ?";
	
	public static final String coupon_update
	=	"UPDATE tb_coupon " +
		"SET " +
			" reg_user = ? " +
			",reg_date = now() " +
		"WHERE coupon_seq = ?";
	
	public static final String listUserCoupon
	=	"SELECT " +
			" coupon_seq " +
			",coupon_name " +
			",coupon_type " +
			",coupon_code " +
			",sale_price " +
			",expiredate_start " +
			",expiredate_end " +
			",reg_user " +
			",reg_date " +
			",use_date " +
		"FROM tb_coupon " +
		"WHERE reg_user = ? {0}";
	
	public static final String coupon_insert = "insert into tb_coupon(coupon_name,coupon_type,coupon_code,sale_price,expiredate_start,expiredate_end,reg_date) "+
	"values( ?, ?, ?, ?, ?, ?,now())";
	
	public static final String coupon_list = "select "+
										"a.coupon_seq, "+
										"a.coupon_name, "+
										"a.coupon_type, "+
										"a.coupon_code, "+
										"a.sale_price, "+
										"a.expiredate_start, "+
										"a.expiredate_end, "+
										"a.reg_user, "+
										"a.reg_date, "+
										"a.use_date , "+
										"b.mem_name "+
										"from tb_coupon a left outer join tb_member b on a.reg_user=b.mem_id "+
										"where a.coupon_type = ? {0} limit ? , ? ";
	
	public static final String coupon_total = "select "+
									"count(*) cnt "+
									"from tb_coupon a left outer join tb_member b on a.reg_user=b.mem_id "+
									"where a.coupon_type = ? {0} ";
}
