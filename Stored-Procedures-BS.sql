--Insertion Procedures1 - Inventory

DELIMITER //
CREATE PROCEDURE addingIngredients(IN IngredientName varchar(20),IN Availability int)
BEGIN
	INSERT INTO Inventory(Inventory.IngredientName,Inventory.Availability) VALUES(IngredientName,Availability);
END//
DELIMITER ;

CALL addingIngredients("Potatoes",100);
CALL addingIngredients("Lettuce",500);
CALL addingIngredients("Tomato",200);
CALL addingIngredients("Mayonese",40);
CALL addingIngredients("Chicken Meat",300);
CALL addingIngredients("Beef Meat",50);
CALL addingIngredients("Lamb Meat",50);
CALL addingIngredients("Humus",150);
CALL addingIngredients("Veggies",90);
CALL addingIngredients("Beans",70);
CALL addingIngredients("Fries",100);
CALL addingIngredients("Coke",30);
CALL addingIngredients("Orange Juice",30);

SELECT * FROM Inventory;


-- Insertion Procedure2 - Category

DELIMITER //
CREATE PROCEDURE addingCategory(IN CategoryName varchar(20),IN FoodType varchar(10))
BEGIN
	INSERT INTO Category(Category.CategoryName,Category.FoodType) VALUES(CategoryName,FoodType);
END//
DELIMITER ;


CALL addingCategory("Meat Sand-witches","Non-Veg");
CALL addingCategory("Veg Sand-witches","Veg");
CALL addingCategory("Meat Dinner PLates","Non-Veg");
CALL addingCategory("Veg Dinner PLates","Veg");
CALL addingCategory("Side Orders","Veg");
CALL addingCategory("Beverages","Veg");

SELECT * FROM Category;


-- Insertion Procedure3 - MenuItems

DELIMITER //
CREATE PROCEDURE addingMenuItems(IN ItemName varchar(45),IN  Details varchar(200),IN Rate float,IN Category_CategoryId int)
BEGIN
	INSERT INTO MenuItems(MenuItems.ItemName,MenuItems.Details,MenuItems.Rate,MenuItems.Category_CategoryId) VALUES(ItemName,Details,Rate,Category_CategoryId);
END//
DELIMITER ;


CALL addingMenuItems("Lamb Sand-wich","Sand-wich made with Lamb meat and special ingredients",7.99,1);
CALL addingMenuItems("Beef Sand-wich","Sand-wich made with beef meat and special ingredients",8.99,1);

CALL addingMenuItems("Fresh Veggies Sand-wich","Sand-wich made with Fresh Veggies and special ingredients",7.99,2);
CALL addingMenuItems("Fresh Veggies Sand-wich with Beans","Sand-wich made with Kidney Beans, Veggies and special ingredients",8.99,2);

CALL addingMenuItems("Lamb Dinner Plate","Meal made with lamb meat and special ingredients",7.99,3);
CALL addingMenuItems("Beef Dinner Plate","Meal made with beef meat and special ingredients",8.99,3);

CALL addingMenuItems("Veg Plate","Meal made with Fresh Veggies and special ingredients",7.99,4);
CALL addingMenuItems("Special Veg Plate","Meal made with Kidney Beans, Veggies and special ingredients",8.99,4);

CALL addingMenuItems("Fries","Salted French Fries",4.99,5);
CALL addingMenuItems("Baklawa","Dessert specialty made with love",5.99,5);

CALL addingMenuItems("Coke","Chilled Beverages",2.99,6);
CALL addingMenuItems("Orange Juice","Fresh Orange Juice",2.99,6);


SELECT * FROM MenuItems;


-- Insertion Procedure4 - MenuItems_has_Inventory(Mapping Table)

DELIMITER //
CREATE PROCEDURE ingredientRequirementMap(IN MenuItems_MenuItemsId integer,IN  Inventory_InventoryId integer,IN Requirement integer)
BEGIN
	INSERT INTO MenuItems_has_Inventory(MenuItems_has_Inventory.MenuItems_MenuItemsId,MenuItems_has_Inventory.Inventory_InventoryId,MenuItems_has_Inventory.Requirement) VALUES(MenuItems_MenuItemsId,Inventory_InventoryId,Requirement);
END//
DELIMITER ;
-- Making of lamb sand-witch
CALL ingredientRequirementMap(1,7,2);
CALL ingredientRequirementMap(1,8,2);
CALL ingredientRequirementMap(1,1,1);
CALL ingredientRequirementMap(1,2,2);
CALL ingredientRequirementMap(1,3,1);
CALL ingredientRequirementMap(1,4,1);

-- Making of Beef Sandwitch
CALL ingredientRequirementMap(2,6,2);
CALL ingredientRequirementMap(2,8,2);
CALL ingredientRequirementMap(2,1,1);
CALL ingredientRequirementMap(2,2,2);
CALL ingredientRequirementMap(2,3,1);
CALL ingredientRequirementMap(2,4,1);

-- Making of veg Sandwitch
CALL ingredientRequirementMap(3,9,2);
CALL ingredientRequirementMap(3,8,2);
CALL ingredientRequirementMap(3,1,1);
CALL ingredientRequirementMap(3,2,2);
CALL ingredientRequirementMap(3,3,1);
CALL ingredientRequirementMap(3,4,1);

-- Making of Special Veg Sandwitch
CALL ingredientRequirementMap(4,10,2);
CALL ingredientRequirementMap(4,8,2);
CALL ingredientRequirementMap(4,1,1);
CALL ingredientRequirementMap(4,2,2);
CALL ingredientRequirementMap(4,3,1);
CALL ingredientRequirementMap(4,4,1);

-- Making of Special Fries
CALL ingredientRequirementMap(9,11,1);

--  Making of Coke
CALL ingredientRequirementMap(11,12,1);

--  Making of Orange Juice
CALL ingredientRequirementMap(12,13,1);


SELECT * FROM MenuItems_has_Inventory;



-- Insertion Procedure5 - Combos

DELIMITER //
CREATE PROCEDURE makingCombinations(IN name varchar(30),IN  price float)
BEGIN
	INSERT INTO Combo(Combo.ComboName,Combo.ComboPrice) VALUES(name,price);
END//
DELIMITER ;

CALL makingCombinations("Veg Sand-witch Combo",11.99);
CALL makingCombinations("Non-veg Combo",11.99);

SELECT * FROM Combo;



-- Insertion Procedure6 - Combo_has_MenuItems(Mapping Table)

DELIMITER //
CREATE PROCEDURE combinationMapping(IN Combo_ComboId integer,IN  MenuItems_MenuItemsId integer,IN NumberOfCombos integer)
BEGIN
	INSERT INTO Combo_has_MenuItems(Combo_has_MenuItems.Combo_ComboId,Combo_has_MenuItems.MenuItems_MenuItemsId,Combo_has_MenuItems.NumberOfCombos) VALUES(Combo_ComboId,MenuItems_MenuItemsId,NumberOfCombos);
END//
DELIMITER ;

CALL combinationMapping(1,3,1);
CALL combinationMapping(1,9,1);
CALL combinationMapping(1,11,1);
CALL combinationMapping(2,1,1);
CALL combinationMapping(2,9,1);
CALL combinationMapping(2,11,1);

SELECT * FROM Combo_has_MenuItems;



-- Insertion Procedure7 - Worker(Inserting into Person and Worker)

DELIMITER //
CREATE PROCEDURE addingWorker(IN FirstName varchar(45), IN LastName varchar(45), IN PhoneNumber varchar(10), IN AddressLIne1 varchar(45), IN City varchar(45), IN State varchar(45), IN Zipcode int, IN DateOfJoining Date, IN Designation varchar(45),
IN UserId varchar(45),IN Password varchar(45))
BEGIN
		START TRANSACTION;
			INSERT INTO Person(Person.FirstName,Person.LastName,Person.PhoneNumber,Person.AddressLIne1,Person.City,Person.State,Person.Zipcode) values(FirstName,LastName,PhoneNumber,AddressLIne1,City,State,Zipcode);
			SELECT @personID := LAST_INSERT_ID();
			INSERT INTO Worker(Worker.Person_PersonId,Worker.DateOfJoining,Worker.Designation,Worker.UserId,Worker.Password) values(@personID,DateOfJoining,Designation,UserId,SHA2(Password,256));
		COMMIT;
END//
DELIMITER ;

CALL addingWorker("Shawn", "Gonsalves", "4044256314","26A Saint Alphonsus", "Boston", "Mas", 02120, "2014-09-19", "Manager", "cas_gonsalves", "123456789");
CALL addingWorker("Sam", "Lopez", "3948203948","12 Heath street", "Boston", "Mas", 02310, "2014-10-21", "CheckoutPerson", "shaw_lopez", "3214356789");
CALL addingWorker("Terry", "Maz", "3927492037","13 Symphony street", "Boston", "Mas", 09462, "2015-05-25", "Cleaning Person", "maz_terry", "639jfgw9274");

SELECT * FROM Person;
SELECT * FROM Worker;



-- Insertion Procedure8 - Customer (Person/Customer)

DELIMITER //
CREATE PROCEDURE addingCustomer(IN FirstName varchar(45), IN LastName varchar(45), IN PhoneNumber varchar(10),
 IN AddressLIne1 varchar(45), IN City varchar(45), IN State varchar(45), IN Zipcode int, IN ModeOfPayment varchar(45))
BEGIN
		START TRANSACTION;
			INSERT INTO Person(Person.FirstName,Person.LastName,Person.PhoneNumber,Person.AddressLIne1,Person.City,Person.State,Person.Zipcode) values(FirstName,LastName,PhoneNumber,AddressLIne1,City,State,Zipcode);
			SELECT @personID := LAST_INSERT_ID();
			INSERT INTO Customer(Customer.Person_PersonId, Customer.ModeOfPayment) values(@personID,ModeOfPayment);
		COMMIT;
END//
DELIMITER ;

CALL addingCustomer("Mendis", "Mac", "4044256314","26A acs cas", "Boston", "Mas", 02120, "Cash");
CALL addingCustomer("Sam", "How", "3948203948","12 cas street", "Boston", "Mas", 02310, "Card");
CALL addingCustomer("Lin", "Pou", "3927492037","13 vv street", "Boston", "Mas", 09462, "Cash");

SELECT * FROM Person;
SELECT * FROM Customer;


-- Insertion Procedure9 - Payroll

DELIMITER //
CREATE PROCEDURE payrollEntry(IN HoursWorked FLOAT,IN  Employee_Person_PersonId int,IN  Year varchar(4),IN  Month varchar(4))
BEGIN
	INSERT INTO Payroll(Payroll.HoursWorked,Payroll.Employee_Person_PersonId,Payroll.Year,Payroll.Month) VALUES(HoursWorked,Employee_Person_PersonId,Year,Month);
END//
DELIMITER ;

CALL payrollEntry(40.0,1,2018,8);
CALL payrollEntry(35.0,1,2018,9);
CALL payrollEntry(42.0,1,2018,10);

CALL payrollEntry(80.0,2,2018,8);
CALL payrollEntry(90.0,2,2018,9);
CALL payrollEntry(75.0,2,2018,10);

CALL payrollEntry(750.0,3,2018,8);
CALL payrollEntry(60.0,3,2018,9);
CALL payrollEntry(100.0,3,2018,10);

SELECT * FROM Payroll;



-- Insertion Procedure10 - Orders

DELIMITER //
CREATE PROCEDURE customerOrder(IN Customer_Person_PersonId int, IN CheckoutPerson int)
BEGIN
	START TRANSACTION;
	INSERT INTO CustomerOrders(CustomerOrders.TIME,CustomerOrders.Customer_Person_PersonId,CustomerOrders.Worker_Person_PersonId)
	VALUES NOW(),Customer_Person_PersonId,Worker.Person_PersonId FROM Worker WHERE Worker.Person_PersonId=2;
	COMMIT;
END//
DELIMITER ;


CALL customerOrder(4,2);
CALL customerOrder(4,1);
CALL customerOrder(4,3);
CALL customerOrder(4,2);
CALL customerOrder(4,2);

SELECT * FROM CustomerOrders;


-- Insertion Procedure11 - COmboOrder(Mapping table)

DELIMITER //
CREATE PROCEDURE comboOrder(IN CustomerOrders_CustomerOrdersId integer,IN  Combo_ComboId integer)
BEGIN
	INSERT INTO CustomerOrders_has_Combo(CustomerOrders_has_Combo.CustomerOrders_CustomerOrdersId,CustomerOrders_has_Combo.Combo_ComboId) VALUES(CustomerOrders_CustomerOrdersId,Combo_ComboId);
END//
DELIMITER ;

CALL comboOrder(1,2);
CALL comboOrder(2,1);
CALL comboOrder(3,1);
CALL comboOrder(4,2);

SELECT * FROM CustomerOrders_has_Combo;



-- Insertion Procedure12 - menuitem customerOrder(Mapping Table)

DELIMITER //
CREATE PROCEDURE custOrders(IN MenuItems_MenuItemsId integer,IN  CustomerOrders_CustomerOrdersId integer)
BEGIN
	INSERT INTO MenuItems_has_CustomerOrders(MenuItems_has_CustomerOrders.MenuItems_MenuItemsId,MenuItems_has_CustomerOrders.CustomerOrders_CustomerOrdersId) VALUES(MenuItems_MenuItemsId,CustomerOrders_CustomerOrdersId);
END//
DELIMITER ;

CALL custOrders(3,2);
CALL custOrders(4,3);


SELECT * FROM MenuItems_has_CustomerOrders;

--------------------------------------------------
-- Joins/Views

-- Generating Salary
DROP VIEW IF EXISTS `mydb`.`SalaryManagers` ;
CREATE VIEW SalaryManagers AS (SELECT Person_PersonId as EmployeeId, Designation,Year, Month, HoursWorked, HoursWorked*100 as TotalSalary
FROM Worker
Inner JOIN Payroll on Worker.Person_PersonId = Payroll.Employee_Person_PersonId
Inner Join Person on Worker.Person_PersonId=Person.PersonId  
WHERE Worker.Designation='Manager')
UNION ALL
(SELECT Person_PersonId as EmployeeId, Designation,Year, Month, HoursWorked, HoursWorked*100 as TotalSalary
FROM Worker
Inner JOIN Payroll on Worker.Person_PersonId = Payroll.Employee_Person_PersonId
Inner Join Person on Worker.Person_PersonId=Person.PersonId  
WHERE Worker.Designation='CheckoutPerson')
UNION ALL
(SELECT Person_PersonId as EmployeeId, Designation,Year, Month, HoursWorked, HoursWorked*100 as TotalSalary
FROM Worker
Inner JOIN Payroll on Worker.Person_PersonId = Payroll.Employee_Person_PersonId
Inner Join Person on Worker.Person_PersonId=Person.PersonId  
WHERE Worker.Designation='Cleaning Person');

SELECT * from SalaryManagers;

--- Displaying Customers

CREATE VIEW ViewCustomers AS SELECT Person.PersonId, Person.FirstName, Person.LastName,Customer.ModeOfPayment, Person.PhoneNumber 
FROM Person Inner Join Customer on Person.PersonId=Customer.Person_PersonId;


SELECT * from ViewCustomers;

