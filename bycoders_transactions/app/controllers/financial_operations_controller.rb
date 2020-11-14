class FinancialOperationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # index stuff
  end

  def import
    imports = FinancialOperationsParserService.new(
      file: financial_operations_params[:file].tempfile,
      parser: Parsers::TxtParser,
      splitter: Splitters::FinancialOperations
    )

    if imports.call
      head :ok
    else
      render json: 'foo'
    end
  end

  private

    def financial_operations_params
      params.permit(:file)
    end
end
