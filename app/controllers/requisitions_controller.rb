class RequisitionsController < ApplicationController
  before_action :set_requisition, only: [:show]
  after_action :verify_authorized

  def index
    @requisitions = policy_scope(Requisition)
    authorize @requisitions
  end

  def new
    @requisition = Requisition.new
    authorize @requisition
  end

  def create
    @requisition = current_user.requisitions.build(create_params)
    authorize @requisition

    if @requisition.save
      flash[:notice] = 'Successfully, created requisition.'
      redirect_to @requisition
    else
      flash[:alert] = 'Error, creating requisition.'
      render 'new'
    end
  end

  def show; end

  private

  def set_requisition
    @requisition = Requisition.find(params[:id])
    authorize @requisition
  end

  def create_params
    params.require(:requisition).permit(:title, :department, :full_time, :preferred_start_date, :job_description)
  end
end
