class MonthAttendancesController < ApplicationController
  def new
    load_employee
    @month_attendance = MonthAttendance.new
  end

  def create
    load_employee
    load_month_attendance
    render :show
  end

  private

  def load_employee
    @employee = Employee.find(params[:employee_id])
  end

  def month_attendance_params
    params.require(:month_attendance).permit(:month)
  end

  def load_month_attendance
    @month_attendance = MonthAttendance.new(
      employee: @employee,
      month: month_attendance_params[:month])
    @month_attendance.valid?
  end
end
