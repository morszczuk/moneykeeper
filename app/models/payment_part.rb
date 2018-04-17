class PaymentPart < ApplicationRecord
  belongs_to :category
  belongs_to :operation
  belongs_to :budget_spending, optional: true

  scope :with_category, ->(category_id) { where('category_id = ?', category_id) }
  scope :outcomes, -> { where('amount < 0') }
  scope :incomes, -> { where('amount > 0') }
  scope :current_year, -> { where('extract(year from month) = ?', Date.today.year) }
  scope :current_month, -> { where('extract(month from month) = ?', Date.today.month) }

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
