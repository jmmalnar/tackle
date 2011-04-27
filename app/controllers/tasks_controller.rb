class TasksController < ApplicationController
  def index
    @tasks = Task.all
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @task = Task.find(params[:id])
  end
  
  def create
    @task = Task.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html { redirect_to(tickets_path,
                      :notice => 'Task was successfully created.') }
        else
          format.html { redirect_to(new_ticket_path) }
        end
    end
  end

  def update
    @task = Task.find(params[:id])
    
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(tickets_path,
                      :notice => 'Task was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

end