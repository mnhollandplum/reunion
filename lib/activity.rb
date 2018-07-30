require 'pry'
class Activity
  attr_reader :activity_name,
              :participants,
              :invoice

  def initialize(name)
    @activity_name = name
    @participants = []
    @invoice = {}

  end

  def add_participant(participant)
    @participants << participant
  end

  def total_fees
    total_fees = []
    @participants.map do |participant|
      total_fees << participant["fees"]
    end
      total_fees.sum
  end

  def fair_share
    total_fees/@participants.count
  end

  def balance_and_credits
      @participants.map do |participant|
        @invoice[participant["name"]] = (fair_share - participant["fees"])
      end
      @invoice
  end

end
