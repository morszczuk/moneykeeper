class PaymentPart < ApplicationRecord
  belongs_to :category
  belongs_to :operation

  scope :with_category, ->(category_id) { where('category_id = ?', category_id) }
  scope :outcomes, -> { where('amount < 0') }
  scope :incomes, -> { where('amount > 0') }

  def self.category_sum(category_id)
    PaymentPart.with_category(category_id)
      .outcomes
      .map(&:amount)
      .inject(0) { |sum, x| sum + x }
  end

  def self.label_sum(label)
    PaymentPart.all
      .outcomes
      .select { |pp| pp.has_label?(label) }
      .map(&:amount)
      .inject(0) { |sum, x| sum + x }
  end

  def has_label?(label)
    labels.include? label
  end
end
