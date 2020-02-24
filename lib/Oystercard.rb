class Oystercard

  attr_reader :balance, :in_journey
  CARD_LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    raise "Card limit is £#{CARD_LIMIT}. This exceeds this limit" if exceeds_limit? money

    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def exceeds_limit? money
    (@balance + money) > CARD_LIMIT
  end

end
