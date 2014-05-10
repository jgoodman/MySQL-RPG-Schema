CREATE TABLE `conf` (
    `conf_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    `value` varchar(255),
    PRIMARY KEY (`conf_id`),
    CONSTRAINT `uk_name` UNIQUE (`name`)
);

CREATE TABLE `user_type` (
    `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    PRIMARY KEY (`user_type_id`)
);

INSERT INTO `user_type` (`name`) VALUES ('admin');
INSERT INTO `user_type` (`name`) VALUES ('moderator');
INSERT INTO `user_type` (`name`) VALUES ('player');
INSERT INTO `user_type` (`name`) VALUES ('spectator');

CREATE TABLE `user` (
    `user_id` int(11) NOT NULL AUTO_INCREMENT,
    `user_type_id` int(11),
    `first_name` varchar(255),
    `last_name` varchar(255),
    `email` varchar(255),
    `password` varchar(255),
    PRIMARY KEY (`user_id`),
    CONSTRAINT `fk_user_user_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `user_type`(`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `character_type` (
    `character_type_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    PRIMARY KEY (`character_type_id`)
);

INSERT INTO `character_type` (`name`) VALUES ('player');
INSERT INTO `character_type` (`name`) VALUES ('non-playable');

CREATE TABLE `character` (
    `character_id` int(11) NOT NULL AUTO_INCREMENT,
    `character_type_id` int(11),
    `name` varchar(255),
    PRIMARY KEY (`character_id`),
    CONSTRAINT `fk_character_character_type_id` FOREIGN KEY (`character_type_id`) REFERENCES `character_type`(`character_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `user_character` (
    `user_character_id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11),
    `character_id` int(11),
    PRIMARY KEY (`user_character_id`),
    CONSTRAINT `uk_user_id_character_id` UNIQUE (`user_id`, `character_id`),
    CONSTRAINT `fk_user_character_user_id` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_character_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `attribute` (
    `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
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
    `character_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
    `character_id` int(11),
    `attribute_id` int(11),
    `value` varchar(255),
    PRIMARY KEY (`character_attribute_id`),
    CONSTRAINT `uk_character_id_attribute_id` UNIQUE (`character_id`, `attribute_id`),
    CONSTRAINT `fk_character_attribute_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_attribute_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute`(`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `place` (
    `place_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    PRIMARY KEY (`place_id`)
);

CREATE TABLE `location` (
    `location_id` int(11) NOT NULL AUTO_INCREMENT,
    `x` varchar(255),
    `y` varchar(255),
    `place_id` int(11),
    PRIMARY KEY (`location_id`),
    CONSTRAINT `uk_x_y` UNIQUE (`x`, `y`),
    CONSTRAINT `fk_location_place_id` FOREIGN KEY (`place_id`) REFERENCES `place`(`place_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `character_location` (
    `character_location_id` int(11) NOT NULL AUTO_INCREMENT,
    `character_id` int(11),
    `location_id` int(11),
    PRIMARY KEY (`character_location_id`),
    CONSTRAINT `uk_character_id` UNIQUE (`character_id`),
    CONSTRAINT `fk_character_location_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_location_location_id` FOREIGN KEY (`location_id`) REFERENCES `location`(`location_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `item_type` (
    `item_type_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    `desc` varchar(255),
    PRIMARY KEY (`item_type_id`)
);

CREATE TABLE `item` (
    `item_id` int(11) NOT NULL AUTO_INCREMENT,
    `item_type_id` int(11),
    `name` varchar(255),
    PRIMARY KEY (`item_id`),
    CONSTRAINT `fk_item_item_type_id` FOREIGN KEY (`item_type_id`) REFERENCES `item_type`(`item_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `item_attribute` (
    `item_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
    `item_id` int(11),
    `attribute_id` int(11),
    `value` varchar(255),
    PRIMARY KEY (`item_attribute_id`),
    CONSTRAINT `uk_item_id_attribute_id` UNIQUE (`item_id`, `attribute_id`),
    CONSTRAINT `fk_item_attribute_item_id` FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_item_attribute_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute`(`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `item_location` (
    `item_location_id` int(11) NOT NULL AUTO_INCREMENT,
    `item_id` int(11),
    `location_id` int(11),
    PRIMARY KEY (`item_location_id`),
    CONSTRAINT `uk_item_id` UNIQUE (`item_id`),
    CONSTRAINT `fk_item_location_item_id` FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_item_location_location_id` FOREIGN KEY (`location_id`) REFERENCES `location`(`location_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `character_item` (
    `character_item_id` int(11) NOT NULL AUTO_INCREMENT,
    `character_id` int(11),
    `item_id` int(11),
    PRIMARY KEY (`character_item_id`),
    CONSTRAINT `uk_character_id_item_id` UNIQUE (`character_id`, `item_id`),
    CONSTRAINT `fk_character_item_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_item_item_id` FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `equipment_slot` (
    `equipment_slot_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
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
    `character_equipment_id` int(11),
    `equipment_slot_id` int(11) NOT NULL AUTO_INCREMENT,
    `character_id` int(11),
    `item_id` int(11),
    PRIMARY KEY (`equipment_slot_id`),
    CONSTRAINT `uk_equipment_slot_id_character_id` UNIQUE (`equipment_slot_id`, `character_id`),
    CONSTRAINT `fk_character_equipment_equipment_slot_id` FOREIGN KEY (`equipment_slot_id`) REFERENCES `equipment_slot`(`equipment_slot_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_equipment_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_equipment_item_id` FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `class` (
    `class_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    PRIMARY KEY (`class_id`),
    CONSTRAINT `uk_name` UNIQUE (`name`)
);

CREATE TABLE `character_class` (
    `character_class_id` int(11) NOT NULL AUTO_INCREMENT,
    `character_id` int(11),
    `class_id` int(11),
    PRIMARY KEY (`character_class_id`),
    CONSTRAINT `uk_character_id` UNIQUE (`character_id`),
    CONSTRAINT `fk_character_class_character_id` FOREIGN KEY (`character_id`) REFERENCES `character`(`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_character_class_class_id` FOREIGN KEY (`class_id`) REFERENCES `class`(`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `ability_type` (
    `ability_type_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    `desc` varchar(255),
    PRIMARY KEY (`ability_type_id`)
);

CREATE TABLE `ability` (
    `ability_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    `ability_type_id` int(11),
    PRIMARY KEY (`ability_id`),
    CONSTRAINT `fk_ability_ability_type_id` FOREIGN KEY (`ability_type_id`) REFERENCES `ability`(`ability_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `class_ability` (
    `class_ability_id` int(11) NOT NULL AUTO_INCREMENT,
    `class_id` int(11),
    `ability_id` int(11),
    PRIMARY KEY (`class_ability_id`),
    CONSTRAINT `uk_class_id_ability_id` UNIQUE (`class_id`, `ability_id`),
    CONSTRAINT `fk_class_ability_class_id` FOREIGN KEY (`class_id`) REFERENCES `class`(`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_class_ability_ability_id` FOREIGN KEY (`ability_id`) REFERENCES `ability`(`ability_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
