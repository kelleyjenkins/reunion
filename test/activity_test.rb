require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("hiking")

    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new("hiking")

    assert_equal "hiking", activity.name
  end

  def test_it_has_participants_hash
    activity = Activity.new("hiking")


    assert activity.participants
    assert_instance_of Hash, activity.participants
  end

  def test_it_can_add_one_participant
    activity = Activity.new("hiking")
    activity.add_participant("Sarah", 10)

    assert_equal 1, activity.participants.count
  end

  def test_it_can_add_another_participant
    activity = Activity.new("hiking")
    activity.add_participant("Sarah", 10)
    activity.add_participant("John", 20)

    assert_equal 2, activity.participants.count
    assert_equal 20, activity.participants["John"]
  end

  def test_it_can_total_cost_of_activity
    activity = Activity.new("hiking")
    activity.add_participant("Sarah", 10)
    activity.add_participant("John", 20)

    assert_equal 30, activity.total_cost
  end

  def test_it_can_split_total_cost_between_participants
    activity = Activity.new("hiking")
    activity.add_participant("Sarah", 10)
    activity.add_participant("John", 20)

    assert_equal 15, activity.split_cost
  end

  def test_it_shows_how_much_each_owes
    activity = Activity.new("hiking")
    activity.add_participant("Sarah", 10)
    activity.add_participant("John", 20)

    owed = {"Sarah" => 5, "John" => -5}

    assert_equal owed, activity.amount_owed
    assert_instance_of Hash, activity.amount_owed
  end

end
