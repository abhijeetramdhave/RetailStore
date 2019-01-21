Retail Store
------------

Domain model only for a checkout counter in an online retail store that scans products and generates an itemized bill. 
The bill shows total cost of all the products and the applicable sales tax for each product. 
The total cost and total sales tax is printed on the bill. 
Sales tax varies based on the type of products  
- Category A products carry a levy of 10%  
- Category B products carry a levy of 20%  
- Category C products carry no levy


Technology
----------

Platform: grails 2.3.7
Language: groovy 2.4.3
Database: mysql 5.7.24
Java: JDK 1.7.0_80

Details
-------

There could be one or more taxes levied on product categories with different percentages like CGST, SGST. Hence the model creates time bound Tax master, TaxCategory and associates them together with percent value. All products are categorized into TaxCategories.

The TaxLevied is computed per bill item based on what Taxes apply with what percentages.

