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
    reunion = Reunion.new("Central Park")
     activity1 = Activity.new("Egg Race")
     activity2 = Activity.new("Flip Cup")
     reunion.add_activity(activity1)
     reunion.add_activity(activity2)

     assert_equal "Egg Race", reunion.activities[0].name
     assert_equal "Flip Cup", reunion.activities[1].name
  end


end
