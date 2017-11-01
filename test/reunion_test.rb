require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def test_it_existis
    reunion = Reunion.new("Denver")

    assert_instance_of Reunion, reunion
  end

  def test_it_has_activities
    reunion = Reunion.new("Denver")

    assert_equal [], reunion.activities
  end

  def test_it_can_add_activies_to_reunion
    reunion = Reunion.new("Denver")
    activity = Activity.new("dinner")

    reunion.add_activity(activity)

    assert_equal 1, reunion.activities.count
    assert_equal "dinner", reunion.activities[0].name
  end

  def test_it_can_add_2_activities_to_reunion
    reunion = Reunion.new("Denver")
    activity = Activity.new("dinner")
    activity2 = Activity.new("ice skating")

    reunion.add_activity(activity)
    reunion.add_activity(activity2)


    assert_equal 2, reunion.activities.count
    assert_equal "ice skating", reunion.activities[1].name
  end

  def test_it_can_total_reunion_cost
    reunion = Reunion.new("Denver")
    activity1 = Activity.new("dinner")

    reunion.add_activity(activity1)

    activity1.add_participant("Sam", 50)
    activity1.add_participant("Dave", 70)


    assert_equal 120, reunion.total_cost_reunion
  end

  def test_it_can_total_reunion_cost
    reunion = Reunion.new("Denver")
    activity1 = Activity.new("dinner")
    activity2 = Activity.new("ice skating")

    reunion.add_activity(activity1)
    reunion.add_activity(activity2)

    activity1.add_participant("Sam", 50)
    activity1.add_participant("Dave", 70)
    activity2.add_participant("Sarah", 20)


    assert_equal 140, reunion.total_cost_reunion
  end

end
