require 'pry'
class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = []
    @total_fees = []

  end

  def add_participant(participant)
    @participants << participant
  end

  def total_fees

    @participants.map do |participant|
      @total_fees << participant["fees"]
    end
      @total_fees.sum
  end






end
