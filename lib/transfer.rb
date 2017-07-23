require "pry"

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    # binding.pry
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
    if valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
