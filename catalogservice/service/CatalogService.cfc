component restpath="catalog" rest="true" 
{
	
	cfsummit.catalogservice.model.product function addProduct(cfsummit.catalogservice.model.product prod) httpmethod="POST" consumes="application/json" 
													produces="application/json" description="Add a new product"
	{
		productPersistence = createObject("component", "cfsummit.catalogservice.persistence.productpersistence" );
		
		product_image_links = ArrayToList(prod.product_image_links);
		product = productPersistence.saveProduct(prod.product_name, prod.product_description, product_image_links);

		return product;
	}
	
	cfsummit.catalogservice.model.product[] function getProducts() httpmethod="GET" produces="application/json, application/xml" description="Get list of products"
	{
		productPersistence = createObject("component", "cfsummit.catalogservice.persistence.productpersistence" );
		products = productPersistence.getProducts();

		return products;
	}
	
	cfsummit.catalogservice.model.product function getProductById(required numeric productId restargname="productId" restargsource="path") httpmethod="GET" restpath="{productId}" produces="application/json, application/xml" description="Retrieve product details by product id"
	{
		productPersistence = createObject("component", "cfsummit.catalogservice.persistence.productpersistence" );
		product = productPersistence.getProductById(productId);

		return product;	
	}
	
	void function deleteProductById(required numeric productId restargname="productId" restargsource="path") httpmethod="DELETE" restpath="{productId}" description="Delete product details by product id"
	{
		productPersistence = createObject("component", "cfsummit.catalogservice.persistence.productpersistence" );
		product = productPersistence.deleteProductById(productId);

		return product;	
	}
}