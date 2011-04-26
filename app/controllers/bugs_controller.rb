class BugsController < ApplicationController
  def index
    @bugs = Bug.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @bug = Bug.new(params[:bug])
    respond_to do |format|
      if @bug.save
        format.html { redirect_to(tickets_path,
          :notice => 'Bug was successfully created.') }
        else
          format.html { render :action => "new" }
        end
    end
  end

end