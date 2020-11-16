class FinancialOperationsController < ApplicationController
  def index
    @financial_operations = FinancialOperation.includes(
      :store, :holder, :card, :financial_operation_type
    ).filters(
      financial_operations_params.slice(:search)
    )

    respond_to do |format|
      format.html
      format.js
    end
  end

  def import
    imports = FinancialOperationsParserService.new(
      file: financial_operations_params[:file],
      parser: Parsers::TxtParser,
      splitter: Splitters::FinancialOperations
    )

    if imports.call
      redirect_to financial_operations_path, notice: t('upload_success')
    else
      flash[:error] = 'upload_error'
    end
  end

  private

    def financial_operations_params
      params.permit(:file, :search)
    end
end
