# MTA:SA Player Spawn & Save System

This resource for **Multi Theft Auto: San Andreas (MTA:SA)** handles player spawn and quit events by integrating with a MySQL database. It automatically spawns existing players at their last saved location or registers new players with a random skin and starting position.

## Features

- 📦 Automatically loads player data from the database on join.
- 🧍 Spawns players at last saved position, rotation, skin, interior, and dimension.
- 🆕 New players are initialized with random skins and default spawn positions.
- 💾 Player data (position, rotation, interior, dimension) is saved on quit.
- 🔐 Player IDs are stored as element data for use in other scripts.

## Requirements

- MTA:SA server
- A database system (e.g. MySQL) with a table named `player`
- A resource named `db` that exports a `getConnection()` function for database access

### SQL Schema

Make sure you have the following SQL schema in your database:

```sql
CREATE TABLE IF NOT EXISTS `player` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL,
  `skin` INT NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `rotation` FLOAT NOT NULL,
  `interior` INT NOT NULL,
  `dimension` INT NOT NULL
);
