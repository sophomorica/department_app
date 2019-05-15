class DepartmentsController < ApplicationController
  before_action :set_dep, only: [:show, :update, :edit, :destroy]
  def index
    @deps = Department.all
  end

  def show
  end

  def new
    @dep = Department.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def update
    @dep = Department.new(dep_params)
    if @dep.save
      redirect_to departments_path
    else
      render partial: "form"
    end
  end

  def destroy
    if @dep.update(dep_params)
      redirect_to @dep
    else
      render partial: "form"
    end
  end



  private
  def set_dep
    @dep = Department.find(params[:id])
  end
  def dep_params
    params.require(:department).permit(:name)
  end
  
end
