class StoriesController < ApplicationController
  def index
    @stories = Story.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @story = Story.new(params[:story])
    respond_to do |format|
      if @story.save
        format.html { redirect_to(tickets_path,
          :notice => 'Story was successfully created.') }
        else
          format.html { render :action => "new" }
        end
    end
  end

end