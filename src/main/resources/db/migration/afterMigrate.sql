/* START */

/* Data for the table "customer" */

insert into "customer"("customer_number", "customer_name", "contact_last_name", "contact_first_name", "phone", "sales_rep_employee_number", "credit_limit", "first_buy_date") values 

(99, 'Australian Home', 'Paoule', 'Sart ', '40.11.2555', 1370, '21000.00', 20210), 

(100, 'Joliyon', 'Schmitt', 'Rue ', '10.22.2535', 1370, '21000.00', 20201), 

(101, 'Marquez Xioa', 'Calor', 'Sar ', '`11.12.2525', 1370, '21000.00', 21805)

ON CONFLICT ("customer_number") DO NOTHING;

/* Data for the table "customerdetail" */

insert into "customerdetail"("customer_number", "address_line_first", "address_line_second", "city", "state", "postal_code", "country") values 

(99, '43 Rue 2', NULL, 'Paris' , NULL, '25017', 'France'),

(100, '51, Avenue 3', NULL, NULL , NULL, '43000', NULL), 

(101, '51, St 5', NULL, NULL , NULL, '44000', 'USA')

ON CONFLICT ("customer_number") DO NOTHING;

/*Data for the table `productline` */

insert into "productline"("product_line", "code", "text_description", "html_description", "image", "created_on") values 

('Classic Cars', 599302, 'Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.', '<productline><name>Classic Cars</name><code>599302</code><capacity supportClass="a, b, c"><a index="200A">200</a><b index="100B">100</b><c index="500C">500<note for="client">This has certain limitations</note></c></capacity><details><power>5000kw</power><type nr_of_lines="5" command="ERP">1</type></details></productline>', NULL, '2005-02-03'), 

('Motorcycles', 599302, 'Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.', '<productline><name>Motorcycles</name><code>599302</code><capacity supportClass="a, b"><a index="250A">200</a><b index="150B">100</b></capacity><details><power>2000kw</power><type nr_of_lines="3" command="OPS">2</type></details></productline>', NULL, '2004-12-12'), 

('Planes', 433823, 'Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.', NULL, NULL, '2004-02-14'), 

('Ships', 433823, 'The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.', NULL, NULL, '2005-12-12'), 

('Trains', 123333, 'Model trains are a rewarding hobby for enthusiasts of all ages. Whether you''re looking for collectible wooden trains, electric streetcars or locomotives, you''ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.', '<productline><name>Trains</name><code>123333</code><capacity supportClass="a, b, b1, c"><a index="250A">200</a><b index="150B">100<b1 index="300B">300</b1></b><c index="350B">350</c></capacity><details><power>20000kw</power><type nr_of_lines="1" command="ERP">1</type></details></productline>', NULL, '2004-03-03'), 

('Trucks and Buses', 569331, 'The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.', NULL, NULL, '2005-02-25'), 

('Vintage Cars', 223113, 'Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.', NULL, NULL, '2004-04-02') ON CONFLICT ("product_line") DO NOTHING;



/* Data for the table "product" */

insert into "product"("product_id", "product_name", "product_line", "code", "product_scale", "product_vendor", "product_description", "quantity_in_stock", "buy_price", "msrp") values 

(1, '1969 Harley Davidson Ultimate Chopper', 'Motorcycles', 599302, '1:10', 'Min Lin Diecast', 'PENDING', 7933, '48.81', '95.70'), 

(2, '1952 Alpine Renault 1300', 'Classic Cars', 599302, '1:10', 'Classic Metal Creations', 'PENDING', 7305, '98.58', '214.30'), 

(3, '1996 Moto Guzzi 1100i', 'Motorcycles', 599302, '1:10', 'Highway 66 Mini Classics', 'PENDING', 6625, '68.99', '118.94'), 

(4, '2003 Harley-Davidson Eagle Drag Bike', 'Motorcycles', 599302, '1:10', 'Red Start Diecast', 'PENDING', 5582, '91.02', '193.66'), 

(5, '1972 Alfa Romeo GTA', 'Classic Cars', 599302, '1:10', 'Motor City Art Classics', 'PENDING', 3252, '85.68', '136.00'), 

(6, '1962 LanciaA Delta 16V', 'Classic Cars', 599302, '1:10', 'Welly Diecast Productions', 'PENDING', 6791, '103.42', '147.74'), 

(7, '1968 Ford Mustang', 'Classic Cars', 599302, '1:12', 'Autoart Studio Design', 'Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.', 68, '95.34', '194.57'), 

(8, '2001 Ferrari Enzo', 'Classic Cars', 599302, '1:12', 'Second Gear Diecast', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3619, '95.59', '207.80'), 

(9, '1958 Setra Bus', 'Trucks and Buses', 569331, '1:12', 'Welly Diecast Productions', 'Model features 30 windows, skylights & glare resistant glass, working steering system, original logos', 1579, '77.90', '136.67'), 

(10, '2002 Suzuki XREO', 'Motorcycles', 599302, '1:12', 'Unimax Art Galleries', 'Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 9997, '66.27', '150.62'), 

(11, '1969 Corvair Monza', 'Classic Cars', 599302, '1:18', 'Welly Diecast Productions', '1:18 scale die-cast about 10" long doors open, hood opens, trunk opens and wheels roll', 6906, '89.14', '151.08'), 

(12, '1968 Dodge Charger', 'Classic Cars', 599302, '1:12', 'Welly Diecast Productions', '1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black', 9123, '75.16', '117.44'), 

(13, '1969 Ford Falcon', 'Classic Cars', 599302, '1:12', 'Second Gear Diecast', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 1049, '83.05', '173.02'), 

(14, '1970 Plymouth Hemi Cuda', 'Classic Cars', 599302, '1:12', 'Studio M Art Models', 'Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.', 5663, '31.92', '79.80'), 

(15, '1957 Chevy Pickup', 'Trucks and Buses', 569331, '1:12', 'Exoto Designs', '1:12 scale die-cast about 20" long Hood opens, Rubber wheels', 6125, '55.70', '118.50'), 

(16, '1969 Dodge Charger', 'Classic Cars', 599302, '1:12', 'Welly Diecast Productions', 'Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.', 7323, '58.73', '115.16'), 

(17, '1940 Ford Pickup Truck', 'Trucks and Buses', 569331, '1:18', 'Studio M Art Models', 'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 2613, '58.33', '116.67'), 

(18, '1993 Mazda RX-7', 'Classic Cars', 599302, '1:18', 'Highway 66 Mini Classics', 'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.', 3975, '83.51', '141.54'), 

(19, '1937 Lincoln Berline', 'Vintage Cars', 223113, '1:18', 'Motor City Art Classics', 'Features opening engine cover, doors, trunk, and fuel filler cap. Color black', 8693, '60.62', '102.74'), 

(20, '1936 Mercedes-Benz 500K Special Roadster', 'Vintage Cars', 223113, '1:18', 'Studio M Art Models', 'This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', 8635, '24.26', '53.91'), 

(21, '1965 Aston Martin DB5', 'Classic Cars', 599302, '1:18', 'Classic Metal Creations', 'Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.', 9042, '65.96', '124.44'), 

(22, '1980s Black Hawk Helicopter', 'Planes', 433823, '1:18', 'Red Start Diecast', '1:18 scale replica of actual Army''s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.', 5330, '77.27', '157.69'), 

(23, '1917 Grand Touring Sedan', 'Vintage Cars', 223113, '1:18', 'Welly Diecast Productions', 'This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.', 2724, '86.70', '170.00'), 

(24, '1948 Porsche 356-A Roadster', 'Classic Cars', 599302, '1:18', 'Gearbox Collectibles', 'This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8826, '53.90', '77.00'), 

(25, '1995 Honda Civic', 'Classic Cars', 599302, '1:18', 'Min Lin Diecast', 'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.', 9772, '93.89', '142.25'), 

(26, '1998 Chrysler Plymouth Prowler', 'Classic Cars', 599302, '1:18', 'Gearbox Collectibles', 'Turnable front wheels; steering create function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 4724, '101.51', '163.73'), 

(27, '1911 Ford Town Car', 'Vintage Cars', 223113, '1:18', 'Motor City Art Classics', 'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.', 540, '33.30', '60.54'), 

(28, '1964 Mercedes Tour Bus', 'Trucks and Buses', 569331, '1:18', 'Unimax Art Galleries', 'Exact replica. 100+ parts. working steering system, original logos', 8258, '74.86', '122.73'), 

(29, '1932 Model A Ford J-Coupe', 'Vintage Cars', 223113, '1:18', 'Autoart Studio Design', 'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine', 9354, '58.48', '127.13'), 

(30, '1926 Ford Fire Engine', 'Trucks and Buses', 569331, '1:18', 'Carousel DieCast Legends', 'Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.', 2018, '24.92', '60.77'), 

(31, 'P-51-D Mustang', 'Planes', 433823, '1:72', 'Gearbox Collectibles', 'Has retractable wheels and comes with a stand', 992, '49.00', '84.48'), 

(32, '1936 Harley Davidson El Knucklehead', 'Motorcycles', 599302, '1:18', 'Welly Diecast Productions', 'Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.', 4357, '24.23', '60.57'), 

(33, '1928 Mercedes-Benz SSK', 'Vintage Cars', 223113, '1:18', 'Gearbox Collectibles', 'This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.', 548, '72.56', '168.75'), 

(34, '1999 Indy 500 Monte Carlo SS', 'Classic Cars', 599302, '1:18', 'Red Start Diecast', 'Features include opening and closing doors. Color: Red', 8164, '56.76', '132.00'), 

(35, '1913 Ford Model T Speedster', 'Vintage Cars', 223113, '1:18', 'Carousel DieCast Legends', 'This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.', 4189, '60.78', '101.31'), 

(36, '1934 Ford V8 Coupe', 'Vintage Cars', 223113, '1:18', 'Min Lin Diecast', 'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 5649, '34.35', '62.46'), 

(37, '1999 Yamaha Speed Boat', 'Ships', 433823, '1:18', 'Min Lin Diecast', 'Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 4259, '51.61', '86.02'), 

(38, '18th Century Vintage Horse Carriage', 'Vintage Cars', 223113, '1:18', 'Red Start Diecast', 'Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.rnrnThis collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.', 5992, '60.74', '104.72'), 

(39, '1903 Ford Model A', 'Vintage Cars', 223113, '1:18', 'Unimax Art Galleries', 'Features opening trunk, working steering system', 3913, '68.30', '136.59'), 

(40, '1992 Ferrari 360 Spider red', 'Classic Cars', 599302, '1:18', 'Unimax Art Galleries', 'his replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8347, '77.90', '169.34'), 

(41, '1985 Toyota Supra', 'Classic Cars', 599302, '1:18', 'Highway 66 Mini Classics', 'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 7733, '57.01', '107.57'), 

(42, 'Collectable Wooden Train', 'Trains', 123333, '1:18', 'Carousel DieCast Legends', 'Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.', 6450, '67.56', '100.84'), 

(43, '1969 Dodge Super Bee', 'Classic Cars', 599302, '1:18', 'Min Lin Diecast', 'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 1917, '49.05', '80.41'), 

(44, '1917 Maxwell Touring Car', 'Vintage Cars', 223113, '1:18', 'Exoto Designs', 'Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 7913, '57.54', '99.21'), 

(45, '1976 Ford Gran Torino', 'Classic Cars', 599302, '1:18', 'Gearbox Collectibles', 'Highly detailed 1976 Ford Gran Torino "Starsky and Hutch" diecast model. Very well constructed and painted in red and white patterns.', 9127, '73.49', '146.99'), 

(46, '1948 Porsche Type 356 Roadster', 'Classic Cars', 599302, '1:18', 'Gearbox Collectibles', 'This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap, and 4 opening doors.', 8990, '62.16', '141.28'), 

(47, '1957 Vespa GS150', 'Motorcycles', 599302, '1:18', 'Studio M Art Models', 'Features rotating wheels , working kick stand. Comes with stand.', 7689, '32.95', '62.17'), 

(48, '1941 Chevrolet Special Deluxe Cabriolet', 'Vintage Cars', 223113, '1:18', 'Exoto Designs', 'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.', 2378, '64.58', '105.87'), 

(49, '1970 Triumph Spitfire', 'Classic Cars', 599302, '1:18', 'Min Lin Diecast', 'Features include opening and closing doors. Color: White.', 5545, '91.92', '143.62'), 

(50, '1932 Alfa Romeo 8C2300 Spider Sport', 'Vintage Cars', 223113, '1:18', 'Exoto Designs', 'This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.', 6553, '43.26', '92.03')

 ON CONFLICT ("product_id") DO NOTHING;

/* Data for the table "order" */

insert into "order"("order_id", "order_date", "required_date", "shipped_date", "status", "comments", "customer_number", "amount") values 

(10100, '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, 99, 301.84),

(10101, '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', 100, 352),

(10102, '2003-01-10', '2003-01-18', '2003-01-14', 'Shipped', NULL, 101, 138.68) ON CONFLICT ("order_id") DO NOTHING;

/* Data for the table "orderdetail" */

insert into "orderdetail"("order_id", "product_id", "quantity_ordered", "price_each", "order_line_number") values 

(10100, 23, 30, '136.00', 3), 

(10100, 27, 50, '55.09', 2), 

(10100, 50, 22, '75.46', 4),

(10101, 29, 25, '108.06', 4), 

(10101, 33, 26, '167.06', 1),

(10102, 19, 39, '95.55', 2), 

(10102, 20, 41, '43.13', 1) ON CONFLICT ("order_id", "product_id") DO NOTHING;


/* END */
