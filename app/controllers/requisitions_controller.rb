class RequisitionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @requisition = Requisition.new
  end

  def create
    @requisition = current_user.requisitions.build(create_params)

    if @requisition.save
      flash[:notice] = 'Successfully, created requisition.'
      redirect_to @requisition
    else
      flash[:alert] = 'Error, creating requisition.'
      render 'new'
    end
  end

  def show
    @requisition = Requisition.find(params[:id])
  end

  private

  def create_params
    params.require(:requisition).permit(:title, :department, :full_time, :preferred_start_date, :job_description)
  end
end
