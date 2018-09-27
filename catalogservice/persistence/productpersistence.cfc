component hint="This is persistence implementation to persist/retrieve product information from database" 
{	
	
	public cfsummit.catalogservice.model.product function saveProduct(prdName,prdDescription,prdImageLinks) 
	{
		
		queryexecute("insert into product_table (product_name,product_description,product_image_links) values(?,?,?)",
			[prdName,prdDescription,prdImageLinks],{result="result"});
		linkArray = prdImageLinks.split(",");
		product = createObject("component", "cfsummit.catalogservice.model.product");
		product.product_name = prdName;
		product.product_description = prdDescription;
		product.product_image_links = linkArray;
		product.product_id = result.generatedkey;
		
		return product;
	}
		
	public cfsummit.catalogservice.model.product[] function getProducts() 
	{
		queryResultObj = queryexecute("select * from product_table");
		var productList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			product = createObject("component", "cfsummit.catalogservice.model.product" );
			product.product_name = queryResultObj.product_name;
			product.product_description = queryResultObj.product_description;
			image_links = queryResultObj.product_image_links;
			linkArray = image_links.split(",");
			product.product_image_links = linkArray;
			product.product_id = queryResultObj.product_id;
			arrayAppend(productList,product);
		}
	
		return productList;
	} 
	

	public cfsummit.catalogservice.model.product function getProductById(productIdArg) 
	{
		
		qparams = {productid={value=productIdArg , cfsqltype ='cf_sql_integer'}};
		queryResultObj = queryexecute("select * from product_table where product_id=:productid",qparams);

		product = createObject("component", "cfsummit.catalogservice.model.product" );
		product.product_name = queryResultObj.product_name;
		product.product_description = queryResultObj.product_description;
		image_links = queryResultObj.product_image_links;
		linkArray = image_links.split(",");
		product.product_image_links = linkArray;
		product.product_id = queryResultObj.product_id;

		if(queryResultObj.recordcount < 1 )
		{
			throw("Product not found","404", "product with product id "&productIdArg&" not found.", "404");
		}
		
		return product;
	}  
		
	public void function deleteProductById(productIdArg) 
	{
		
		qparams = {productid={value=productIdArg , cfsqltype ='cf_sql_integer'}};
		
		try
		{
			queryResultObj = queryexecute("delete from product_table where product_id=:productid",qparams);
		}
		catch(Any ex)
		{
			throw("Product not found","404", "product with product id " & productIdArg & " not found.", "404");
		}
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
	    
	private boolean function checkIfProductEntryExist(productIDArg)   
	{
		    qparams = {productid={value=productIDArg , cfsqltype ='cf_sql_integer'}};
			queryResultObj = queryexecute("select * from product_table where product_id=:productid",qparams);

			if(queryResultObj.recordcount < 1 )
			{
				throw("Product not found","404", "product with id "&productIDArg&" not found.", "404");
			}
			
			return queryResultObj.RecordCount > 0;
	}  
}