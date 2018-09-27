component hint="This is persistence implementation to persist/retrieve order information from database" output="true"
{
	
	public cfsummit.orderservice.model.order function createOrder(customerId,orderStatus,orderProducts)     
	{
		queryexecute("insert into order_table (order_customer_id, order_status, order_products) values(?,?,?,?)",
		[customerId,orderStatus,orderProducts],{result="result"});	
		orderProductStruct = deserializeJSON(orderProducts);
		order = createObject("component", "cfsummit.orderservice.model.order");
		order.customerId = customerId;
		order.orderStatus = orderStatus;
		order.orderProducts = orderProductStruct;
		order.orderId = result.generatedkey;
		
		return order;
	}
	
	public cfsummit.orderservice.model.order[] function getOrders(customerIdArg)     
	{
		
		qparams = {customerId={value=customerIdArg , cfsqltype ='cf_sql_varchar'}};
		queryResultObj = queryexecute("select * from order_table where order_customer_id=:customerId",qparams);
		var orderList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			order = createObject("component", "cfsummit.orderservice.model.order");
			order.customerId = queryResultObj.order_customer_id;
			order.orderId = queryResultObj.order_id;
			order.orderStatus = queryResultObj.order_status;
			order.orderProducts = queryResultObj.order_products;
			arrayAppend(orderList,order);
		}
	
		return orderList;
	}
	
	public boolean function updateOrder(customerIdArg,orderIdArg,orderStatusArg,orderProductsArg)     
	{
		qparams = {customerId={value=customerIdArg , cfsqltype ='cf_sql_varchar'}, orderId={value=orderIdArg , cfsqltype ='cf_sql_integer'}, 
				 orderStatus={value=orderStatusArg,cfsqltype ='cf_sql_varchar'}, 
				 orderProducts={value=orderProductsArg,cfsqltype ='cf_sql_longvarchar'}};
		queryexecute("update  order_table set order_status=:orderStatus, order_products=:orderProducts where order_id=:orderId AND order_customer_id=:customerId",qparams);
		
		return true;	
	}
	
	public boolean function deleteOrder(orderIdArg,customerIdArg) 
	{
		qparams = {orderId={value=orderIdArg , cfsqltype ='cf_sql_integer'},customerId={value=customerIdArg , cfsqltype ='cf_sql_varchar'}};
		queryexecute("delete from order_table  where order_id=:orderId AND order_customer_id=:customerId",qparams);	
	
		return true;
	}    
}