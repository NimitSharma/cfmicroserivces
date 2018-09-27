component rest="true" restpath="order"
{
	remote orderservice.model.order[] function getOrders(required string customerId restargname="customerId" restargsource="Path") produces="application/json" httpmethod="GET" restpath="{customerId}" description="API to retrieve the list order for a customer"
	{
		orderPersistence = createObject("component", "orderservice.persistence.orderpersistence");
		ordres = orderPersistence.getOrders(customerId);

		return ordres;	
	}	
	
	remote boolean function deleteOrder(required string customerId restargname="customerId" restargsource="Path",
					required numeric orderId restargname="orderId" restargsource="Path") httpmethod="DELETE" restpath="{customerId}/{orderId}" description="Delete the order"
	{
		orderPersistence = createObject("component", "orderservice.persistence.orderpersistence");
		orderresponse = orderPersistence.deleteOrder(orderId,customerId);

		return orderresponse;
	}
	
	remote orderservice.model.order function placeOrder(required string customerId restargname="customerId" restargsource="Form",
						required string orderStatus restargname="orderStatus" restargsource="Form",
						required string orderProducts restargname="orderProducts" restargsource="Form"
						) consumes="application/x-www-form-urlencoded" produces="application/json" httpmethod="POST" description="API to place order"
	{
		orderPersistence = createObject("component", "orderservice.persistence.orderpersistence");
		order = orderPersistence.createOrder(customerId,orderStatus,orderProducts);

		return order;
	}
	
	remote boolean function updateOrder(required string orderId restargsource="path" restargname="orderId",
					required string orderStatus restargsource="Form" restargname="orderStatus",
					required string orderProducts restargsource="Form" restargname="orderProducts") restpath="{orderId}" consumes="application/x-www-form-urlencoded" httpmethod="PUT" description="Update an existing order"
	{

		orderPersistence = createObject("component", "orderservice.persistence.orderpersistence");
		orderResponse = orderPersistence.updateOrder(1,orderId,orderStatus,orderProducts);

		return orderResponse;
	}
}