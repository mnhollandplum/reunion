require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_activity_exists
    activity = Activity.new("Soccer")
    assert_instance_of Activity, activity
  end

  def test_activity_has_name
    activity = Activity.new("Soccer")
    assert_equal "Soccer", activity.name
  end

  def test_there_is_a_list_of_participants
    activity = Activity.new("Soccer")
    assert_equal [], activity.participants
  end

  def test_it_can_add_a_participant
    activity = Activity.new("Soccer")
    activity.add_participant({"name" => "Todd", "fees" => 5})
    assert_equal "Todd", activity.participants[0]["name"]
     assert_equal 5,      activity.participants[0]["fees"]
  end

  def test_it_can_add_multiple_participants
    activity = Activity.new("Soccer")
    activity.add_participant({"name" => "Todd", "fees" => 5})
    activity.add_participant({"name" => "Molly", "fees" => 7})
    assert_equal "Molly", activity.participants[1]["name"]
    assert_equal 7,      activity.participants[1]["fees"]
  end

  def test_it_can_add_up_fees_per_activity
    activity = Activity.new("Soccer")
    activity.add_participant({"name" => "Todd", "fees" => 5})
    activity.add_participant({"name" => "Molly", "fees" => 7})

    assert_equal 12, activity.total_fees
  end


  def test_fees_can_be_split_into_fair_shares
    activity = Activity.new("Soccer")
    activity.add_participant({"name" => "Todd", "fees" => 5})
    activity.add_participant({"name" => "Molly", "fees" => 7})

    assert_equal 6, activity.fair_share
  end

  def test_can_determing_balance_and_credits
    activity = Activity.new("Soccer")
    activity.add_participant({"name" => "Todd", "fees" => 5})
    activity.add_participant({"name" => "Molly", "fees" => 7})
    assert_equal 6, activity.fair_share
    activity.balance_and_credits


   assert_equal 1, activity.invoice["Todd"]
   assert_equal -1, activity.invoice["Molly"]


  end



end
