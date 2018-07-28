require 'pry'
class Activity
  attr_reader :name,
              :participants,
              :invoice

  def initialize(name)
    @name = name
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
      # binding.pry
  end

  def fair_share
    total_fees/@participants.count
  end

  def balance_and_credits
      @participants.map do |participant|
        @invoice[participant["name"]] = (fair_share - participant["fees"])
      end
      binding.pry
      @invoice
  end





end
