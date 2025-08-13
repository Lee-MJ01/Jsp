package dto;

public class OrderDTO {
	
	private int orderNo;
	private String orderId;
	private int orderproduct;
	private int orderCount;
	private String orderRdate;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getOrderproduct() {
		return orderproduct;
	}
	public void setOrderproduct(int orderproduct) {
		this.orderproduct = orderproduct;
	}
	public void setOrderproduct(String orderproduct) {
		if(orderproduct != null) {
			this.orderproduct = Integer.parseInt(orderproduct);
		}
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public void setOrderCount(String orderCount) {
		if(orderCount != null) {
			this.orderCount = Integer.parseInt(orderCount);
		}
	}
	public String getOrderRdate() {
		return orderRdate;
	}
	public void setOrderRdate(String orderRdate) {
		this.orderRdate = orderRdate;
	}
	@Override
	public String toString() {
		return "OrderDTO [orderNo=" + orderNo + ", orderId=" + orderId + ", orderproduct=" + orderproduct
				+ ", orderCount=" + orderCount + ", orderRdate=" + orderRdate + "]";
	}
	
}
