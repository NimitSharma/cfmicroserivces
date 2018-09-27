component displayname="Order" hint="This is a order model"{
	
	property name="orderId" type = "numeric" displayname ="orderId" hint="Unique identifier for a order";
	property name="customerId" type="string"   displayname="customerId" hint="Customer who created the order";
	property name="orderStatus" type="string" displayname="orderSatus" hint="Satus of order";
	property name="orderProducts" type= "struct" displayname="orderProducts" hint="Products and their quantity in the order";
	property name="orderDate" type="date" displayname="orderDate" hint="Date when the order is placed";
	property name="orderAmount" type="numeric" displayname="orderAmount" hint="Total value of order";                                  
}