class SubsController < ApplicationController
  before_action :require_signed_in!, except: [:index, :show]
  before_action :require_user_owns_sub!, only: [:edit, :update]
  def new
    @sub = Sub.new
  end

  def create
    @sub = current_user.subs.new(sub_params)
  end

  def edit
  end

  def update
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
    render :index
  end

  private

  def require_user_owns_sub!
    return if current_user.subs.find_by(id: params[:id])
  end

  def sub_params
    params.require(:sub).permit(:name, :description)
  end
end
