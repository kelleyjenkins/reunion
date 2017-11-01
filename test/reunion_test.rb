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

  

end
