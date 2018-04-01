class Operation < ApplicationRecord
  validates :exec_date, presence: true
  validates :order_date, presence: true
  validates :operation_type, presence: true
  validates :description, presence: true
  validates :amount, presence: true
  validates :currency, presence: true
  
  validates :description, uniqueness: true

  scope :current_month, -> { where('order_date > ?', Time.now.beginning_of_month) }
  scope :outcomes, -> { where('amount < 0') }
  scope :incomes, -> { where('amount > 0') }

  has_many :payment_parts

  def self.current_month_sum
    Operation.current_month.outcomes.map(&:amount).inject(0) {|sum, x| sum + x}
  end

  def parts_amount_valid?
    amount == parts_amount_sum
  end

  def self.category_sum(category_id, curr_month = true)
    operations = Operation.all
    operations = operations.current_month if curr_month
    operations.map { |op| op.parts_with_category(category_id) }
      .flatten
      .map(&:amount)
      .inject(0) {|sum, x| sum + x}
  end

  def self.category_percentage(category_id)
    current_month_sum = Operation.current_month_sum
    current_month_sum != 0 ? Operation.category_sum(category_id)/Operation.current_month_sum*100 : 0
  end

  def parts_with_category(category_id)
    payment_parts.select {|pp| pp.category_id == category_id }
  end

  private

  def parts_amount_sum
    payment_parts.map(&:amount).inject(0) {|sum, x| sum + x unless x.nil?}
  end
end
