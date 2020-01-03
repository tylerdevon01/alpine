class TasksController < ApplicationController
  before_action :get_contact

  def index
    @tasks = @contact.tasks.all
  end
  def new
    @task = @contact.tasks.build
  end
  
  def create
    @task = @contact.tasks.build(task_params)
    if @task.save
      redirect_to [@contact, @task]
    else
      render 'new'
    end
  end
  
  def show
    @task = @contact.tasks.find_by(id:params[:id])
  end
  
  def edit
    @task = Task.find_by(id: params[:id])
  end
  
  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to [@contact, @task]
    else
      render 'edit'
    end
  end
  
  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to contact_tasks_path
  end

protected
  def get_contact
    @contact = Contact.find_by(id: params[:contact_id])
  end
  
private
    def task_params
      params.require(:task).permit(:name, :body, :date, :time)
    end
end
