class Oystercard

  attr_reader :balance
  CARD_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise "Card limit is £#{CARD_LIMIT}. This exceeds this limit" if exceeds_limit? money

    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  private

  def exceeds_limit? money
    (@balance + money) > CARD_LIMIT
  end

end
