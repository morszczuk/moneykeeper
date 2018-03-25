class LabelFilter < ApplicationRecord

  def outcomes
    PaymentPart.label_sum(label)
  end
end
