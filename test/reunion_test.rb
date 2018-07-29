require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def test_reunion_exists_with_location
    reunion = Reunion.new(location)
    assert_instance_of Reunion, reunion
  end

  def test_it_can_assign_location
    reunion = Reunion.new("Antwerp")
    assert_equal "Antwerp", reunion.location
  end

  def test_reunion_activiy_roster_starts_empty
    reunion = Reunion.new("Antwerp")
    assert_equal [], reunion.activities
  end

  def test_it_can_add_activities_to_roster
    reunion = Reunion.new("Antwerp")
    activity = Activity.new("Egg Race")
    reunion.add_activity(activity)


    assert_equal "Egg Race", reunion.activities[0].name
  end

end
