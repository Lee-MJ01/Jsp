package util;

public class Sql {
	
	// 로그인
	public final static String SELECT_CUSTOMER_BY_NO_AND_NAME = "select * from bank_customer where c_no = ? and c_name = ?";
	
	public final static String INSERT_TRANSCATION = "insert into bank_transaction(t_a_no, t__dist, t_amount,t_datetime) values(?,?,?,sysdate)";
	
	
	public final static String SELECT_CUSTOMER_WITH_ACCOUNT_NO = "select c.*, a.a_no "
																+ "from bank_customer c "
																+ "join bank_account a on a.a_c_no = c.c_no "
																+ "where c_no = ?";
	
	// 계좌 * 검색
	public final static String SELECT_ALL_ACCOUNT_WITH_NAME = "select a.*, c.c_name "
															+ "from bank_account a "
															+ "join bank_customer c on a.a_c_no = c.c_no";
	
	public final static String UPDATE_ACCOUNT_PLUS = "update bank_account set a_balance = a_balance + ? where a_no = ?";
	public final static String UPDATE_ACCOUNT_MINUS = "update bank_account set a_balance = a_balance - ? where a_no = ?";
	
	
	// 계좌 단일 검색
	
	
	// 고객 * 검색
	
	
	// 고객 단일 검색
		
		 
	
	
}
