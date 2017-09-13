class Tamagotchi
  @@stats = Hash.new

  attr_reader :name, :stats

  def initialize(name)
    name = name
    birthday = Time.now
    @@stats = {"name" => name, "birthday" => birthday.strftime("%m/%d/%Y %l:%M %p"), "food_level" => 10, "food_time" => birthday.to_i, "sleep_level" => 10, "sleep_time" => birthday.to_i, "activity_level" => 10, "activity_time" => birthday.to_i}
  end

  def self.all()
    @@stats
  end

  def self.find(name)
    @@stats.each do |item|
      if item.id == item_id
        return item
      end
    end
  end

  def self.food_level
    @@stats["food_level"] = ("%0.2f" % (@@stats["food_level"] - (time_passes(@@stats["food_time"])/300.0))).to_f
  end

  def sleep_level
    @@stats["sleep_level"] = ("%0.2f" % (@@stats["sleep_level"] - (time_passes(@@stats["sleep_level"])/600.0))).to_f
    @@stats["sleep_time"] = Time.now
    @@stats["sleep_level"]
    # 1 times per 24 hours
  end

  def activity_level
    @@stats["activity_level"] = ("%0.2f" % (@@stats["activity_level"] - (time_passes(@@stats["activity_level"])/450.0))).to_f
    # 2 times per 24 hours
  end

  def is_alive
    if @@stats["food_level"] == 0 or @@stats["sleep_level"] == 0 or @@stats["activity_level"]
      return false
    end
  end

  def self.time_passes(time)
     (Time.now.to_i)-time
  end

end
