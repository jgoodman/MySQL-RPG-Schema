#DATABASE#

##conf##
 - Columns
   - conf_id
   - name
   - value
 - Constraints
   - Primary Key
     - conf_id
   - Unique Key
     - conf_id
     - name

##user_type##
 - Columns
   - user_type_id
   - name
 - Constraints
   - Primary Key
     - user_type_id
 - Rows
   - name => 'admin',
   - name => 'moderator',
   - name => 'player',
   - name => 'spectator',

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
   - name => 'player',
   - name => 'non-playable',

##character##
 - Columns
   - character_id
   - character_type_id
   - name
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
     - character_type.character_type_id

##attribute##
 - Columns
   - attribute_id
   - name
   - desc
 - Constraints
   - Primary Key
     - attribute_id
 - Rows
   - name => 'strength',     desc => 'A measure of how physically strong a character is.',
   - name => 'constitution', desc => 'A measure of how resilient a character is.',
   - name => 'dexterity',    desc => 'A measure of how agile a character is.',
   - name => 'intelligence', desc => 'A measure of a character's problem-solving ability.',
   - name => 'charisma',     desc => 'A measure of a character's social skills, and sometimes their physical appearance.',
   - name => 'wisdom',       desc => 'A measure of a character's common sense and/or spirituality.',
   - name => 'willpower',    desc => 'A measure of the character's mental resistance.',
   - name => 'perception',   desc => 'A measure of a character's openness to their surroundings.',
   - name => 'luck',         desc => 'A measure of a character having chance to favor him or her.',

##character_attribute##
 - Columns
   - character_attribute_id
   - attribute_id
   - value
 - Constraints
   - Primary Key
     - character_attribute_id
   - Unique Keys
     - character_attribute_id, attribute_id
   - Foreign Keys
     - character_attribute.character_attribute_id

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
 - Constraints
   - Primary Key
     - item_id
   - Foreign Keys
     - item_type.item_type_id

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
   - name => 'head',
   - name => 'shoulder',
   - name => 'chest',
   - name => 'back',
   - name => 'wrist',
   - name => 'hands',
   - name => 'waist',
   - name => 'leg',
   - name => 'feet',
   - name => 'neck',
   - name => 'ears',
   - name => 'ring',
   - name => 'main_hand',
   - name => 'off_hand',

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

##ability##
 - Columns
   - ability_id
   - name

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
