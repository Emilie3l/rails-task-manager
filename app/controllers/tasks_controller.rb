class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.update(params[:task])

    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
