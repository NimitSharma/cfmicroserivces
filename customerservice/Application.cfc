component
{
	this.name = "customerservice";  
	
    this.restsettings.autoregister = "true";
    this.restsettings.servicemapping = "customerservice";
    
        
    this.datasource="customers";	
	
	//this.MYSQL_IP_ADDRESS = #SERVER.SYSTEM.ENVIRONMENT[MYSQL_IP_ADDRESS]#;
	//this.MYSQL_PORT = #SERVER.SYSTEM.ENVIRONMENT[MYSQL_PORT]#;
	//this.MYSQL_DATABASE = #SERVER.SYSTEM.ENVIRONMENT[MYSQL_DATABASE]#;
	//this.MYSQL_USERNAME = #SERVER.SYSTEM.ENVIRONMENT[MYSQL_USERNAME]#;
	//this.MYSQL_PASSWORD = #SERVER.SYSTEM.ENVIRONMENT[MYSQL_PASSWORD]#;
	
	this.MYSQL_IP_ADDRESS = "mydb";
	this.MYSQL_PORT = "3306";
	this.MYSQL_DATABASE = "customers";
	this.MYSQL_USERNAME = "root";
	this.MYSQL_PASSWORD = "P@$$w0rd";

	
	this.datasources.customers = {"driver"="MySQL5",
	url="jdbc:mysql://" & this.MYSQL_IP_ADDRESS & ":" & this.MYSQL_PORT & "/" & this.MYSQL_DATABASE & "?sendStringParametersAsUnicode=false&amp;querytimeout=0&amp;MaxPooledStatements=1000",
	"username"= this.MYSQL_USERNAME, "password"= this.MYSQL_PASSWORD};
}
