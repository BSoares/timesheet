class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      flash[:success] = t(".flash.success")
      redirect_to edit_employee_path(@employee)
      return
    end

    flash[:error] = t(".flash.error")
    render :new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  private

  def employee_params
    params.require(:employee).permit(:cpf, :name)
  end
end
