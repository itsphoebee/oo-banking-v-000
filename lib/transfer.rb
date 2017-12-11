require 'pry'
class Transfer
  # your code here
attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      "Transaction rejected. Please check your account balance."
      @status = "reversed"
    end
  end
end
