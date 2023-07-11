input = "Session data: From 2023-06-26, 20:02:53 to 2023-06-26, 20:12:21
Session: 00:09h
Raw XP Gain: 541
XP Gain: 1,213
Raw XP/h: 3,562
XP/h: 7,987
Loot: 99
Supplies: 0
Balance: 99
Damage: 1,101
Damage/h: 1,101
Healing: 0
Healing/h: 0
Killed Monsters:
  4x bat
  1x deer
  1x fox
  5x orc
  3x orc warrior
  11x poison spider
Looted Items:
  62x a gold coin
  1x an axe
  1x orc leather"

# Times of session ==================================================================================

time_session_from = input.match(/(?<from_Datetime>\d{4}-\d{2}-\d{2}, \d{2}:\d{2}:\d{2})/).to_a[1]
time_session_to = input.match(/to (?<to_Datetime>\d{4}-\d{2}-\d{2}, \d{2}:\d{2}:\d{2})/).to_a[1]
time_duration = input.match(/Session: (?<duration>\S*)/).to_a

# Experience of session ==================================================================================

xp_gain = input.match(/XP Gain: (?<raw_xp_gain>\S*).XP Gain: (?<xp_gain>\S*)/m).to_a
raw_xp = xp_gain[1]
total_xp = xp_gain[2]
xp_hour = input.match(/XP\/h: (?<raw_xp_hour>\S*).XP\/h: (?<xp_hour>\S*)/m).to_a
raw_xp_hour = xp_hour[1]
total_xp_hour = xp_hour[2]

# Loots of session ==================================================================================

loot = input.match(/Loot: (?<loot>\S*)/).to_a[1]
supplies = input.match(/Supplies: (?<supplies>\S*)/).to_a[1]
balance = input.match(/Balance: (?<balance>\S*)/).to_a[1]

# Damage and Healing of session ==================================================================================

damage = input.match(/Damage: (?<damage>\S*)/).to_a[1]
damage_hour = input.match(/Damage\/h: (?<damage_hour>\S*)/).to_a[1]
healing = input.match(/Healing: (?<healing>\S*)/).to_a[1]
healing_hour = input.match(/Healing\/h: (?<healing_hour>\S*)/).to_a[1]

# Monsters killed ==================================================================================

monsters = input.match(/((?<monster>\d*x \s*.*){1,}).(?<looted>Looted)/m)
monster = monsters[1].split("\n")
creature = []
monster.each do |n|
  mon = n.match(/(?<quantity>\d+)x (?<name>\s*.*)/)
  creature << [mon[1].to_i, mon[2]]
end

# Looted itens ==================================================================================

looted_items = input.match(/((?<looted_items>\d*x \s*.*){1,})/m).to_a[1]
looted_item = looted_items.split(/Looted.Items:\n  /)[1]
looted_item_split = looted_item.split("\n  ")
all_items = []
looted_item_split.each do |item|
  items = item.match(/(?<quantity>\d+)x (?<name>\s*.*)/)
  all_items << [items[1].to_i, items[2]]
end

puts time_session_from
puts time_session_to
puts time_duration[1]
puts total_xp
puts raw_xp
puts raw_xp_hour
puts total_xp_hour
puts loot
puts supplies
puts balance
puts damage
puts damage_hour
puts healing
puts healing_hour
puts creature
puts all_items
