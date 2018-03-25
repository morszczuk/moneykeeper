class DashboardController < ApplicationController
  def index
    @operations = Operation.all
    @categories = Category.all
    @saldo = Operation.current_month_sum
  end
end
