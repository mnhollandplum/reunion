require 'pry'
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
     activity_1 = Activity.new("Egg Race")
     activity_2 = Activity.new("Flip Cup")
     reunion.add_activity(activity_1)
     reunion.add_activity(activity_2)

     assert_equal "Egg Race", reunion.activities[0].activity_name
     assert_equal "Flip Cup", reunion.activities[1].activity_name

  end

  def test_it_can_evaluste_the_total_cost_of_reunion
   reunion = Reunion.new("Central Park")
   activity_1 = Activity.new("Soccer")
   activity_1.add_participant({"name" => "Todd", "fees" =>5})
   activity_1.add_participant({"name" => "Molly", "fees" => 7})
   activity_1.add_participant({"name" => "Josh", "fees" => 9})
   activity_1.add_participant({"name" => "Sara", "fees" => 2})

   activity_2 = Activity.new("Flip Cup")
   activity_2.add_participant({"name" => "Jenny", "fees" => 17})
   activity_2.add_participant({"name" => "Nick", "fees" => 16})

   reunion.add_activity(activity_1)
   reunion.add_activity(activity_2)

   assert_equal 56, reunion.total_costs_for_activities
  end

  def test_it_can_determine_total_participants

    reunion = Reunion.new("Central Park")
    activity_1 = Activity.new("Soccer")
    activity_1.add_participant({"name" => "Todd", "fees" =>5})
    activity_1.add_participant({"name" => "Molly", "fees" => 7})
    activity_1.add_participant({"name" => "Josh", "fees" => 9})
    activity_1.add_participant({"name" => "Sara", "fees" => 2})

    activity_2 = Activity.new("Flip Cup")
    activity_2.add_participant({"name" => "Jenny", "fees" => 17})

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)

    assert_equal 5, reunion.total_participants
  end

  def test_total_amount_due_per_person
    reunion = Reunion.new("Central Park")
    activity_1 = Activity.new("Soccer")
    activity_1.add_participant({"name" => "Todd", "fees" =>5})
    activity_1.add_participant({"name" => "Molly", "fees" => 7})
    activity_1.add_participant({"name" => "Josh", "fees" => 9})
    activity_1.add_participant({"name" => "Sara", "fees" => 2})

    activity_2 = Activity.new("Flip Cup")
    activity_2.add_participant({"name" => "Jenny", "fees" => 17})
     activity_2.add_participant({"name" => "Nick", "fees" => 16})

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    reunion.total_amount_per_participant
     expected = {"Soccer"=>{"Todd"=>1, "Molly"=>-1, "Josh"=>-3, "Sara"=>4},  "Flip Cup"=>{"Jenny"=>11, "Nick" =>10}}

     assert_equal expected, reunion.total_amount_per_participant

     activity_1 = Activity.new("Egg Race")
     activity_2 = Activity.new("Flip Cup")
     reunion.add_activity(activity1)
     reunion.add_activity(activity2)

     assert_equal "Egg Race", reunion.activities[0].name
     assert_equal "Flip Cup", reunion.activities[1].name
  end

end
