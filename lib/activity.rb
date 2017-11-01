class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
    @owed = {}
  end

  def add_participant(person, cost)
    participants[person] = cost
  end

  def total_cost
    participants.values.sum
  end

  def split_cost
    total_cost / participants.count
  end

  def amount_owed
    @participants.keys.each do |person|
      @owed[person] = split_cost - participants[person]
    end
    @owed
  end
end
