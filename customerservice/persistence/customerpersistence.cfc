component hint="This is persistence implementation to persist/retrieve customer information from database" 
{	
	
	public customerservice.model.customer function saveCustomer(custFirstName, custLastName, custPassword,
																custEmailId, custMobile, custAddress, custUsername) 
	{
		queryexecute("insert into customer_table (customer_first_name, customer_last_name, customer_password,
		 customer_emailid, customer_mobile, customer_address, customer_created_at, customer_updated_at,
		 customer_username) values(?,?,?,?,?,?,?,?,?)",
			[custFirstName, custLastName, custPassword,custEmailId, custMobile, custAddress, now(), now(), custUsername],{result="result"});
		
		customer = createObject("component", "customerservice.model.customer");
		customer.customer_first_name = custFirstName;
		customer.customer_last_name = custLastName;
		customer.customer_password = custPassword;
		customer.customer_emailid = custEmailId;
		customer.customer_mobile = custMobile;
		customer.customer_address = custAddress;
		customer.customer_created_at = result.customer_created_at;
		customer.customer_updated_at = result.customer_updated_at;
		customer.customer_username = custUsername;
		customer.customer_id = result.generatedkey;
		
		return customer;
	}
	
	public customerservice.model.customer[] function getCustomers() 
	{
		queryResultObj = queryexecute("select * from customer_table");
		var customerList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			customer = createObject("component", "customerservice.model.customer" );
			
			customer.customer_id = queryResultObj.customer_id;
			customer.customer_first_name = queryResultObj.customer_first_name;
			customer.customer_last_name = queryResultObj.customer_last_name;
			customer.customer_password = queryResultObj.customer_password;
			customer.customer_emailid = queryResultObj.customer_emailid;
			customer.customer_mobile = queryResultObj.customer_mobile;
			customer.customer_address = queryResultObj.customer_address;
			customer.customer_created_at = queryResultObj.customer_created_at;
			customer.customer_updated_at = queryResultObj.customer_updated_at;
			customer.customer_username = queryResultObj.customer_username;
						
			arrayAppend(customerList,customer);
		}
	
		return customerList;
	} 
	
	public customerservice.model.customer function getCustomerById(customerIdArg) 
	{
		
		qparams = {customerid={value=customerIdArg , cfsqltype ='cf_sql_integer'}};
		queryResultObj = queryexecute("select * from customer_table where customer_id=:customerid",qparams);

		customer = createObject("component", "customerservice.model.customer" );

		customer.customer_id = queryResultObj.customer_id;
		customer.customer_first_name = queryResultObj.customer_first_name;
		customer.customer_last_name = queryResultObj.customer_last_name;
		customer.customer_password = queryResultObj.customer_password;
		customer.customer_emailid = queryResultObj.customer_emailid;
		customer.customer_mobile = queryResultObj.customer_mobile;
		customer.customer_address = queryResultObj.customer_address;
		customer.customer_created_at = queryResultObj.customer_created_at;
		customer.customer_updated_at = queryResultObj.customer_updated_at;
		customer.customer_username = queryResultObj.customer_username;

		if(queryResultObj.recordcount < 1 )
		{
			throw("Customer not found","404", "customer with customer id " & customerIdArg & " not found.", "404");
		}
		
		return customer;
	}  
	
	public boolean function updateProductDetails(productStruct) 
	{
			writeDump(productStruct);
			product_id = productStruct["product_id"];
	
			if(checkIfProductEntryExist(product_id))
			{
				product_name = productStruct["product_name"];
				imageArray = productStruct["product_image_links"];
				product_description = productStruct["product_descrition"];
				product_brand_id = productStruct["product_brand_id"];
				product_category_id = productStruct["product_category_id"];
				product_image_links = "";
						
				for(i=1;i<=imageArray.size();i++)
				{
						if(i==1)
						{
							product_image_links = imageArray[i];
						}
						else
						{
							product_image_links = product_image_links & "," & imageArray[i];
						}
				}
				
				return true;
			}
			else
			{
				return false;
			}
		}	
}