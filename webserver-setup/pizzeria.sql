
IF OBJECT_ID('User', 'U') IS NOT NULL
    DROP TABLE [User];

IF OBJECT_ID('ItemType', 'U') IS NOT NULL
    DROP TABLE ItemType;

IF OBJECT_ID('Ingredient', 'U') IS NOT NULL
    DROP TABLE Ingredient;

IF OBJECT_ID('Item', 'U') IS NOT NULL
    DROP TABLE Item;

IF OBJECT_ID('Item_Ingredient', 'U') IS NOT NULL
    DROP TABLE Item_Ingredient;

IF OBJECT_ID('Pizza_Order_Item', 'U') IS NOT NULL
    DROP TABLE Pizza_Order_Item;

IF OBJECT_ID('Pizza_Order', 'U') IS NOT NULL
    DROP TABLE Pizza_Order;


-- Create User table
CREATE TABLE [User] (
  [username] NVARCHAR(255) PRIMARY KEY,
  [password] NVARCHAR(255) NOT NULL,
  [first_name] NVARCHAR(255) NOT NULL,
  [last_name] NVARCHAR(255) NOT NULL,
  [role] NVARCHAR(50) NOT NULL
);

-- Create ItemType table
CREATE TABLE [ItemType] (
  [name] NVARCHAR(255) PRIMARY KEY
);

-- Create Ingredient table
CREATE TABLE [Ingredient] (
  [name] NVARCHAR(255) PRIMARY KEY
);

-- Create Item table
CREATE TABLE [Item] (
  [name] NVARCHAR(255) PRIMARY KEY,
  [price] DECIMAL(10,2) NOT NULL,
  [type_id] NVARCHAR(255) NOT NULL
);

-- Create Item_Ingredient table
CREATE TABLE [Item_Ingredient] (
  [item_name] NVARCHAR(255),
  [ingredient_name] NVARCHAR(255),
  PRIMARY KEY ([item_name], [ingredient_name])
);

-- Create Pizza_Order table
CREATE TABLE [Pizza_Order] (
  [order_id] INT PRIMARY KEY IDENTITY(1, 1),
  [client_username] NVARCHAR(255) NOT NULL,
  [personnel_username] NVARCHAR(255) NOT NULL,
  [datetime] DATETIME NOT NULL,
  [address] NVARCHAR(255)
);

-- Create Pizza_Order_Item table
CREATE TABLE [Pizza_Order_Item] (
  [order_id] INT,
  [item_name] NVARCHAR(255),
  [quantity] INT NOT NULL,
  PRIMARY KEY ([order_id], [item_name])
);

-- -- Add foreign key constraints
ALTER TABLE [Item] ADD FOREIGN KEY ([type_id]) REFERENCES [ItemType] ([name]);
ALTER TABLE [Item_Ingredient] ADD FOREIGN KEY ([item_name]) REFERENCES [Item] ([name]);
ALTER TABLE [Item_Ingredient] ADD FOREIGN KEY ([ingredient_name]) REFERENCES [Ingredient] ([name]);
ALTER TABLE [Pizza_Order] ADD FOREIGN KEY ([client_username]) REFERENCES [User] ([username]);
ALTER TABLE [Pizza_Order] ADD FOREIGN KEY ([personnel_username]) REFERENCES [User] ([username]);
ALTER TABLE [Pizza_Order_Item] ADD FOREIGN KEY ([order_id]) REFERENCES [Pizza_Order] ([order_id]);
ALTER TABLE [Pizza_Order_Item] ADD FOREIGN KEY ([item_name]) REFERENCES [Item] ([name]);

-- -- Insert statements for 20 users with realistic names
INSERT INTO [User] (username, [password], first_name, last_name, [role]) VALUES
('jdoe', 'wachtwoord', 'John', 'Doe', 'Client'),
('mvermeer', 'wachtwoord', 'Maria', 'Vermeer', 'Client'),
('rdeboer', 'wachtwoord', 'Rik', 'de Boer', 'Personnel'),
('sbakker', 'wachtwoord', 'Sophie', 'Bakker', 'Personnel'),
('fholwerda', 'wachtwoord', 'Fenna', 'Holwerda', 'Client'),
('kdijkstra', 'wachtwoord', 'Klaas', 'Dijkstra', 'Client'),
('lheineken', 'wachtwoord', 'Lucas', 'Heineken', 'Personnel'),
('mvandam', 'wachtwoord', 'Mila', 'van Dam', 'Personnel'),
('gkoolstra', 'wachtwoord', 'Gert', 'Koolstra', 'Client'),
('evisscher', 'wachtwoord', 'Emma', 'Visscher', 'Client'),
('tjanssen', 'wachtwoord', 'Tom', 'Janssen', 'Personnel'),
('abrouwer', 'wachtwoord', 'Anna', 'Brouwer', 'Personnel'),
('wbos', 'wachtwoord', 'Willem', 'Bos', 'Client'),
('tvandermeer', 'wachtwoord', 'Tessa', 'van der Meer', 'Client'),
('rkramer', 'wachtwoord', 'Rob', 'Kramer', 'Personnel'),
('mnijland', 'wachtwoord', 'Maud', 'Nijland', 'Personnel'),
('dschouten', 'wachtwoord', 'David', 'Schouten', 'Client'),
('hdeleeuw', 'wachtwoord', 'Hanna', 'de Leeuw', 'Client'),
('pvanveen', 'wachtwoord', 'Peter', 'van Veen', 'Personnel'),
('adekhane', 'wachtwoord', 'Ahmed', 'Dekhane', 'Client'), 
('mbouaziz', 'wachtwoord', 'Mouna', 'Bouaziz', 'Client'), 
('tbayrak', 'wachtwoord', 'Tarik', 'Bayrak', 'Personnel'), 
('ayildiz', 'wachtwoord', 'Aylin', 'Yildiz', 'Personnel'), 
('rnarsingh', 'wachtwoord', 'Rajesh', 'Narsingh', 'Client'), 
('sdurga', 'wachtwoord', 'Shanti', 'Durga', 'Client'), 
('mkassem', 'wachtwoord', 'Mohammed', 'Kassem', 'Personnel'), 
('lsaleh', 'wachtwoord', 'Lina', 'Saleh', 'Personnel'), 
('aghebre', 'wachtwoord', 'Amanuel', 'Ghebre', 'Client'), 
('mtsega', 'wachtwoord', 'Miriam', 'Tsega', 'Client'), 
('pkowalski', 'wachtwoord', 'Piotr', 'Kowalski', 'Personnel'), 
('aivanov', 'wachtwoord', 'Alexei', 'Ivanov', 'Personnel'), 
('mkarimi', 'wachtwoord', 'Mina', 'Karimi', 'Client'), 
('hradman', 'wachtwoord', 'Hassan', 'Radman', 'Client'), 
('lbaloyi', 'wachtwoord', 'Lerato', 'Baloyi', 'Personnel'), 
('dpetrov', 'wachtwoord', 'Dmitri', 'Petrov', 'Personnel'), 
('ibrahimovic', 'wachtwoord', 'Ismail', 'Brahimovic', 'Client'), 
('snovak', 'wachtwoord', 'Sanja', 'Novak', 'Client'), 
('yabebe', 'wachtwoord', 'Yonas', 'Abebe', 'Personnel'), 
('ngebre', 'wachtwoord', 'Nardos', 'Gebre', 'Personnel'); 

-- Insert statements for item types
INSERT INTO ItemType ([name]) VALUES
('Pizza'),
('Maaltijd'),
('Specerij'),
('Voorgerecht'),
('Drank');

-- Insert statements for ingredients
INSERT INTO Ingredient ([name]) VALUES
('Tomaat'),
('Kaas'),
('Pepperoni'),
('Champignon'),
('Ui'),
('Sla'),
('Spek'),
('Saus');

-- Insert statements for items
INSERT INTO Item ([name], price, type_id) VALUES
('Margherita Pizza', 9.99, 'Pizza'),
('Pepperoni Pizza', 11.99, 'Pizza'),
('Vegetarische Pizza', 10.99, 'Pizza'),
('Hawaiian Pizza', 12.99, 'Pizza'),
('Combinatiemaaltijd', 15.99, 'Maaltijd'),
('Knoflookbrood', 4.99, 'Voorgerecht'),
('Coca Cola', 2.49, 'Drank'),
('Sprite', 2.49, 'Drank');

-- Insert statements for item-ingredient relationships
INSERT INTO Item_Ingredient (item_name, ingredient_name) VALUES
('Margherita Pizza', 'Tomaat'), -- Margherita Pizza met Tomaat
('Margherita Pizza', 'Kaas'), -- Margherita Pizza met Kaas
('Pepperoni Pizza', 'Tomaat'), -- Pepperoni Pizza met Tomaat
('Pepperoni Pizza', 'Kaas'), -- Pepperoni Pizza met Kaas
('Pepperoni Pizza', 'Pepperoni'), -- Pepperoni Pizza met Pepperoni
('Vegetarische Pizza', 'Tomaat'), -- Vegetarische Pizza met Tomaat
('Vegetarische Pizza', 'Kaas'), -- Vegetarische Pizza met Kaas
('Vegetarische Pizza', 'Champignon'), -- Vegetarische Pizza met Champignon
('Vegetarische Pizza', 'Ui'), -- Vegetarische Pizza met Ui
('Hawaiian Pizza', 'Tomaat'), -- Hawaiian Pizza met Tomaat
('Hawaiian Pizza', 'Kaas'), -- Hawaiian Pizza met Kaas
('Hawaiian Pizza', 'Pepperoni'), -- Hawaiian Pizza met Pepperoni
('Hawaiian Pizza', 'Ui'), -- Hawaiian Pizza met Ui
('Hawaiian Pizza', 'Sla'), -- Hawaiian Pizza met Sla
('Hawaiian Pizza', 'Spek'), -- Hawaiian Pizza met Spek
('Hawaiian Pizza', 'Saus'), -- Hawaiian Pizza met Saus
('Combinatiemaaltijd', 'Tomaat'), -- Combinatiemaaltijd met Tomaat
('Combinatiemaaltijd', 'Kaas'), -- Combinatiemaaltijd met Kaas
('Combinatiemaaltijd', 'Pepperoni'), -- Combinatiemaaltijd met Pepperoni
('Combinatiemaaltijd', 'Champignon'), -- Combinatiemaaltijd met Champignon
('Combinatiemaaltijd', 'Ui'), -- Combinatiemaaltijd met Ui
('Combinatiemaaltijd', 'Sla'), -- Combinatiemaaltijd met Sla
('Combinatiemaaltijd', 'Spek'), -- Combinatiemaaltijd met Spek
('Combinatiemaaltijd', 'Saus'); -- Combinatiemaaltijd met Saus

-- Insert statements for Pizza_Order (dummy data with addresses in Arnhem and Nijmegen)
INSERT INTO Pizza_Order (client_username, personnel_username, datetime, address) VALUES
('jdoe', 'rdeboer', '2024-06-13 12:30:00', 'Koningstraat 1, Arnhem'),
('mvermeer', 'sbakker', '2024-06-13 13:15:00', 'Grote Markt 2, Nijmegen'),
('fholwerda', 'lheineken', '2024-06-13 18:00:00', 'Rijnkade 3, Arnhem'),
('kdijkstra', 'mvandam', '2024-06-14 11:45:00', 'Plein 4, Nijmegen'),
('gkoolstra', 'tjanssen', '2024-06-14 13:30:00', 'Stationsplein 5, Arnhem'),
('evisscher', 'abrouwer', '2024-06-15 17:30:00', 'Hertogstraat 6, Nijmegen'),
('wbos', 'rkramer', '2024-06-15 18:45:00', 'Koningstraat 7, Arnhem'),
('tvandermeer', 'mnijland', '2024-06-16 12:00:00', 'Grote Markt 8, Nijmegen'),
('dschouten', 'pvanveen', '2024-06-16 14:15:00', 'Rijnkade 9, Arnhem'),
('hdeleeuw', 'lsaleh', '2024-06-17 19:00:00', 'Plein 10, Nijmegen'),
('adekhane', 'tbayrak', '2024-06-17 20:30:00', 'Stationsplein 11, Arnhem'),
('mbouaziz', 'ayildiz', '2024-06-18 13:00:00', 'Hertogstraat 12, Nijmegen'),
('tbayrak', 'rnarsingh', '2024-06-18 14:45:00', 'Koningstraat 13, Arnhem'),
('ayildiz', 'sdurga', '2024-06-19 16:30:00', 'Grote Markt 14, Nijmegen'),
('rnarsingh', 'mkassem', '2024-06-19 18:15:00', 'Rijnkade 15, Arnhem'),
('sdurga', 'aghebre', '2024-06-20 12:00:00', 'Plein 16, Nijmegen'),
('mkassem', 'mtsega', '2024-06-20 13:45:00', 'Stationsplein 17, Arnhem'),
('aghebre', 'pkowalski', '2024-06-21 17:30:00', 'Hertogstraat 18, Nijmegen'),
('mtsega', 'aivanov', '2024-06-21 19:15:00', 'Koningstraat 19, Arnhem'),
('pkowalski', 'mkarimi', '2024-06-22 12:30:00', 'Grote Markt 20, Nijmegen'),
('aivanov', 'hradman', '2024-06-22 14:00:00', 'Rijnkade 21, Arnhem'),
('mkarimi', 'lbaloyi', '2024-06-23 18:00:00', 'Plein 22, Nijmegen'),
('hradman', 'dpetrov', '2024-06-23 19:45:00', 'Stationsplein 23, Arnhem'),
('lbaloyi', 'ibrahimovic', '2024-06-24 13:15:00', 'Hertogstraat 24, Nijmegen'),
('dpetrov', 'snovak', '2024-06-24 15:00:00', 'Koningstraat 25, Arnhem'),
('ibrahimovic', 'yabebe', '2024-06-25 17:45:00', 'Grote Markt 26, Nijmegen'),
('snovak', 'ngebre', '2024-06-25 19:30:00', 'Rijnkade 27, Arnhem');

-- Insert statements for Pizza_Order_Item (dummy data for orders)
INSERT INTO Pizza_Order_Item (order_id, item_name, quantity) VALUES
(1, 'Margherita Pizza', 2),
(1, 'Coca Cola', 3),
(2, 'Pepperoni Pizza', 1),
(2, 'Sprite', 2),
(3, 'Vegetarische Pizza', 1),
(3, 'Hawaiian Pizza', 1),
(4, 'Combinatiemaaltijd', 2),
(4, 'Knoflookbrood', 1),
(5, 'Pepperoni Pizza', 1),
(6, 'Margherita Pizza', 3),
(6, 'Hawaiian Pizza', 2),
(7, 'Combinatiemaaltijd', 2),
(8, 'Knoflookbrood', 2),
(8, 'Sprite', 1),
(9, 'Pepperoni Pizza', 1),
(10, 'Hawaiian Pizza', 2),
(10, 'Coca Cola', 2),
(11, 'Margherita Pizza', 2),
(12, 'Vegetarische Pizza', 1),
(13, 'Hawaiian Pizza', 3),
(13, 'Coca Cola', 1),
(14, 'Combinatiemaaltijd', 1),
(14, 'Knoflookbrood', 1),
(15, 'Pepperoni Pizza', 2),
(15, 'Sprite', 2),
(16, 'Margherita Pizza', 1),
(17, 'Vegetarische Pizza', 2),
(18, 'Hawaiian Pizza', 1),
(19, 'Combinatiemaaltijd', 2),
(19, 'Knoflookbrood', 1),
(20, 'Pepperoni Pizza', 3),
(21, 'Hawaiian Pizza', 2),
(21, 'Coca Cola', 1),
(22, 'Margherita Pizza', 2),
(22, 'Knoflookbrood', 1),
(23, 'Pepperoni Pizza', 1),
(24, 'Vegetarische Pizza', 2),
(25, 'Hawaiian Pizza', 2),
(25, 'Sprite', 1),
(26, 'Combinatiemaaltijd', 1),
(26, 'Knoflookbrood', 1),
(27, 'Pepperoni Pizza', 2),
(27, 'Coca Cola', 2);
