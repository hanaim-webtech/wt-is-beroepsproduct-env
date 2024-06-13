
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
  [address] NVARCHAR(255),
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

CREATE TABLE [Pizza_Order] (
  [order_id] INT PRIMARY KEY IDENTITY(1, 1),
  [client_username] NVARCHAR(255),
  [client_name] NVARCHAR(255) NOT NULL,
  [personnel_username] NVARCHAR(255) NOT NULL,
  [datetime] DATETIME NOT NULL,
  [status] INT,
  [address] NVARCHAR(255)
)

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

-- Insert statements for pizza orders
INSERT INTO [Pizza_Order] (client_username, client_name, personnel_username, datetime, status, address) VALUES
('jdoe', 'John Doe', 'rdeboer', '2024-06-12 18:45:00', 1, 'Bakkerstraat 1, 6811EG, Arnhem'),
('mvermeer', 'Maria Vermeer', 'sbakker', '2024-06-12 19:00:00', 2, 'Jansplein 2, 6811GD, Arnhem'),
('fholwerda', 'Fenna Holwerda', 'lheineken', '2024-06-12 19:15:00', 1, 'Willemsplein 3, 6811KD, Arnhem'),
('kdijkstra', 'Klaas Dijkstra', 'mvandam', '2024-06-12 19:30:00', 2, 'Kerkstraat 4, 6811DW, Arnhem'),
('gkoolstra', 'Gert Koolstra', 'tjanssen', '2024-06-12 19:45:00', 3, 'Rijnkade 5, 6811HA, Arnhem'),
(NULL, 'Pieter Post', 'abrouwer', '2024-06-12 20:00:00', 1, 'Grote Markt 6, 6511KB, Nijmegen'),
(NULL, 'Anna Smits', 'wbos', '2024-06-12 20:15:00', 2, 'Sint Annastraat 7, 6524EZ, Nijmegen'),
(NULL, 'Bert van Dijk', 'tvandermeer', '2024-06-12 20:30:00', 3, 'Oranjesingel 8, 6511NV, Nijmegen'),
(NULL, 'Sara de Vries', 'rkramer', '2024-06-12 20:45:00', 1, 'Van Welderenstraat 9, 6511MS, Nijmegen'),
(NULL, 'Jan Jansen', 'mnijland', '2024-06-12 21:00:00', 2, 'Molenstraat 10, 6511HJ, Nijmegen'),
('dschouten', 'David Schouten', 'hdeleeuw', '2024-06-13 18:45:00', 1, 'Velperweg 11, 6814AD, Arnhem'),
('evisscher', 'Emma Visscher', 'pvanveen', '2024-06-13 19:00:00', 2, 'Geitenkamp 12, 6815AP, Arnhem'),
('adekhane', 'Ahmed Dekhane', 'ayildiz', '2024-06-13 19:15:00', 1, 'IJssellaan 13, 6821DJ, Arnhem'),
('wbos', 'Willem Bos', 'tbayrak', '2024-06-13 19:30:00', 2, 'Broekstraat 14, 6822GD, Arnhem'),
('mnijland', 'Maud Nijland', 'mkassem', '2024-06-13 19:45:00', 3, 'Apeldoornsestraat 15, 6828AJ, Arnhem'),
(NULL, 'Els de Boer', 'lsaleh', '2024-06-13 20:00:00', 1, 'Marialaan 16, 6541RP, Nijmegen'),
(NULL, 'Tom Bakker', 'pkowalski', '2024-06-13 20:15:00', 2, 'Smetiusstraat 17, 6511EP, Nijmegen'),
(NULL, 'Mila Janssen', 'aivanov', '2024-06-13 20:30:00', 3, 'Van Oldenbarneveltstraat 18, 6511PA, Nijmegen'),
(NULL, 'Lars de Groot', 'mkarimi', '2024-06-13 20:45:00', 1, 'Hertogstraat 19, 6511RV, Nijmegen'),
(NULL, 'Rik Kramer', 'dpetrov', '2024-06-13 21:00:00', 2, 'Van Schaeck Mathonsingel 20, 6512AP, Nijmegen'),
(NULL, 'Sophie van der Meer', 'ibrahimovic', '2024-06-14 18:45:00', 1, 'Lange Hezelstraat 21, 6511CM, Nijmegen'),
('rdeboer', 'Rik de Boer', 'sbakker', '2024-06-14 19:00:00', 2, 'Waalkade 22, 6511XR, Nijmegen'),
('mvermeer', 'Maria Vermeer', 'lheineken', '2024-06-14 19:15:00', 1, 'Sint Jacobslaan 23, 6533BT, Nijmegen'),
('jdoe', 'John Doe', 'mvandam', '2024-06-14 19:30:00', 2, 'Van Broeckhuysenstraat 24, 6511PE, Nijmegen'),
(NULL, 'Henk de Wit', 'gkoolstra', '2024-06-14 19:45:00', 3, 'Ziekerstraat 25, 6511LH, Nijmegen');


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
(25, 'Sprite', 1);


-- pak de oudste en de nieuwste datum
declare @date_start datetime;
declare @date_end datetime;

select @date_start = MIN(datetime) from Pizza_Order;
select @date_end   = max(datetime) from Pizza_Order;

-- Bereken aan de hand van het verschil de middelste datum tussen start en eind
declare @diff int;
set @diff = DATEDIFF(minute, @date_start, @date_end);

declare @middle_date datetime;
set @middle_date = DATEADD(minute, @diff/2, @date_start);

-- Bereken verschil middelste datum met nu (huidig tijdstip)
set @diff = DATEDIFF(minute, @middle_date, GETDATE());

-- update vlucht vertrektijden en passagier inchecktijd
update Pizza_Order set [datetime] = DATEADD(minute, @diff, datetime);

go