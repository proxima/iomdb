# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101013053626) do

  create_table "admin_users", :force => true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.string   "email"
    t.string   "salt"
    t.datetime "created_at"
  end

  create_table "alignment_level_versions", :force => true do |t|
    t.integer  "alignment_level_id", :limit => 11
    t.integer  "version",            :limit => 11
    t.string   "name"
    t.integer  "level",              :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alignment_level_versions", ["alignment_level_id"], :name => "index_alignment_level_versions_on_alignment_level_id"

  create_table "alignment_levels", :force => true do |t|
    t.string   "name"
    t.integer  "level",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  create_table "armor_class_level_versions", :force => true do |t|
    t.integer  "armor_class_level_id", :limit => 11
    t.integer  "version",              :limit => 11
    t.string   "name"
    t.integer  "level",                :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "armor_class_level_versions", ["armor_class_level_id"], :name => "index_armor_class_level_versions_on_armor_class_level_id"

  create_table "armor_class_levels", :force => true do |t|
    t.string   "name"
    t.integer  "level",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  create_table "damage_level_versions", :force => true do |t|
    t.integer  "damage_level_id", :limit => 11
    t.integer  "version",         :limit => 11
    t.string   "name"
    t.integer  "level",           :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "damage_level_versions", ["damage_level_id"], :name => "index_damage_level_versions_on_damage_level_id"

  create_table "damage_levels", :force => true do |t|
    t.string   "name"
    t.integer  "level",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  create_table "damage_type_versions", :force => true do |t|
    t.integer  "damage_type_id", :limit => 11
    t.integer  "version",        :limit => 11
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "damage_type_versions", ["damage_type_id"], :name => "index_damage_type_versions_on_damage_type_id"

  create_table "damage_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  create_table "equipment_mob_strategies", :force => true do |t|
    t.integer  "equipment_monster_id",  :limit => 11
    t.integer  "greater_tank_prot_id",  :limit => 11
    t.integer  "lesser_tank_prot1_id",  :limit => 11
    t.integer  "lesser_tank_prot2_id",  :limit => 11
    t.integer  "greater_party_prot_id", :limit => 11
    t.integer  "lesser_party_prot1_id", :limit => 11
    t.integer  "lesser_party_prot2_id", :limit => 11
    t.text     "additional_prot_info"
    t.text     "walkthrough"
    t.boolean  "quest_mob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "fight_notes"
  end

  create_table "equipment_monster_versions", :force => true do |t|
    t.integer  "equipment_monster_id", :limit => 11
    t.integer  "version",              :limit => 11
    t.string   "name"
    t.text     "walkthrough"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "equipment_monster_versions", ["equipment_monster_id"], :name => "index_equipment_monster_versions_on_equipment_monster_id"

  create_table "equipment_monsters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  add_index "equipment_monsters", ["id", "name"], :name => "index_equipment_monsters_on_id_and_name"

  create_table "equipment_piece_list_entries", :force => true do |t|
    t.integer  "equipment_piece_id",      :limit => 11
    t.integer  "equipment_piece_list_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "equipment_piece_list_entries", ["equipment_piece_list_id"], :name => "index_equipment_piece_list_entries_on_equipment_piece_list_id"

  create_table "equipment_piece_lists", :force => true do |t|
    t.string   "name"
    t.integer  "admin_user_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment_piece_versions", :force => true do |t|
    t.integer  "equipment_piece_id",   :limit => 11
    t.integer  "version",              :limit => 11
    t.string   "name"
    t.integer  "equipment_monster_id", :limit => 11
    t.integer  "klass",                :limit => 11
    t.integer  "weight",               :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "special"
    t.integer  "tp_value",             :limit => 11
  end

  add_index "equipment_piece_versions", ["equipment_piece_id"], :name => "index_equipment_piece_versions_on_equipment_piece_id"

  create_table "equipment_pieces", :force => true do |t|
    t.string   "name"
    t.integer  "equipment_monster_id", :limit => 11
    t.integer  "klass",                :limit => 11
    t.integer  "weight",               :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "special"
    t.integer  "tp_value",             :limit => 11
    t.integer  "version",              :limit => 11
  end

  add_index "equipment_pieces", ["id", "name"], :name => "index_equipment_pieces_on_id_and_name"

  create_table "guild_type_versions", :force => true do |t|
    t.integer  "guild_type_id", :limit => 11
    t.integer  "version",       :limit => 11
    t.string   "name"
    t.integer  "level",         :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guild_type_versions", ["guild_type_id"], :name => "index_guild_type_versions_on_guild_type_id"

  create_table "guild_types", :force => true do |t|
    t.string   "name"
    t.integer  "level",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  create_table "guild_versions", :force => true do |t|
    t.integer  "guild_id",      :limit => 11
    t.integer  "version",       :limit => 11
    t.string   "name"
    t.integer  "guild_type_id", :limit => 11
    t.text     "location"
    t.integer  "levels",        :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guild_versions", ["guild_id"], :name => "index_guild_versions_on_guild_id"

  create_table "guilds", :force => true do |t|
    t.string   "name"
    t.integer  "guild_type_id", :limit => 11
    t.text     "location"
    t.integer  "levels",        :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",       :limit => 11
  end

  add_index "guilds", ["id", "name"], :name => "index_guilds_on_id_and_name"

  create_table "hunger_level_versions", :force => true do |t|
    t.integer  "hunger_level_id", :limit => 11
    t.integer  "version",         :limit => 11
    t.string   "name"
    t.integer  "level",           :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hunger_level_versions", ["hunger_level_id"], :name => "index_hunger_level_versions_on_hunger_level_id"

  create_table "hunger_levels", :force => true do |t|
    t.string   "name"
    t.integer  "level",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  create_table "race_versions", :force => true do |t|
    t.integer  "race_id",             :limit => 11
    t.integer  "version",             :limit => 11
    t.string   "name"
    t.integer  "strength",            :limit => 11
    t.integer  "dexterity",           :limit => 11
    t.integer  "constitution",        :limit => 11
    t.integer  "intelligence",        :limit => 11
    t.integer  "wisdom",              :limit => 11
    t.integer  "stamina",             :limit => 11
    t.integer  "charisma",            :limit => 11
    t.integer  "hpregen",             :limit => 11
    t.integer  "spregen",             :limit => 11
    t.integer  "epregen",             :limit => 11
    t.integer  "skill_max",           :limit => 11
    t.integer  "spell_max",           :limit => 11
    t.integer  "skill_rate",          :limit => 10
    t.integer  "spell_rate",          :limit => 10
    t.integer  "experience_rate",     :limit => 10
    t.boolean  "need_dark_to_regen"
    t.boolean  "need_light_to_regen"
    t.boolean  "corpse_eating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "average_height",      :limit => 11
    t.integer  "average_weight",      :limit => 11
    t.text     "description"
  end

  add_index "race_versions", ["race_id"], :name => "index_race_versions_on_race_id"

  create_table "races", :force => true do |t|
    t.string   "name"
    t.integer  "strength",            :limit => 11
    t.integer  "dexterity",           :limit => 11
    t.integer  "constitution",        :limit => 11
    t.integer  "intelligence",        :limit => 11
    t.integer  "wisdom",              :limit => 11
    t.integer  "stamina",             :limit => 11
    t.integer  "charisma",            :limit => 11
    t.integer  "hpregen",             :limit => 11
    t.integer  "spregen",             :limit => 11
    t.integer  "epregen",             :limit => 11
    t.integer  "skill_max",           :limit => 11
    t.integer  "spell_max",           :limit => 11
    t.integer  "skill_rate",          :limit => 10, :precision => 10, :scale => 0
    t.integer  "spell_rate",          :limit => 10, :precision => 10, :scale => 0
    t.integer  "experience_rate",     :limit => 10, :precision => 10, :scale => 0
    t.boolean  "need_dark_to_regen"
    t.boolean  "need_light_to_regen"
    t.boolean  "corpse_eating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "average_height",      :limit => 11
    t.integer  "average_weight",      :limit => 11
    t.text     "description"
    t.integer  "version",             :limit => 11
  end

  create_table "resistance_affect_versions", :force => true do |t|
    t.integer  "resistance_affect_id", :limit => 11
    t.integer  "version",              :limit => 11
    t.integer  "equipment_piece_id",   :limit => 11
    t.integer  "damage_type_id",       :limit => 11
    t.integer  "value",                :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resistance_affect_versions", ["resistance_affect_id"], :name => "index_resistance_affect_versions_on_resistance_affect_id"

  create_table "resistance_affects", :force => true do |t|
    t.integer  "equipment_piece_id", :limit => 11
    t.integer  "damage_type_id",     :limit => 11
    t.integer  "value",              :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",            :limit => 11
  end

  add_index "resistance_affects", ["id", "equipment_piece_id"], :name => "index_resistance_affects_on_id_and_equipment_piece_id"

  create_table "skill_affect_versions", :force => true do |t|
    t.integer  "skill_affect_id",    :limit => 11
    t.integer  "version",            :limit => 11
    t.integer  "equipment_piece_id", :limit => 11
    t.integer  "skill_id",           :limit => 11
    t.integer  "value",              :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skill_affect_versions", ["skill_affect_id"], :name => "index_skill_affect_versions_on_skill_affect_id"

  create_table "skill_affects", :force => true do |t|
    t.integer  "equipment_piece_id", :limit => 11
    t.integer  "skill_id",           :limit => 11
    t.integer  "value",              :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",            :limit => 11
  end

  add_index "skill_affects", ["id", "equipment_piece_id"], :name => "index_skill_affects_on_id_and_equipment_piece_id"

  create_table "skill_train_spec_versions", :force => true do |t|
    t.integer  "skill_train_spec_id", :limit => 11
    t.integer  "version",             :limit => 11
    t.integer  "skill_id",            :limit => 11
    t.integer  "guild_id",            :limit => 11
    t.integer  "level",               :limit => 11
    t.integer  "max",                 :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skill_train_spec_versions", ["skill_train_spec_id"], :name => "index_skill_train_spec_versions_on_skill_train_spec_id"

  create_table "skill_train_specs", :force => true do |t|
    t.integer  "skill_id",   :limit => 11
    t.integer  "guild_id",   :limit => 11
    t.integer  "level",      :limit => 11
    t.integer  "max",        :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  create_table "skill_versions", :force => true do |t|
    t.integer  "skill_id",   :limit => 11
    t.integer  "version",    :limit => 11
    t.string   "name"
    t.integer  "base_cost",  :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skill_versions", ["skill_id"], :name => "index_skill_versions_on_skill_id"

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.integer  "base_cost",  :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  add_index "skills", ["id", "name"], :name => "index_skills_on_id_and_name"

  create_table "slot_affect_versions", :force => true do |t|
    t.integer  "slot_affect_id",     :limit => 11
    t.integer  "version",            :limit => 11
    t.integer  "slot_id",            :limit => 11
    t.integer  "equipment_piece_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slot_affect_versions", ["slot_affect_id"], :name => "index_slot_affect_versions_on_slot_affect_id"

  create_table "slot_affects", :force => true do |t|
    t.integer  "slot_id",            :limit => 11
    t.integer  "equipment_piece_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",            :limit => 11
  end

  add_index "slot_affects", ["id", "equipment_piece_id"], :name => "index_slot_affects_on_id_and_equipment_piece_id"

  create_table "slot_versions", :force => true do |t|
    t.integer  "slot_id",      :limit => 11
    t.integer  "version",      :limit => 11
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbreviation"
  end

  add_index "slot_versions", ["slot_id"], :name => "index_slot_versions_on_slot_id"

  create_table "slots", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",      :limit => 11
    t.string   "abbreviation"
  end

  create_table "spell_affect_versions", :force => true do |t|
    t.integer  "spell_affect_id",    :limit => 11
    t.integer  "version",            :limit => 11
    t.integer  "equipment_piece_id", :limit => 11
    t.integer  "spell_id",           :limit => 11
    t.integer  "value",              :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spell_affect_versions", ["spell_affect_id"], :name => "index_spell_affect_versions_on_spell_affect_id"

  create_table "spell_affects", :force => true do |t|
    t.integer  "equipment_piece_id", :limit => 11
    t.integer  "spell_id",           :limit => 11
    t.integer  "value",              :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",            :limit => 11
  end

  add_index "spell_affects", ["id", "equipment_piece_id"], :name => "index_spell_affects_on_id_and_equipment_piece_id"

  create_table "spell_train_spec_versions", :force => true do |t|
    t.integer  "spell_train_spec_id", :limit => 11
    t.integer  "version",             :limit => 11
    t.integer  "spell_id",            :limit => 11
    t.integer  "guild_id",            :limit => 11
    t.integer  "level",               :limit => 11
    t.integer  "max",                 :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spell_train_spec_versions", ["spell_train_spec_id"], :name => "index_spell_train_spec_versions_on_spell_train_spec_id"

  create_table "spell_train_specs", :force => true do |t|
    t.integer  "spell_id",   :limit => 11
    t.integer  "guild_id",   :limit => 11
    t.integer  "level",      :limit => 11
    t.integer  "max",        :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  create_table "spell_versions", :force => true do |t|
    t.integer  "spell_id",   :limit => 11
    t.integer  "version",    :limit => 11
    t.string   "name"
    t.integer  "base_cost",  :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spell_versions", ["spell_id"], :name => "index_spell_versions_on_spell_id"

  create_table "spells", :force => true do |t|
    t.string   "name"
    t.integer  "base_cost",  :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  add_index "spells", ["id", "name"], :name => "index_spells_on_id_and_name"

  create_table "stat_affect_versions", :force => true do |t|
    t.integer  "stat_affect_id",     :limit => 11
    t.integer  "version",            :limit => 11
    t.integer  "equipment_piece_id", :limit => 11
    t.integer  "stat_id",            :limit => 11
    t.integer  "value",              :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stat_affect_versions", ["stat_affect_id"], :name => "index_stat_affect_versions_on_stat_affect_id"

  create_table "stat_affects", :force => true do |t|
    t.integer  "equipment_piece_id", :limit => 11
    t.integer  "stat_id",            :limit => 11
    t.integer  "value",              :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",            :limit => 11
  end

  add_index "stat_affects", ["id", "equipment_piece_id"], :name => "index_stat_affects_on_id_and_equipment_piece_id"

  create_table "stat_level_versions", :force => true do |t|
    t.integer  "stat_level_id", :limit => 11
    t.integer  "version",       :limit => 11
    t.string   "name"
    t.integer  "level",         :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stat_level_versions", ["stat_level_id"], :name => "index_stat_level_versions_on_stat_level_id"

  create_table "stat_levels", :force => true do |t|
    t.string   "name"
    t.integer  "level",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

  create_table "stat_versions", :force => true do |t|
    t.integer  "stat_id",      :limit => 11
    t.integer  "version",      :limit => 11
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stat_versions", ["stat_id"], :name => "index_stat_versions_on_stat_id"

  create_table "stats", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",      :limit => 11
  end

  create_table "weapon_damage_affects", :force => true do |t|
    t.integer  "equipment_piece_id",     :limit => 11
    t.integer  "weapon_damage_level_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "damage_type_id",         :limit => 11
  end

  create_table "weapon_damage_levels", :force => true do |t|
    t.string   "name"
    t.integer  "level",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
