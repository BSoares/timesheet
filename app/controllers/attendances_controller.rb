class AttendancesController < ApplicationController
  skip_before_filter :authenticate!, only: :create

  def create
    return unless load_employee

    @attendance = Attendance.today_attendance(@employee)

    register

    redirect_to root_path
  end

  private

  def attendance_params
    params.require(:attendance).permit(:employee_cpf)
  end

  def load_employee
    @employee = Employee.find_by(cpf: attendance_params[:employee_cpf])

    return true if @employee

    flash[:error] = t(".flash.employee_not_found")
    redirect_to root_path

    false
  end

  def register
    if @attendance.entrance_at.nil?
      @attendance.entrance_at = DateTime.now
    elsif @attendance.departure_at.nil?
      @attendance.departure_at = DateTime.now
    else
      flash[:error] = t(".flash.already_registered")
      return
    end
    save
  end

  def save
    if @attendance.save
      flash[:success] = t(".flash.success")
    else
      flash[:error] = t(".flash.error")
    end
  end
end
