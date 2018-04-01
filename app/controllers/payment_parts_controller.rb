class PaymentPartsController < ApplicationController
  def update
    payment_part = PaymentPart.find(params[:id])
    payment_part.labels = payment_part_params[:labels].split(' ') unless payment_part_params[:labels].nil? 
    payment_part.category_id = payment_part_params[:category_id] unless payment_part_params[:category_id].nil? 
    payment_part.amount = payment_part_params[:amount] unless payment_part_params[:amount].nil?
    payment_part.save!
    redirect_to operations_path
  end

  def create
    payment_part = PaymentPart.new
    payment_part.amount = payment_part_params[:amount]
    payment_part.labels = payment_part_params[:labels].split(' ')
    payment_part.operation_id = params[:operation_id]
    payment_part.category = Category.first
    payment_part.save!
    redirect_to operations_path
  end

  def destroy
    PaymentPart.find(params[:id]).destroy!
    redirect_to operations_path
  end

  private

  def payment_part_params
    params.require(:payment_part).permit(:labels, :amount, :operation_id, :category_id)
  end
end
