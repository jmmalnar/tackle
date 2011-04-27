class BugsController < ApplicationController
  def index
    @bugs = Bug.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    @bug = Bug.find(params[:id])
  end
  
  def create
    @bug = Bug.new(params[:bug])
    respond_to do |format|
      if @bug.save
        format.html { redirect_to(tickets_path,
                      :notice => 'Bug was successfully created.') }
        else
          format.html { redirect_to(new_bug_path) }
        end
    end
  end
  
  def update
    @bug = Bug.find(params[:id])
    
    respond_to do |format|
      if @bug.update_attributes(params[:bug])
        format.html { redirect_to(tickets_path,
                      :notice => 'Bug was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

end