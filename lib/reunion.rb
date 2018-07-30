require 'pry'
require './lib/activity'
class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
    @participants = []
    @total_invoice = {}
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_costs_for_activities
    total_costs_for_activities = []
    @activities.map do |activity|
      total_costs_for_activities << activity.total_fees
    end
    total_costs_for_activities.sum
  end

  def total_participants
    participants_hash.map do |participant|
      participant["name"]
    end.count

  end

  def participants_hash
    @participants = @activities.map do |activity|
      activity.participants
    end.flatten
    @participants

  end

  def total_amount_per_participant
    @activities.map do |activity|
     @total_invoice[activity] = activity.balance_and_credits
     binding.pry
   end
  end



end
