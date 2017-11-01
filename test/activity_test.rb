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
end
