require 'pry'
require './lib/activity'
class Reunion
  attr_reader :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost_reunion
     @activities[0].participants.values.sum
  end

end
