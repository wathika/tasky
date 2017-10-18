class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "The person has been created!" and return
    end
    render 'new'
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(task_params)
      redirect_to tasks_path, notice: "#{task_name} has been updated" and return
    end
    render 'edit'
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path, notice: "#{task_name} has been Completed" and return
  end


  private
    def task_params
      params.require(:task).permit(:task_name, :task_notes)
    end
end
