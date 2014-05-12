#DATABASE#

##conf##
 - Columns
   - conf_id
   - name
   - value
 - Constraints
   - Primary Key
     - conf_id
   - Unique Keys
     - name

##user_type##
 - Columns
   - user_type_id
   - name
 - Constraints
   - Primary Key
     - user_type_id
 - Rows
   - name:'admin',
   - name:'moderator',
   - name:'player',
   - name:'spectator',

##user##
 - Columns
   - user_id
   - user_type_id
   - first_name
   - last_name
   - email
   - password
 - Constraints
   - Primary Key
     - user_id
   - Foreign Keys
     - user_type.user_type_id

##character_type##
 - Columns
   - character_type_id
   - name
 - Constraints
   - Primary Key
     - character_type_id
 - Rows
   - name:'player',
   - name:'non-playable',

##character##
 - Columns
   - character_id
   - character_type_id
   - name
   - alive
   - level
   - xp
   - money
 - Constraints
   - Primary Key
     - character_id
   - Foreign Keys
     - character_type.character_type_id

##user_character##
 - Columns
   - user_character_id
   - user_id
   - character_id
 - Constraints
   - Primary Key
     - user_character_id
   - Unique Keys
     - user_id, character_id
   - Foreign Keys
     - user.user_id
     - character.character_id

##attribute##
 - Columns
   - attribute_id
   - name
   - desc
 - Constraints
   - Primary Key
     - attribute_id
 - Rows
   - name:'strength', desc:'A measure of how physically strong a character is.',
   - name:'constitution', desc:'A measure of how resilient a character is.',
   - name:'dexterity', desc:'A measure of how agile a character is.',
   - name:'intelligence', desc:'A measure of a character''s problem-solving ability.',
   - name:'charisma', desc:'A measure of a character''s social skills, and sometimes their physical appearance.',
   - name:'wisdom', desc:'A measure of a character''s common sense and/or spirituality.',
   - name:'willpower', desc:'A measure of the character''s mental resistance.',
   - name:'perception', desc:'A measure of a character''s openness to their surroundings.',
   - name:'luck', desc:'A measure of a character having chance to favor him or her.',
   - name:'damage', desc: 'A measure to inflict damage',

##character_attribute##
 - Columns
   - character_attribute_id
   - character_id
   - attribute_id
   - value
 - Constraints
   - Primary Key
     - character_attribute_id
   - Unique Keys
     - character_id, attribute_id
   - Foreign Keys
     - character.character_id
     - attribute.attribute_id

##place##
 - Columns
   - place_id
   - name
 - Constraints
   - Primary Key
     - place_id

##location##
 - Columns
   - location_id
   - x
   - y
   - place_id
 - Constraints
   - Primary Key
     - location_id
   - Unique Keys
     - x, y
   - Foreign Keys
     - place.place_id

##character_location##
 - Columns
   - character_location_id
   - character_id
   - location_id
 - Constraints
   - Primary Key
     - character_location_id
   - Unique Keys
     - character_id
   - Foreign Keys
     - character.character_id
     - location.location_id

##item_type##
 - Columns
   - item_type_id
   - name
   - desc
 - Constraints
   - Primary Key
     - item_type_id

##item##
 - Columns
   - item_id
   - item_type_id
   - name
   - required_level
   - durability
 - Constraints
   - Primary Key
     - item_id
   - Foreign Keys
     - item_type.item_type_id

##item_attribute##
 - Columns
   - item_attribute_id
   - item_id
   - attribute_id
   - value
 - Constraints
   - Primary Key
     - item_attribute_id
   - Unique Keys
     - item_id, attribute_id
   - Foreign Keys
     - item.item_id
     - attribute.attribute_id

##item_location##
 - Columns
   - item_location_id
   - item_id
   - location_id
 - Constraints
   - Primary Key
     - item_location_id
   - Unique Keys
     - item_id
   - Foreign Keys
     - item.item_id
     - location.location_id

##character_item##
 - Columns
   - character_item_id
   - character_id
   - item_id
 - Constraints
   - Primary Key
     - character_item_id
   - Unique Keys
     - character_id, item_id
   - Foreign Keys
     - character.character_id
     - item.item_id

##equipment_slot##
 - Columns
   - equipment_slot_id
   - name
 - Constraints
   - Primary Key
     - equipment_slot_id
   - Unique Keys
     - name
 - Rows
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

##character_equipment##
 - Columns
   - character_equipment_id
   - equipment_slot_id
   - character_id
   - item_id
 - Constraints
   - Primary Key
     - equipment_slot_id
   - Unique Keys
     - equipment_slot_id, character_id
   - Foreign Keys
     - equipment_slot.equipment_slot_id
     - character.character_id
     - item.item_id

##class##
 - Columns
   - class_id
   - name
 - Constraints
   - Primary Key
     - class_id
   - Unique Keys
     - name

##character_class##
 - Columns
   - character_class_id
   - character_id
   - class_id
 - Constraints
   - Primary Key
     - character_class_id
   - Unique Keys
     - character_id
   - Foreign Keys
     - character.character_id
     - class.class_id

##ability_type##
 - Columns
   - ability_type_id
   - name
   - desc
 - Constraints
   - Primary Key
     - ability_type_id

##ability##
 - Columns
   - ability_id
   - name
   - ability_type_id
   - required_level
 - Constraints
   - Primary Key
     - ability_id
   - Foreign Keys
     - ability.ability_type_id

##class_ability##
 - Columns
   - class_ability_id
   - class_id
   - ability_id
 - Constraints
   - Primary Key
     - class_ability_id
   - Unique Keys
     - class_id, ability_id
   - Foreign Keys
     - class.class_id
     - ability.ability_id

##effect_type##
 - Columns
   - effect_type_id
   - name
   - desc
 - Constraints
   - Primary Key
     - effect_type_id
 - Rows
   - name:'buff', desc:'A temporary benefit to a character’s attributes',
   - name:'debuff', desc:'A temporary hindrance to a character’s attributes',

##status_effect##
 - Columns
   - status_effect_id
   - name
   - effect_type_id
   - duration
   - desc
 - Constraints
   - Primary Key
     - status_effect_id
   - Foreign Keys
     - effect_type.effect_type_id

##character_status_effect##
 - Columns
   - character_status_effect_id
   - character_id
   - status_effect_id
   - date
 - Constraints
   - Primary Key
     - character_status_effect_id
   - Foreign Keys
     - status_effect.status_effect_id
     - character.character_id

##loot##
 - Columns
   - loot_id
   - xp
   - money
 - Constraints
   - Primary Key
     - loot_id

##character_loot##
 - Columns
   - character_loot_id
   - loot_id
   - character_id
 - Constraints
   - Primary Key
     - character_loot_id
   - Foreign Keys
     - loot.loot_id
     - character.character_id

##item_loot##
 - Columns
   - item_loot_id
   - loot_id
   - item_id
   - drop_chance
 - Constraints
   - Primary Key
     - item_loot_id
   - Foreign Keys
     - loot.loot_id
     - item.item_id

##entity_type##
 - Columns
   - entity_type_id
   - name
 - Constraints
   - Primary Key
     - entity_type_id

##entity##
 - Columns
   - entity_id
   - entity_type_id
   - name
   - level
 - Constraints
   - Primary Key
     - entity_id
   - Foreign Keys
     - entity_type.entity_type_id

##entity_attribute##
 - Columns
   - entity_attribute_id
   - entity_id
   - attribute_id
   - value
 - Constraints
   - Primary Key
     - entity_attribute_id
   - Unique Keys
     - entity_id, attribute_id
   - Foreign Keys
     - entity.entity_id
     - attribute.attribute_id

##entity_location##
 - Columns
   - entity_location_id
   - entity_id
   - location_id
 - Constraints
   - Primary Key
     - entity_location_id
   - Unique Keys
     - entity_id
   - Foreign Keys
     - entity.entity_id
     - location.location_id

##entity_class##
 - Columns
   - entity_class_id
   - entity_id
   - class_id
 - Constraints
   - Primary Key
     - entity_class_id
   - Unique Keys
     - entity_id
   - Foreign Keys
     - entity.entity_id
     - class.class_id

##entity_status_effect##
 - Columns
   - entity_status_effect_id
   - entity_id
   - status_effect_id
   - date
 - Constraints
   - Primary Key
     - entity_status_effect_id
   - Foreign Keys
     - status_effect.status_effect_id
     - entity.entity_id

##entity_loot##
 - Columns
   - entity_loot_id
   - loot_id
   - entity_id
 - Constraints
   - Primary Key
     - entity_loot_id
   - Foreign Keys
     - loot.loot_id
     - entity.entity_id

##faction##
 - Columns
   - faction_id
   - name
 - Constraints
   - Primary Key
     - faction_id

##character_faction##
 - Columns
   - character_faction_id
   - character_id
   - faction_id
 - Constraints
   - Primary Key
     - character_faction_id
   - Foreign Keys
     - character.character_id
     - faction.faction_id

##entity_faction##
 - Columns
   - entity_faction_id
   - entity_id
   - faction_id
 - Constraints
   - Primary Key
     - entity_faction_id
   - Foreign Keys
     - entity.entity_id
     - faction.faction_id

##rank##
 - Columns
   - guild_id
   - name
 - Constraints
   - Primary Key
     - guild_id

##guild##
 - Columns
   - guild_id
   - name
 - Constraints
   - Primary Key
     - guild_id

##guild_rank##
 - Columns
   - guild_rank_id
   - guild_id
   - rank_id
 - Constraints
   - Primary Key
     - guild_rank_id
   - Unique Keys
     - guild_id, rank_id
   - Foreign Keys
     - guild.guild_id
     - rank.rank_id

##character_guild##
 - Columns
   - character_guild_id
   - character_id
   - guild_id
   - guild_leader
 - Constraints
   - Primary Key
     - character_guild_id
   - Unique Keys
     - guild_id, guild_leader
   - Foreign Keys
     - character.character_id
     - guild.guild_id

##character_guild_rank##
 - Columns
   - character_guild_rank_id
   - character_id
   - guild_rank_id
 - Constraints
   - Primary Key
     - character_guild_rank_id
   - Unique Keys
     - character_id, guild_rank_id
   - Foreign Keys
     - character.character_id
     - guild_rank.guild_rank_id

##party##
 - Columns
   - party_id
 - Constraints
   - Primary Key
     - party_id

##character_party##
 - Columns
   - character_party_id
   - character_id
   - party_id
   - party_leader
 - Constraints
   - Primary Key
     - character_party_id
   - Unique Keys
     - character_id
     - party_id, party_leader
   - Foreign Keys
     - character.character_id
     - party.party_id

##title##
 - Columns
   - title_id
   - name
 - Constraints
   - Primary Key
     - title_id

##character_title##
 - Columns
   - character_title_id
   - character_id
   - title_id
 - Constraints
   - Primary Key
     - character_title_id
   - Foreign Keys
     - character.character_id
     - title.title_id

