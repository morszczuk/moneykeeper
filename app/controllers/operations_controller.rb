class OperationsController < ApplicationController
  def index
    @operations = Operation.all
  end

  def create
  end

  def delete_all_operations
    Operation.all.map(&:payment_parts).flatten.each(&:destroy)
    Operation.all.each(&:destroy)
    redirect_to operations_path
  end

  def edit
    @operation = Operation.find(params[:id])
  end
end