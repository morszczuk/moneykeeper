class BudgetIncome < ApplicationRecord
  enum carrier: [:cash, :card]
  belongs_to :budget_plan

  def self.carrier_keys
    icons = {
      cash: "💵 ",
      card: '💳 '
    }
    carriers.keys.map { |key| [icons[key.to_sym] + key.to_s, key] }
  end

end
