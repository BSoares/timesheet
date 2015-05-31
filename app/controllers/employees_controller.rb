class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def index
    @employees = Employee.all
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
    load_employee
  end

  def update
    load_employee

    if @employee.update(employee_params)
      flash[:success] = t(".flash.success")
      redirect_to edit_employee_path(@employee)
      return
    end

    flash[:error] = t(".flash.error")
    render :edit
  end

  private

  def employee_params
    params.require(:employee).permit(:cpf, :name)
  end

  def load_employee
    @employee = Employee.find(params[:id])
  end
end
