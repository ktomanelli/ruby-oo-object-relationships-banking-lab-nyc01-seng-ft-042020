class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  # your code here

  def initialize(sender,receiver,amount=0)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end
  end

  def execute_transaction
    if valid? && @sender.balance >= amount && @status=='pending'
      @sender.balance -= amount
      @receiver.balance += amount
      @status = 'complete'
    else @sender.balance < amount
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer 
    if @status=='complete'
      @sender.balance += amount
      @receiver.balance -= amount
      @status = 'reversed'
    end
  end

end
