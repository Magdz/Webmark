class RemarksController < ApplicationController
  before_action :set_remark, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @remarks = Remark.all
    respond_with(@remarks)
  end

  def show
    respond_with(@remark)
  end

  def new
    @remark = Remark.new
    respond_with(@remark)
  end

  def edit
  end

  def create
    @remark = Remark.new(remark_params)
    @remark.save
    respond_with(@remark)
  end

  def update
    @remark.update(remark_params)
    respond_with(@remark)
  end

  def destroy
    @remark.destroy
    respond_with(@remark)
  end

  private
    def set_remark
      @remark = Remark.find(params[:id])
    end

    def remark_params
      params.require(:remark).permit(:bookmark_id, :body, :user_id)
    end
end
