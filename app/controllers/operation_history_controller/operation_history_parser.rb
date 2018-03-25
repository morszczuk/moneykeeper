class OperationHistoryController
  class OperationHistoryParser
    attr_reader :operations
    def initialize(operation_history_file)
      return unless check_extension(operation_history_file)
      parse_operation_history_file operation_history_file
    end

    private

    def check_extension(operation_history_file)
      return false unless File.extname(operation_history_file.original_filename) == '.xml'
      true
    end

    def parse_operation_history_file(operation_history_file)
      xml_file = create_xml_object operation_history_file
      @operations = find_operations xml_file
    end

    def create_xml_object(operation_history_file)
      Nokogiri::XML operation_history_file.tempfile
    end

    def find_operations(xml_file)
      xml_file.xpath('//operations/operation').map do |operation|
        create_operation_object operation
      end
    end

    def create_operation_object(operation)
      Category.create_food_category unless Category.food_created?
      default_part = PaymentPart.new(
        amount: operation.at_xpath('./amount').content,
        category: Category.food_category
      )
      Operation.new(
        exec_date: operation.at_xpath('./exec-date').content,
        order_date: operation.at_xpath('./order-date').content,
        operation_type: operation.at_xpath('./type').content,
        description: operation.at_xpath('./description').content,
        amount: operation.at_xpath('./amount').content,
        currency: operation.at_xpath('./amount')['curr'],
        payment_parts: [default_part]
      )
    end
  end
end
