-- Create table for car brands
CREATE TABLE car_brands (
    brand_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL UNIQUE
);

-- Create table for car models
CREATE TABLE car_models (
    model_id SERIAL PRIMARY KEY,
    model_name VARCHAR(50) NOT NULL,
    brand_id INT NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES car_brands(brand_id)
);

-- Create table for fleet cars
CREATE TABLE fleet_cars (
    fleet_car_id SERIAL PRIMARY KEY,
    number_plate VARCHAR(10) NOT NULL UNIQUE,
    expiry_date DATE NOT NULL,
    model_id INT NOT NULL,
    driver_name VARCHAR(100) NOT NULL,
    fleet_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (model_id) REFERENCES car_models(model_id)
);

-- Insert initial data into car_brands
INSERT INTO car_brands (brand_name) VALUES 
('Toyota'), 
('Ford'), 
('Hyundai');

-- Insert initial data into car_models
INSERT INTO car_models (model_name, brand_id) VALUES 
('Landcruiser', 1),
('Yaris', 1),
('RAV4', 1),
('Ranger', 2),
('Escape', 2),
('i30', 3),
('Tucson', 3);

-- Insert initial data into fleet_cars
INSERT INTO fleet_cars (number_plate, expiry_date, model_id, driver_name) VALUES
('S123ABC', '2024-07-08', 1, 'Shelton Church'),
('S125ABJ', '2024-08-01', 1, 'Gwendoline Burke'),
('S126ABO', '2024-08-02', 2, 'Laurel Hailey'),
('S127ABL', '2024-08-08', 3, 'Hale Westcott'),
('S125ABE', '2024-11-15', 3, 'Philippa Bates'),
('S124ABD', '2024-11-15', 3, 'Agatha Hightower'),
('S126ABF', '2024-11-15', 4, 'Wilkie Sempers'),
('S123ABM', '2024-12-24', 4, 'Hester Hodges'),
('S127ABP', '2024-12-25', 4, 'Arron Duke'),
('S126ABK', '2025-01-05', 4, 'Vonda Wall'),
('S127ABG', '2025-03-31', 5, 'Leola Holt'),
('S123ABH', '2025-03-31', 6, 'Marshall Blakeslee'),
('S124ABC', '2025-04-09', 7, 'Rosamond Frank'),
('S125ABN', '2025-04-09', 7, 'Rosemary Croft'),
('S124ABI', '2025-04-09', 7, 'Sherri Akers');
