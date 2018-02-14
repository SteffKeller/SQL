use HBU

--3.12.2 XML Datentyp / Funktionen

---c
CREATE XML SCHEMA COLLECTION [dbo].[OrderSchemaCollection] AS N'
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="Root">
    <xs:complexType>
      <xs:sequence>
        <xs:element maxOccurs="unbounded" name="OrderDetail">
          <xs:complexType>
            <xs:attribute name="OrderDetailID" type="xs:unsignedByte" use="required" />
            <xs:attribute name="OrderID" type="xs:unsignedShort" use="required" />
            <xs:attribute name="Quantity" type="xs:unsignedByte" use="required" />
            <xs:attribute name="ProductID" type="xs:unsignedShort" use="required" />
            <xs:attribute name="UnitPrice" type="xs:decimal" use="required" />
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>'
go

create table tblOrders
(
	OrderID int IDENTITY(1,1) not null,
	OrderDate datetime null,
	OrderNumber Nvarchar(25) null,
	CustomerID INT null ,
	OrderDetails xml null
);
Go

create table tblOrdersSchema
(
	OrderID int IDENTITY(1,1) not null,
	OrderDate datetime null,
	OrderNumber Nvarchar(25) null,
	CustomerID INT null ,
	OrderDetails xml([OrderSchemaCollection]) null
);
Go

insert into tblOrdersSchema(OrderDate,OrderNumber,CustomerID,OrderDetails)
values(convert(datetime,'2003-12-02 12:12:12.000'),34,2,
N'<Root>	<OrderDetail OrderDetailID="1" OrderID="43659" Quantity="1" ProductID="776" UnitPrice="2024.9940" /> 
			<OrderDetail OrderDetailID="2" OrderID="43659" Quantity="3" ProductID="777" UnitPrice="2024.9940" /> 
			<OrderDetail OrderDetailID="3" OrderID="43659" Quantity="1" ProductID="778" UnitPrice="2024.9940" />
</Root>')

--Query Path
select  OrderDetails.query('Root/OrderDetail[@ProductID=776]')
from tblOrdersSchema

-- Zugriff mit der query-Methode (XQuery)
select OrderDetails.query(' for $i in /Root/OrderDetail
							where /Root/OrderDetail[@ProductID = 776]
							return $i')
							as OrderDetails
							from tblOrdersSchema

-- Zugriff mit der exist-Methode 
SELECT
OrderDetails
FROM tblOrdersSchema WHERE OrderDetails.exist('/Root/OrderDetail[@ProductID = 778]') = 1
GO


----- A1.6 Listen Sie mit einer SELECT Abfrage die ProductID der ersten Bestellzeile (Root/OrderDetail/@ProductID)[1]). 
--Verwenden Sie hierzu für den Daten Zugriff die value Methode.
select  OrderDetails.value('(Root/OrderDetail/@ProductID)[1]', 'varchar(80)')
from tblOrdersSchema
---drop tables
drop table tblOrders,tblOrdersSchema

--