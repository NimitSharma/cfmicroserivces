component restpath="customer" rest="true" 
{
	
	remote customerservice.model.customer function addCustomer(string customer_first_name restargname="customer_first_name" restargsource="Form",
										string customer_last_name restargname="customer_last_name" restargsource="Form",
										string customer_password restargname="customer_password" restargsource="Form",
										string customer_emailid restargname="customer_emailid" restargsource="Form",
										string customer_mobile restargname="customer_mobile" restargsource="Form",
										string customer_address restargname="customer_address" restargsource="Form",
										string customer_username restargname="customer_username" restargsource="Form"
									) httpmethod="POST" consumes="application/x-www-form-urlencoded" 
													produces="application/json" description="Add a new customer"
	{
		customerPersistence = createObject("component", "customerservice.persistence.customerpersistence" );
		customer = customerPersistence.saveCustomer(customer_first_name, customer_last_name, customer_password, 
		customer_emailid, customer_mobile, customer_address, customer_username);

		return customer;
	}
		
	remote customerservice.model.customer[] function getCustomers() httpmethod="GET" produces="application/json, application/xml" description="Get list of customer"
	{
		customerPersistence = createObject("component", "customerservice.persistence.customerpersistence" );
		customers = customerPersistence.getCustomers();

		return customers;
	}
	
	remote customerservice.model.customer function getCustomerById(required numeric customerId restargname="customerId" restargsource="path") httpmethod="GET" restpath="{customerId}" produces="application/json, application/xml" description="Retrieve customer details by customer id"
	{
		customerPersistence = createObject("component", "customerservice.persistence.customerpersistence" );
		customer = customerPersistence.getCustomerById(customerId);

		return customer;
	}	
}
