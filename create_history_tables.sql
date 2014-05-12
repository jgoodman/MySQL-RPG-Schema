CREATE TABLE `h_conf` (
    h_conf_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `conf_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `value` varchar(255),
    PRIMARY KEY (`h_conf_id`)
);

CREATE TABLE `h_user_type` (
    h_user_type_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `user_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`h_user_type_id`)
);

CREATE TABLE `h_user` (
    h_user_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `user_id` int(11) UNSIGNED NOT NULL,
    `user_type_id` int(11) UNSIGNED NOT NULL,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY (`h_user_id`)
);

CREATE TABLE `h_character_type` (
    h_character_type_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`h_character_type_id`)
);

CREATE TABLE `h_character` (
    h_character_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_id` int(11) UNSIGNED NOT NULL,
    `character_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `alive` tinyint NOT NULL,
    `level` smallint NOT NULL,
    `xp` bigint NOT NULL,
    `money` bigint NOT NULL,
    PRIMARY KEY (`h_character_id`)
);

CREATE TABLE `h_user_character` (
    h_user_character_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `user_character_id` int(11) UNSIGNED NOT NULL,
    `user_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_user_character_id`)
);

CREATE TABLE `h_attribute` (
    h_attribute_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `attribute_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `desc` varchar(255),
    PRIMARY KEY (`h_attribute_id`)
);

CREATE TABLE `h_character_attribute` (
    h_character_attribute_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_attribute_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `attribute_id` int(11) UNSIGNED NOT NULL,
    `value` bigint NOT NULL,
    PRIMARY KEY (`h_character_attribute_id`)
);

CREATE TABLE `h_place` (
    h_place_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `place_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`h_place_id`)
);

CREATE TABLE `h_location` (
    h_location_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `location_id` int(11) UNSIGNED NOT NULL,
    `x` bigint NOT NULL,
    `y` bigint NOT NULL,
    `place_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_location_id`)
);

CREATE TABLE `h_character_location` (
    h_character_location_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_location_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `location_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_character_location_id`)
);

CREATE TABLE `h_item_type` (
    h_item_type_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `item_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `desc` varchar(255),
    PRIMARY KEY (`h_item_type_id`)
);

CREATE TABLE `h_item` (
    h_item_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `item_id` int(11) UNSIGNED NOT NULL,
    `item_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `required_level` smallint,
    `durability` tinyint  NOT NULL,
    PRIMARY KEY (`h_item_id`)
);

CREATE TABLE `h_item_attribute` (
    h_item_attribute_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `item_attribute_id` int(11) UNSIGNED NOT NULL,
    `item_id` int(11) UNSIGNED NOT NULL,
    `attribute_id` int(11) UNSIGNED NOT NULL,
    `value` bigint NOT NULL,
    PRIMARY KEY (`h_item_attribute_id`)
);

CREATE TABLE `h_item_location` (
    h_item_location_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `item_location_id` int(11) UNSIGNED NOT NULL,
    `item_id` int(11) UNSIGNED NOT NULL,
    `location_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_item_location_id`)
);

CREATE TABLE `h_character_item` (
    h_character_item_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_item_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `item_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_character_item_id`)
);

CREATE TABLE `h_equipment_slot` (
    h_equipment_slot_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `equipment_slot_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`h_equipment_slot_id`)
);

CREATE TABLE `h_character_equipment` (
    h_character_equipment_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_equipment_id` int(11) UNSIGNED NOT NULL,
    `equipment_slot_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `item_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_character_equipment_id`)
);

CREATE TABLE `h_class` (
    h_class_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `class_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`h_class_id`)
);

CREATE TABLE `h_character_class` (
    h_character_class_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_class_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `class_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_character_class_id`)
);

CREATE TABLE `h_ability_type` (
    h_ability_type_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `ability_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `desc` varchar(255),
    PRIMARY KEY (`h_ability_type_id`)
);

CREATE TABLE `h_ability` (
    h_ability_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `ability_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `ability_type_id` int(11) UNSIGNED NOT NULL,
    `required_level` smallint,
    PRIMARY KEY (`h_ability_id`)
);

CREATE TABLE `h_class_ability` (
    h_class_ability_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `class_ability_id` int(11) UNSIGNED NOT NULL,
    `class_id` int(11) UNSIGNED NOT NULL,
    `ability_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_class_ability_id`)
);

CREATE TABLE `h_effect_type` (
    h_effect_type_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `effect_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `desc` varchar(255),
    PRIMARY KEY (`h_effect_type_id`)
);

CREATE TABLE `h_status_effect` (
    h_status_effect_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `status_effect_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `effect_type_id` int(11) UNSIGNED NOT NULL,
    `duration` bigint,
    `desc` varchar(255),
    PRIMARY KEY (`h_status_effect_id`)
);

CREATE TABLE `h_character_status_effect` (
    h_character_status_effect_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_status_effect_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `status_effect_id` int(11) UNSIGNED NOT NULL,
    `date` TIMESTAMP,
    PRIMARY KEY (`h_character_status_effect_id`)
);

CREATE TABLE `h_loot` (
    h_loot_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `loot_id` int(11) UNSIGNED NOT NULL,
    `xp` bigint,
    `money` bigint,
    PRIMARY KEY (`h_loot_id`)
);

CREATE TABLE `h_character_loot` (
    h_character_loot_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_loot_id` int(11) UNSIGNED NOT NULL,
    `loot_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_character_loot_id`)
);

CREATE TABLE `h_item_loot` (
    h_item_loot_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `item_loot_id` int(11) UNSIGNED NOT NULL,
    `loot_id` int(11) UNSIGNED NOT NULL,
    `item_id` int(11) UNSIGNED NOT NULL,
    `drop_chance` FLOAT(4,4),
    PRIMARY KEY (`h_item_loot_id`)
);

CREATE TABLE `h_entity_type` (
    h_entity_type_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `entity_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`h_entity_type_id`)
);

CREATE TABLE `h_entity` (
    h_entity_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `entity_type_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `level` smallint,
    PRIMARY KEY (`h_entity_id`)
);

CREATE TABLE `h_entity_attribute` (
    h_entity_attribute_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `entity_attribute_id` int(11) UNSIGNED NOT NULL,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `attribute_id` int(11) UNSIGNED NOT NULL,
    `value` bigint NOT NULL,
    PRIMARY KEY (`h_entity_attribute_id`)
);

CREATE TABLE `h_entity_location` (
    h_entity_location_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `entity_location_id` int(11) UNSIGNED NOT NULL,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `location_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_entity_location_id`)
);

CREATE TABLE `h_entity_class` (
    h_entity_class_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `entity_class_id` int(11) UNSIGNED NOT NULL,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `class_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_entity_class_id`)
);

CREATE TABLE `h_entity_status_effect` (
    h_entity_status_effect_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `entity_status_effect_id` int(11) UNSIGNED NOT NULL,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `status_effect_id` int(11) UNSIGNED NOT NULL,
    `date` TIMESTAMP,
    PRIMARY KEY (`h_entity_status_effect_id`)
);

CREATE TABLE `h_entity_loot` (
    h_entity_loot_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `entity_loot_id` int(11) UNSIGNED NOT NULL,
    `loot_id` int(11) UNSIGNED NOT NULL,
    `entity_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_entity_loot_id`)
);

CREATE TABLE `h_faction` (
    h_faction_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `faction_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`h_faction_id`)
);

CREATE TABLE `h_character_faction` (
    h_character_faction_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_faction_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `faction_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_character_faction_id`)
);

CREATE TABLE `h_entity_faction` (
    h_entity_faction_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `entity_faction_id` int(11) UNSIGNED NOT NULL,
    `entity_id` int(11) UNSIGNED NOT NULL,
    `faction_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_entity_faction_id`)
);

CREATE TABLE `h_rank` (
    h_rank_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `guild_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`h_rank_id`)
);

CREATE TABLE `h_guild` (
    h_guild_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `guild_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`h_guild_id`)
);

CREATE TABLE `h_guild_rank` (
    h_guild_rank_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `guild_rank_id` int(11) UNSIGNED NOT NULL,
    `guild_id` int(11) UNSIGNED NOT NULL,
    `rank_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_guild_rank_id`)
);

CREATE TABLE `h_character_guild` (
    h_character_guild_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_guild_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `guild_id` int(11) UNSIGNED NOT NULL,
    `guild_leader` tinyint,
    PRIMARY KEY (`h_character_guild_id`)
);

CREATE TABLE `h_character_guild_rank` (
    h_character_guild_rank_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_guild_rank_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `guild_rank_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_character_guild_rank_id`)
);

CREATE TABLE `h_party` (
    h_party_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `party_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_party_id`)
);

CREATE TABLE `h_character_party` (
    h_character_party_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_party_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `party_id` int(11) UNSIGNED NOT NULL,
    `party_leader` tinyint,
    PRIMARY KEY (`h_character_party_id`)
);

CREATE TABLE `h_title` (
    h_title_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `title_id` int(11) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`h_title_id`)
);

CREATE TABLE `h_character_title` (
    h_character_title_id bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    h_action ENUM('create', 'update', 'delete'),
    h_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `character_title_id` int(11) UNSIGNED NOT NULL,
    `character_id` int(11) UNSIGNED NOT NULL,
    `title_id` int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`h_character_title_id`)
);
