class ExpensesController < ApplicationController
  def create
    @report = Report.find_by_uuid(params[:report_uuid])
    @expense = @report.expenses.new(expense_params)
    @expense.attributes = {'person_id': person_params[:id]}
    @expense.save
    redirect_to report_path(@report)
  end

  def edit
  end

  def index
  end

  def new
  end

  def show
  end

  private
    def expense_params
      params.require(:expense).permit(:vendor, :date, :amount)
    end

    def person_params
      params.require(:person).permit(:id)
    end
end