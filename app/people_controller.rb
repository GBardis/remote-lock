class PeopleController
  attr_accessor :dollar_file, :percent_file

  def initialize(params)
    @params = params
  end

  def normalize
    Processor.new(data_read, order, [:last_name]).perform
  end

  private

  def data_read
    DataParser.new(params[:dollar_format], '$').parse +
      DataParser.new(params[:percent_format], '%').parse
  end

  def order
    @order = params[:order]
  end

  attr_reader :params
end
