class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
    breaking_info(@session.info)
  end

  def home
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    # @session.user_id = current_user.id
    if @session.save
      redirect_to session_path(@session.id)
    else
      render :home, status: :unprocessable_entity
    end
  end

  private

  def session_params
    params.require(:session).permit(:info, :equip_id)
  end

  def breaking_info(input)
    # Times of session ==================================================================================

    @time_session_from = input.match(/(?<from_Datetime>\d{4}-\d{2}-\d{2}, \d{2}:\d{2}:\d{2})/).to_a[1]
    @time_session_to = input.match(/to (?<to_Datetime>\d{4}-\d{2}-\d{2}, \d{2}:\d{2}:\d{2})/).to_a[1]
    @time_duration = input.match(/Session: (?<duration>\S*)/).to_a[1]

    # Experience of session ==================================================================================

    xp_gain = input.match(/XP Gain: (?<raw_xp_gain>\S*).XP Gain: (?<xp_gain>\S*)/m).to_a
    @raw_xp = xp_gain[1]
    @total_xp = xp_gain[2]
    @xp_hour = input.match(/XP\/h: (?<raw_xp_hour>\S*).XP\/h: (?<xp_hour>\S*)/m).to_a
    @raw_xp_hour = @xp_hour[1]
    @total_xp_hour = @xp_hour[2]

    # Loots of session ==================================================================================

    @loot = input.match(/Loot: (?<loot>\S*)/).to_a[1]
    @supplies = input.match(/Supplies: (?<supplies>\S*)/).to_a[1]
    @balance = input.match(/Balance: (?<balance>\S*)/).to_a[1]

    # Damage and Healing of session ==================================================================================

    @damage = input.match(/Damage: (?<damage>\S*)/).to_a[1]
    @damage_hour = input.match(/Damage\/h: (?<damage_hour>\S*)/).to_a[1]
    @healing = input.match(/Healing: (?<healing>\S*)/).to_a[1]
    @healing_hour = input.match(/Healing\/h: (?<healing_hour>\S*)/).to_a[1]

    # Monsters killed ==================================================================================

    monsters = input.match(/((?<monster>\d*x \s*.*){1,}).(?<looted>Looted)/m)
    monster = monsters[1].split("\n")
    @creature = []
    monster.each do |n|
      mon = n.match(/(?<quantity>\d+)x (?<name>\s*.*)/)
      @creature << [mon[1].to_i, mon[2]]
    end

    # Looted itens ==================================================================================

    looted_items = input.match(/((?<looted_items>\d*x \s*.*){1,})/m).to_a[1]
    looted_item = looted_items.split(/Looted.Items:\n  /)[1]
    if looted_item != nil
      looted_item_split = looted_item.split("\n  ")
      @all_items = []
      looted_item_split.each do |item|
        items = item.match(/(?<quantity>\d+)x (?<name>\s*.*)/)
        @all_items << [items[1].to_i, items[2]]
      end
    end
  end
end
