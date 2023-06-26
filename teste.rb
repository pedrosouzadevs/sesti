input = "Session data: From 2023-06-21, 22:13:02 to 2023-06-21, 23:38:31
Session: 01:25h
Raw XP Gain: 111,016
XP Gain: 253,594
Raw XP/h: 160,030
XP/h: 376,512
Loot: 0
Supplies: 377,194
Balance: -377,194
Damage: 872,445
Damage/h: 872,445
Healing: 577,641
Healing/h: 574,277
Killed Monsters:
  1x Drume
  1x Grand Master Oberon
  1x The Brainstealer
  1x ancient lion knight
  8x bat
  5x cave chimera
  5x falcon knight
  1x falcon paladin
  1x leaf golem
  1x magma bubble
  2x tremendous tyrant
  3x usurper commander
  1x varnished diremaw
Looted Items:
  1x arrow
  20x Apple"

time_session = input.match(/(?<from_Datetime>\d{4}-\d{2}-\d{2}, \d{2}:\d{2}:\d{2}) to (?<to_Datetime>\d{4}-\d{2}-\d{2}, \d{2}:\d{2}:\d{2})/).to_a
time_session_from = time_session[1]
time_session_to = time_session[2]
time_duration = input.match(/Session: (?<duration>\S*)/).to_a
xp_gain = input.match(/XP Gain: (?<raw_xp_gain>\S*).XP Gain: (?<xp_gain>\S*)/m).to_a
raw_xp = xp_gain[1]
total_xp = xp_gain[2]
xp_hour = input.match(/XP\/h: (?<raw_xp_hour>\S*).XP\/h: (?<xp_hour>\S*)/m).to_a
raw_xp_hour = xp_hour[1]
total_xp_hour = xp_hour[2]
loot = input.match(/Loot: (?<loot>\S*)/).to_a[1]
supplies = input.match(/Supplies: (?<supplies>\S*)/).to_a[1]
balance = input.match(/Balance: (?<balance>\S*)/).to_a[1]
damage = input.match(/Damage: (?<damage>\S*)/).to_a[1]
damage_hour = input.match(/Damage\/h: (?<damage_hour>\S*)/).to_a[1]
healing = input.match(/Healing: (?<healing>\S*)/).to_a[1]
healing_hour = input.match(/Healing\/h: (?<healing_hour>\S*)/).to_a[1]
monsters = input.match(/((?<monster>\d*x \s*.*){1,}).(?<looted>Looted)/m)
monster = monsters[1].split("\n")
creature = []
monster.each do |n|
  mon = n.match(/(?<quantity>\d+)x (?<name>\s*.*)/)
  creature << [mon[1].to_i, mon[2]]
end

looted_items = input.match(/((?<looted_items>\d*x \s*.*){1,})/m).to_a
looted_item = looted_items[1].split(/Looted.Items:/)[1]
# all_items = []
# looted_item.each do |item|
#   items = item.match(/(?<quantity>\d+)x (?<name>\s*.*)/)
#   all_items << [items[1].to_i, items[2]]
# end


# puts time_session_from
# puts time_session_to
# puts time_duration[1]
# puts total_xp
# puts raw_xp
# puts raw_xp_hour
# puts total_xp_hour
# puts loot
# puts supplies
# puts balance
# puts damage
# puts damage_hour
# puts healing
# puts healing_hour
# puts creature
# puts all_items
