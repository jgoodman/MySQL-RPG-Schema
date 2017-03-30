# MySQL-RPG-Schema

A database schema for role-playing games

# Description

This repo contains a database template that could be used when designing an RPG.

There is a possibility that this schema may not fit your exact needs, but it could be used as a jump off point to get you going. Hopefully, there is enough here where you can use most of it and modify the bits and peices you need.

The schema here is intended for a MySQL database.

You may want to take into consideration using either MyISAM or Innodb. Each have their advantages and disadvantages. I've considered making these Innodb, but decided to leave that out. If you have a preference on using a particular database engine, then you may need to modify the schema.


# Synopsis

The "create_tables.sql" file will have the database schema to the create tables.

The "create_history_tables.sql" file creates a history table for each table. Having history tables is intended to be optional hence being in a seperate file.


# Database Tables

Below is an overview on individual database tables.


## conf

Various configuration settings for your game *could* be held here.

Columns:
- conf_id
- name
- value


## user_type

Different user types that would be associated with a "user" (not to be confused with "characters").

Columns:
- user_type_id
- name

Rows:
- name:'admin',
- name:'moderator',
- name:'player',
- name:'spectator',


## user

This table holds the real world player information. Entries inside here are known as "users", which differ from "characters"

Columns:
- user_id
- user_type_id
- first_name
- last_name
- email
- password


## character_type

Different character types that are associated with a "character".

Columns:
- character_type_id
- name

Rows:
- name:'player',
- name:'non-playable',


## character

Records inside here would be characters in your game. This table includes playable and non-playable characters.

Columns:
- character_id
- character_type_id
- name
- alive
- level
- xp
- money


## user_character

This table links "users" to "characters". It is recomended that the character a user will associate with should have a character_type (SEE character_type) classifing the character as "player".

Columns:
- user_character_id
- user_id
- character_id


## attribute

A basic list of attributes.

See this [wiki article](http://en.wikipedia.org/wiki/Attribute_(role-playing_games)) in regards to rpg attributes.

Columns:
- attribute_id
- name
- desc

Initial rows inserted:
- name:'strength', desc:'A measure of how physically strong a character is.',
- name:'constitution', desc:'A measure of how resilient a character is.',
- name:'dexterity', desc:'A measure of how agile a character is.',
- name:'intelligence', desc:'A measure of a character''s problem-solving ability.',
- name:'charisma', desc:'A measure of a character''s social skills, and sometimes their physical appearance.',
- name:'wisdom', desc:'A measure of a character''s common sense and/or spirituality.',
- name:'willpower', desc:'A measure of the character''s mental resistance.',
- name:'perception', desc:'A measure of a character''s openness to their surroundings.',
- name:'luck', desc:'A measure of a character having chance to favor him or her.',
- name: 'damage', desc: 'A measure to inflict damage',


## character_attribute

This table associates attributes to characters.

Columns:
- character_attribute_id
- character_id
- attribute_id
- value


## place

Used by "location", This table holds a list of place names.

Columns:
- place_id
- name


## location

A list of x and y coordinates. Each record will be associated with a "place" (SEE "place" TABLE). You can have multiple location records that are of the same place.

Columns:
- location_id
- x
- y
- place_id


## character_location

A list reporting where characters are at.

Columns:
- character_location_id
- character_id
- location_id


## item_type

Different item types held here.

Columns:
- item_type_id
- name
- desc


## item

An object that characters can use in some way.

Columns:
- item_id
- item_type_id
- name


## item_attribute

This table associates items with attributes. These attributes are intended to be added to character attributes.

Columns:
- item_attribute_id
- item_id
- attribute_id
- value


## item_location

A list of item locations. It is intended that if a character has an item on them, then the item will not be in this table.

Columns:
- item_location_id
- item_id
- location_id


## character_item

The "character inventory", what the character has on them or perhaps in a backpack of sorts. If an item is equiped, then it is not intended to be in here. However, it is possible to have equipped items in here also.

Columns:
- character_item_id
- character_id
- item_id


## equipment_slot

A list of possible slots where items can be equiped to.

Columns:
- equipment_slot_id
- name

Initial rows inserted:
- name:'head',
- name:'shoulder',
- name:'chest',
- name:'back',
- name:'wrist',
- name:'hands',
- name:'waist',
- name:'leg',
- name:'feet',
- name:'neck',
- name:'ears',
- name:'ring',
- name:'main_hand',
- name:'off_hand',


## character_equipment

A list of items that are equiped to characters.

Columns:
- character_equipment_id
- equipment_slot_id
- character_id
- item_id


## class

A list of classes that characters can be. 

See this [wiki article](http://en.wikipedia.org/wiki/Character_class) in regards to what rpg classes are and the different types.

Columns:
- class_id
- name


## character_class

This table associates characters to a class (SEE "class" TABLE)

Columns:
- character_class_id
- character_id
- class_id


## ability_type

Different ability types held here (SEE "ability" TABLE).

Columns:
- ability_type_id
- name
- desc


## ability

An ability is like a special action, spell, or possible talent that characters can perform in combat.

Columns:
- ability_id
- name
- ability_type_id


## class_ability

This table associates what class can do an ability.

Columns:
- class_ability_id
- class_id
- ability_id


## effect_type

Different effect types held here.

Columns:
- effect_type_id
- name
- desc

Rows:
- name:'buff', desc:'A temporary benefit to a character’s attributes',
- name:'debuff', desc:'A temporary hindrance to a character’s attributes',


## status_effect

A "status effect" is usually some temporary advantage or hindrance given to a character by some mean, perhaps from an ability, an item, or being at some place.

See this [wiki article](http://en.wikipedia.org/wiki/Status_effect) in regards to what rpg status effects are and examples.

Columns:
- status_effect_id
- name
- effect_type_id
- duration
- desc


## character_status_effect

This table associates current status effects are on character.

Columns:
- character_status_effect_id
- character_id
- status_effect_id
- date


## loot

This table lists the possible loot that can be gained.

Columns:
- loot_id
- xp
- money


## character_loot

This table associates loot awarded when defeating a specific character.

Columns:
- character_loot_id
- loot_id
- character_id


## item_loot

This table associates items awarded when receiving a particular loot.

The "drop_chance" column sets the chance of receiving this item. This column is intended to be a decimal number between 0 to 1 as a way to represent a percentage.

Columns:
- item_loot_id
- loot_id
- item_id
- drop_chance


## entity_type

A list of basic types associated with entities.

Columns:
- entity_type_id
- name


## entity

An "entity" is an alternative to the "non-playable" character type. This table is intended to have various non playable characters in your game. These could be friendly or hostile to players. They can be ugly monsters or beautiful human. It is really up to you if you want to use this table or how you want to use it.

Columns:
- entity_id
- entity_type_id
- name
- level


## entity_attribute

Associates an attribute to an entity.

Columns:
- entity_attribute_id
- entity_id
- attribute_id
- value


## entity_location

Gives an entity a location.

Columns:
- entity_location_id
- entity_id
- location_id


## entity_class

Assign an entity to a class.

Columns:
- entity_class_id
- entity_id
- class_id


## entity_status_effect

Associates a current status effect with an entity (SEE "status_effect" TABLE)

Columns:
- entity_status_effect_id
- entity_id
- status_effect_id
- date


## entity_loot

Associates loot awarded when defeating a specific entity.

Columns:
- entity_loot_id
- loot_id
- entity_id


## faction

A global and permenant group of characters ("playable" or "non-playable") and entities that share some idea. That idea could be political, religious, cultural, spiritual, or something different entirely.

Columns:
- faction_id
- name


## character_faction

Associates a character to a faction.

Columns:
- character_faction_id
- character_id
- faction_id


## entity_faction

Associates an entity to a faction.

Columns:
- entity_faction_id
- entity_id
- faction_id


## rank

A list of generic rank names.

Columns:
- guild_id
- name


## guild

A global and permenant group of playable characters working together.

Columns:
- guild_id
- name


## guild_rank

A list of ranks associated to a particular guild.

Columns:
- guild_rank_id
- guild_id
- rank_id


## character_guild

Associates a character to a guild.

Columns:
- character_guild_id
- character_id
- guild_id
- guild_leader


## character_guild_rank

Associates a character to a guild_rank.

Columns:
- character_guild_rank_id
- character_id
- guild_rank_id


## party

A small and likely temporary group of players trying to accomplish an objective.

Columns:
- party_id


## character_party

Associates a character to a party.

Columns:
- character_party_id
- character_id
- party_id
- party_leader


## title

A list of titles.

Columns
- title_id
- name


## character_title

Associates a character to a title.

Columns
- character_title_id
- character_id
- title_id

