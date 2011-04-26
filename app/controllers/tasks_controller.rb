class TasksController < ApplicationController
  def index
    @tasks = Task.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @task = Task.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html { redirect_to(tickets_path,
          :notice => 'Task was successfully created.') }
        else
          format.html { render :action => "new" }
        end
    end
  end

end