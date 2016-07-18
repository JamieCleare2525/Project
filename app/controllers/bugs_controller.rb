class BugsController < ApplicationController
  def new
    @bug = Bug.new
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def index
    redirect_to new_bug_path
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def create
    @bug = Bug.new(bug_params)
    @bug.user = current_user

    if @bug.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @bug = Bug.find(params[:id])
    if @bug.update(bug_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy

    redirect_to root_path
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :expected_outcome, :actual_outcome, :status)
  end
end
