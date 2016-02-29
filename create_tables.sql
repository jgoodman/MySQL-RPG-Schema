CREATE TABLE `conf` (
    `conf_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `value` varchar(255),
    PRIMARY KEY (`conf_id`),
    CONSTRAINT `uk_name` UNIQUE (`name`)
);

CREATE TABLE `user_type` (
    `user_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`user_type_id`)
);

INSERT INTO `user_type` (`name`) VALUES ('admin');
INSERT INTO `user_type` (`name`) VALUES ('moderator');
INSERT INTO `user_type` (`name`) VALUES ('player');
INSERT INTO `user_type` (`name`) VALUES ('spectator');

CREATE TABLE `user` (
    `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_type_id` int(11) UNSIGNED NOT NULL,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY (`user_id`),
    CONSTRAINT `fk_user_user_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `user_type`(`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `character_type` (
    `character_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`character_type_id`)
);

INSERT INTO `character_type` (`name`) VALUES ('player');
INSERT INTO `character_type` (`name`) VALUES ('non-playable');

CREATE TABLE `character` (
    `character_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `alive` tinyint NOT NULL,
    `level` smallint NOT NULL,
    `xp` bigint NOT NULL,
    `money` bigint NOT NULL,
    PRIMARY KEY (`character_id`),
    CONSTRAINT `fk_character_character_type_id` FOREIGN KEY (`character_type_id`) REFERENCES `character_type`(`character_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `user_character` (
    `user_character_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`user_character_id`),
    CONSTRAINT `uk_user_id_character_id` UNIQUE (`user_id`, `character_id`),
    CONSTRAINT `fk_user_character_user_id` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_character_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `attribute` (
    `attribute_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `desc` varchar(255),
    PRIMARY KEY (`attribute_id`)
);

INSERT INTO `attribute` (`name`, `desc`) VALUES ('strength', 'A measure of how physically strong a character is.');
INSERT INTO `attribute` (`name`, `desc`) VALUES ('constitution', 'A measure of how resilient a character is.');
INSERT INTO `attribute` (`name`, `desc`) VALUES ('dexterity', 'A measure of how agile a character is.');
INSERT INTO `attribute` (`name`, `desc`) VALUES ('intelligence', 'A measure of a character''s problem-solving ability.');
INSERT INTO `attribute` (`name`, `desc`) VALUES ('charisma', 'A measure of a character''s social skills, and sometimes their physical appearance.');
INSERT INTO `attribute` (`name`, `desc`) VALUES ('wisdom', 'A measure of a character''s common sense and/or spirituality.');
INSERT INTO `attribute` (`name`, `desc`) VALUES ('willpower', 'A measure of the character''s mental resistance.');
INSERT INTO `attribute` (`name`, `desc`) VALUES ('perception', 'A measure of a character''s openness to their surroundings.');
INSERT INTO `attribute` (`name`, `desc`) VALUES ('luck', 'A measure of a character having chance to favor him or her.');
INSERT INTO `attribute` (`name`, `desc`) VALUES ('damage', 'A measure to inflict damage');

CREATE TABLE `character_attribute` (
    `character_attribute_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `attribute_id` int(11) UNSIGNED NOT NULL,
    `value` bigint NOT NULL,
    PRIMARY KEY (`character_attribute_id`),
    CONSTRAINT `uk_character_id_attribute_id` UNIQUE (`character_id`, `attribute_id`),
    CONSTRAINT `fk_character_attribute_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_attribute_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute`(`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `place` (
    `place_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`place_id`)
);

CREATE TABLE `location` (
    `location_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `x` bigint NOT NULL,
    `y` bigint NOT NULL,
    `place_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`location_id`),
    CONSTRAINT `uk_x_y` UNIQUE (`x`, `y`),
    CONSTRAINT `fk_location_place_id` FOREIGN KEY (`place_id`) REFERENCES `place`(`place_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `character_location` (
    `character_location_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `location_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`character_location_id`),
    CONSTRAINT `uk_character_id` UNIQUE (`character_id`),
    CONSTRAINT `fk_character_location_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_location_location_id` FOREIGN KEY (`location_id`) REFERENCES `location`(`location_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `item_type` (
    `item_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `desc` varchar(255),
    PRIMARY KEY (`item_type_id`)
);

CREATE TABLE `item` (
    `item_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `item_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `required_level` smallint,
    `durability` tinyint  NOT NULL,
    PRIMARY KEY (`item_id`),
    CONSTRAINT `fk_item_item_type_id` FOREIGN KEY (`item_type_id`) REFERENCES `item_type`(`item_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `item_attribute` (
    `item_attribute_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `item_id` int(11) UNSIGNED NOT NULL,
    `attribute_id` int(11) UNSIGNED NOT NULL,
    `value` bigint NOT NULL,
    PRIMARY KEY (`item_attribute_id`),
    CONSTRAINT `uk_item_id_attribute_id` UNIQUE (`item_id`, `attribute_id`),
    CONSTRAINT `fk_item_attribute_item_id` FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_item_attribute_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute`(`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `item_location` (
    `item_location_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `item_id` int(11) UNSIGNED NOT NULL,
    `location_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`item_location_id`),
    CONSTRAINT `uk_item_id` UNIQUE (`item_id`),
    CONSTRAINT `fk_item_location_item_id` FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_item_location_location_id` FOREIGN KEY (`location_id`) REFERENCES `location`(`location_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `character_item` (
    `character_item_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `item_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`character_item_id`),
    CONSTRAINT `uk_character_id_item_id` UNIQUE (`character_id`, `item_id`),
    CONSTRAINT `fk_character_item_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_item_item_id` FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `equipment_slot` (
    `equipment_slot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`equipment_slot_id`),
    CONSTRAINT `uk_name` UNIQUE (`name`)
);

INSERT INTO `equipment_slot` (`name`) VALUES ('head');
INSERT INTO `equipment_slot` (`name`) VALUES ('shoulder');
INSERT INTO `equipment_slot` (`name`) VALUES ('chest');
INSERT INTO `equipment_slot` (`name`) VALUES ('back');
INSERT INTO `equipment_slot` (`name`) VALUES ('wrist');
INSERT INTO `equipment_slot` (`name`) VALUES ('hands');
INSERT INTO `equipment_slot` (`name`) VALUES ('waist');
INSERT INTO `equipment_slot` (`name`) VALUES ('leg');
INSERT INTO `equipment_slot` (`name`) VALUES ('feet');
INSERT INTO `equipment_slot` (`name`) VALUES ('neck');
INSERT INTO `equipment_slot` (`name`) VALUES ('ears');
INSERT INTO `equipment_slot` (`name`) VALUES ('ring');
INSERT INTO `equipment_slot` (`name`) VALUES ('main_hand');
INSERT INTO `equipment_slot` (`name`) VALUES ('off_hand');

CREATE TABLE `character_equipment` (
    `character_equipment_id` int(11) UNSIGNED NOT NULL,
    `equipment_slot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `item_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`equipment_slot_id`),
    CONSTRAINT `uk_equipment_slot_id_character_id` UNIQUE (`equipment_slot_id`, `character_id`),
    CONSTRAINT `fk_character_equipment_equipment_slot_id` FOREIGN KEY (`equipment_slot_id`) REFERENCES `equipment_slot`(`equipment_slot_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_equipment_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_equipment_item_id` FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `class` (
    `class_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`class_id`),
    CONSTRAINT `uk_name` UNIQUE (`name`)
);

CREATE TABLE `character_class` (
    `character_class_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `class_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`character_class_id`),
    CONSTRAINT `uk_character_id` UNIQUE (`character_id`),
    CONSTRAINT `fk_character_class_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_class_class_id` FOREIGN KEY (`class_id`) REFERENCES `class`(`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `ability_type` (
    `ability_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `desc` varchar(255),
    PRIMARY KEY (`ability_type_id`)
);

CREATE TABLE `ability` (
    `ability_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `ability_type_id` int(11) UNSIGNED NOT NULL,
    `required_level` smallint,
    PRIMARY KEY (`ability_id`),
    CONSTRAINT `fk_ability_ability_type_id` FOREIGN KEY (`ability_type_id`) REFERENCES `ability_type`(`ability_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `class_ability` (
    `class_ability_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `class_id` int(11) UNSIGNED NOT NULL,
    `ability_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`class_ability_id`),
    CONSTRAINT `uk_class_id_ability_id` UNIQUE (`class_id`, `ability_id`),
    CONSTRAINT `fk_class_ability_class_id` FOREIGN KEY (`class_id`) REFERENCES `class`(`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_class_ability_ability_id` FOREIGN KEY (`ability_id`) REFERENCES `ability`(`ability_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `effect_type` (
    `effect_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `desc` varchar(255),
    PRIMARY KEY (`effect_type_id`)
);

INSERT INTO `effect_type` (`name`, `desc`) VALUES ('buff', 'A temporary benefit to a character’s attributes');
INSERT INTO `effect_type` (`name`, `desc`) VALUES ('debuff', 'A temporary hindrance to a character’s attributes');

CREATE TABLE `status_effect` (
    `status_effect_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `effect_type_id` int(11) UNSIGNED NOT NULL,
    `duration` bigint,
    `desc` varchar(255),
    PRIMARY KEY (`status_effect_id`),
    CONSTRAINT `fk_status_effect_effect_type_id` FOREIGN KEY (`effect_type_id`) REFERENCES `effect_type`(`effect_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `character_status_effect` (
    `character_status_effect_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `status_effect_id` int(11) UNSIGNED NOT NULL,
    `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`character_status_effect_id`),
    CONSTRAINT `fk_character_status_effect_status_effect_id` FOREIGN KEY (`status_effect_id`) REFERENCES `status_effect`(`status_effect_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_status_effect_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `loot` (
    `loot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `xp` bigint,
    `money` bigint,
    PRIMARY KEY (`loot_id`)
);

CREATE TABLE `character_loot` (
    `character_loot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `loot_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`character_loot_id`),
    CONSTRAINT `fk_character_loot_loot_id` FOREIGN KEY (`loot_id`) REFERENCES `loot`(`loot_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_loot_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `item_loot` (
    `item_loot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `loot_id` int(11) UNSIGNED NOT NULL,
    `item_id` int(11) UNSIGNED NOT NULL,
    `drop_chance` FLOAT(4,4),
    PRIMARY KEY (`item_loot_id`),
    CONSTRAINT `fk_item_loot_loot_id` FOREIGN KEY (`loot_id`) REFERENCES `loot`(`loot_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_item_loot_item_id` FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `entity_type` (
    `entity_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`entity_type_id`)
);

CREATE TABLE `entity` (
    `entity_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `entity_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `level` smallint,
    PRIMARY KEY (`entity_id`),
    CONSTRAINT `fk_entity_entity_type_id` FOREIGN KEY (`entity_type_id`) REFERENCES `entity_type`(`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `entity_attribute` (
    `entity_attribute_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `attribute_id` int(11) UNSIGNED NOT NULL,
    `value` bigint NOT NULL,
    PRIMARY KEY (`entity_attribute_id`),
    CONSTRAINT `uk_entity_id_attribute_id` UNIQUE (`entity_id`, `attribute_id`),
    CONSTRAINT `fk_entity_attribute_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity`(`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_entity_attribute_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute`(`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `entity_location` (
    `entity_location_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `location_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`entity_location_id`),
    CONSTRAINT `uk_entity_id` UNIQUE (`entity_id`),
    CONSTRAINT `fk_entity_location_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity`(`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_entity_location_location_id` FOREIGN KEY (`location_id`) REFERENCES `location`(`location_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `entity_class` (
    `entity_class_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `class_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`entity_class_id`),
    CONSTRAINT `uk_entity_id` UNIQUE (`entity_id`),
    CONSTRAINT `fk_entity_class_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity`(`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_entity_class_class_id` FOREIGN KEY (`class_id`) REFERENCES `class`(`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `entity_status_effect` (
    `entity_status_effect_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `status_effect_id` int(11) UNSIGNED NOT NULL,
    `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`entity_status_effect_id`),
    CONSTRAINT `fk_entity_status_effect_status_effect_id` FOREIGN KEY (`status_effect_id`) REFERENCES `status_effect`(`status_effect_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_entity_status_effect_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity`(`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `entity_loot` (
    `entity_loot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `loot_id` int(11) UNSIGNED NOT NULL,
    `entity_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`entity_loot_id`),
    CONSTRAINT `fk_entity_loot_loot_id` FOREIGN KEY (`loot_id`) REFERENCES `loot`(`loot_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_entity_loot_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity`(`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `faction` (
    `faction_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`faction_id`)
);

CREATE TABLE `character_faction` (
    `character_faction_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `faction_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`character_faction_id`),
    CONSTRAINT `fk_character_faction_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_faction_faction_id` FOREIGN KEY (`faction_id`) REFERENCES `faction`(`faction_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `entity_faction` (
    `entity_faction_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `faction_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`entity_faction_id`),
    CONSTRAINT `fk_entity_faction_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity`(`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_entity_faction_faction_id` FOREIGN KEY (`faction_id`) REFERENCES `faction`(`faction_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `rank` (
    `rank_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`rank_id`)
);

CREATE TABLE `guild` (
    `guild_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`guild_id`)
);

CREATE TABLE `guild_rank` (
    `guild_rank_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `guild_id` int(11) UNSIGNED NOT NULL,
    `rank_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`guild_rank_id`),
    CONSTRAINT `uk_guild_id_rank_id` UNIQUE (`guild_id`, `rank_id`),
    CONSTRAINT `fk_guild_rank_guild_id` FOREIGN KEY (`guild_id`) REFERENCES `guild`(`guild_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_guild_rank_rank_id` FOREIGN KEY (`rank_id`) REFERENCES `rank`(`rank_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `character_guild` (
    `character_guild_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `guild_id` int(11) UNSIGNED NOT NULL,
    `guild_leader` tinyint,
    PRIMARY KEY (`character_guild_id`),
    CONSTRAINT `uk_guild_id_guild_leader` UNIQUE (`guild_id`, `guild_leader`),
    CONSTRAINT `fk_character_guild_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_guild_guild_id` FOREIGN KEY (`guild_id`) REFERENCES `guild`(`guild_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `character_guild_rank` (
    `character_guild_rank_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `guild_rank_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`character_guild_rank_id`),
    CONSTRAINT `uk_character_id_guild_rank_id` UNIQUE (`character_id`, `guild_rank_id`),
    CONSTRAINT `fk_character_guild_rank_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_guild_rank_guild_rank_id` FOREIGN KEY (`guild_rank_id`) REFERENCES `guild_rank`(`guild_rank_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `party` (
    `party_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`party_id`)
);

CREATE TABLE `character_party` (
    `character_party_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `party_id` int(11) UNSIGNED NOT NULL,
    `party_leader` tinyint,
    PRIMARY KEY (`character_party_id`),
    CONSTRAINT `uk_character_id` UNIQUE (`character_id`),
    CONSTRAINT `uk_party_id_party_leader` UNIQUE (`party_id`, `party_leader`),
    CONSTRAINT `fk_character_party_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_party_party_id` FOREIGN KEY (`party_id`) REFERENCES `party`(`party_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `title` (
    `title_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`title_id`)
);

CREATE TABLE `character_title` (
    `character_title_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` int(11) UNSIGNED NOT NULL,
    `title_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`character_title_id`),
    CONSTRAINT `fk_character_title_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_title_title_id` FOREIGN KEY (`title_id`) REFERENCES `title`(`title_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
