class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
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


end
