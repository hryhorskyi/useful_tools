# frozen_string_literal: true

require 'date'

# Class for calculating days between two dates
class DateCalculator
  def initialize
    @date_collection = RecieveDate.new
    @first_date, @second_date = @date_collection.interaction
  end

  def parse_date
    @start_date = Date.parse(@first_date)
    @end_date = Date.parse(@second_date)
  rescue ArgumentError
    puts 'Invalid date format. Please enter the dates in a valid format.'
    @first_date, @second_date = @date_collection.interaction
    retry
  end

  def calculating
    parse_date
    (@start_date - @end_date).to_i.abs
  end

  def to_years
    "#{calculating / 365} years #{calculating % 365} days "
  end

  def proccess
    if calculating > 365
      puts to_years
    else
      puts "#{calculating} days"
    end
  end
end

# Class for recieving dates from user
class RecieveDate
  def message(line)
    puts "Please enter #{line}"
    gets.chomp
  end

  def interaction
    @first_date = message('first date')
    @second_date = message('second date')

    [@first_date, @second_date]
  end
end

date = DateCalculator.new
date.proccess
