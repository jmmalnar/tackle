class StoriesController < ApplicationController
  def index
    @stories = Story.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    @story = Story.find(params[:id])
  end
  
  def create
    @story = Story.new(params[:story])
    respond_to do |format|
      if @story.save
        format.html { redirect_to(tickets_path,
          :notice => 'Story was successfully created.') }
        else
          format.html { redirect_to(tickets_path) }
        end
    end
  end
  
  def update
    @story = Story.find(params[:id])
    
    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to(tickets_path,
                      :notice => 'Story was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

end