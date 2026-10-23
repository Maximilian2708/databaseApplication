DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS characters;

CREATE TABLE players (
	player_username TEXT PRIMARY KEY,
	player_email TEXT NOT NULL,
	player_country TEXT,
	player_joined TEXT
);

CREATE TABLE classes (
	class_name TEXT PRIMARY KEY,
	class_role TEXT NOT NULL,
	class_base_health INTEGER
);

CREATE TABLE items (
	item_name TEXT PRIMARY KEY,
	item_type TEXT NOT NULL,
	item_rarity TEXT,
	item_gold_value INTEGER
);

CREATE TABLE characters (
	character_id INTEGER PRIMARY KEY,
	character_name TEXT NOT NULL,
	level INTEGER,
	class_name TEXT,
	player_username TEXT,
	FOREIGN KEY (class_name) REFERENCES classes (class_name),
	FOREIGN KEY (player_username) REFERENCES players (player_username)
);

CREATE TABLE inventory (
	character_id INTEGER,
	item_name TEXT,
	quantity INTEGER,
	FOREIGN KEY (character_id) REFERENCES characters (character_id),
	FOREIGN KEY (item_name) REFERENCES items (item_name)
);

INSERT INTO players (player_username, player_email, player_country, player_joined)
VALUES 
('NightOwl_22', 'nightowl22@mail.com', 'USA', '2023-04-12'),
('DragonFist', 'dragonfist@mail.com', 'Canada', '2022-11-03'),
('PixelQueen', 'pixelqueen@mail.com', 'UK', '2024-01-20'),
('LootGoblin', 'lootgoblin@mail.com', 'Mexico', '2023-08-15');

INSERT INTO classes (class_name, class_role, class_base_health)
VALUES
('Warrior', 'Tank', '150'),
('Mage', 'Damage', '80'),
('Cleric', 'Healer', '100'),
('Rogue', 'Damage', '90');

INSERT INTO items (item_name, item_type, item_rarity, item_gold_value)
VALUES
('Iron Sword', 'Weapon', 'Common', '25'),
('Health Potion', 'Potion', 'Common', '10'),
('Fire Staff', 'Weapon', 'Rare', '300'),
('Dragon Scale Armor', 'Armor', 'Epic', '1200');

INSERT INTO characters (character_id, character_name, level, class_name, player_username)
VALUES 
('1', 'Shadow', '44', 'Rogue', 'NightOwl_22'),
('2', 'Brakka', '31', 'Warrior', 'DragonFist'),
('3', 'Lumi', '12', 'Mage', 'PixelQueen'),
('4', 'Shadow', '7', 'Cleric', 'LootGoblin');

INSERT INTO inventory (character_id, item_name, quantity)
VALUES
('1', 'Iron Sword', '1'),
('2', 'Dragon Scale Armor', '1'),
('3', 'Fire Staff', '1'),
('4', 'Health Potion', '5');
