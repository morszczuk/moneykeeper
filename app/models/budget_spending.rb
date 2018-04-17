class BudgetSpending < ApplicationRecord
  belongs_to :category, optional: true

  def amount_payed
    (Operation.current_month
      .map(&:payment_parts) &&
      PaymentPart.with_category(category.id))
      .map(&:amount)
      .inject(0) { |sum, x| sum + x }
  end
end
