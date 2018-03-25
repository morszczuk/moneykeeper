class OperationHistoryController < ApplicationController
  def create
    operations = OperationHistoryParser.new operation_history_params[:operation_history] if operation_history_params[:operation_history]
    operations.operations.each { |op| op.save }
    # render component: 'OperationHistory'
    redirect_to '/', notice: "Zaimportowano #{operations.operations.count} nowych obiektów"
  end

  def new
    puts "\n\n\n\DOBRZE< BĘDZIEMY TUTAJ"
  end

  def parse
    puts "\n\n\n\DOBRZE< BĘDZIEMY TUTAJ w PARSERZE\n\n\n\n"
    render component: 'OperationHistory', tag:'div', layout: :lalala
  end

  def parse_2
    puts "lolo"
    render component: 'OperationHistory', tag:'div', class: 'sratata'
  end

  private
  def operation_history_params
    params.permit(:operation_history)
  end
end