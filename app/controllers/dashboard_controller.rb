class DashboardController < ApplicationController
  def index
    @operations = Operation.includes(:payment_parts).all
    @categories = Category.all
    @saldo = Operation.current_month_sum
  end
end
