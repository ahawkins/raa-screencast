class SendInvoiceForm
  attr_reader :email, :description, :amount, :name

  def email=(value)
    @email = value.to_s
  end

  def description=(value)
    @description = value.to_s
  end

  def amount=(value)
    @amount = value.to_f
  end

  def name=(value)
    @name = value.to_s
  end
end
