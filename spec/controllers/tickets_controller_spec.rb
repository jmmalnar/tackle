require 'spec_helper'

describe TicketsController do
  
  describe "GET 'index'" do
    before do
      Ticket.stub_chain(:order, :page, :per)
    end
    
    it "responds successfully" do
      get :index
      response.should be_success
    end
    
    it "orders tickets with the most recently created first" do
      Ticket.should_receive(:order).with("id desc")
      get :index
    end
    
    it "accepts pagination parameters" do
      Ticket.order.should_receive(:page).with('2')
      get :index, :page => '2'
    end
    
    it "lists only 30 tickets per grid page" do
      Ticket.order.page.should_receive(:per).with(30)
      get :index
    end
  end
  
  describe "POST create" do   
    let(:ticket) { mock_model(Ticket).as_null_object }
    
    before do
      Ticket.stub(:new).and_return(ticket)
    end
    
    it "creates a new ticket of the correct type" do
      Ticket.should_receive(:new).
        with("title" => "Title",
             "description" => "Desc").
        and_return(ticket)

      ticket.should_receive(:type=).with("Bug")
      post :create, :ticket => {:title => "Title", :description => "Desc"}, :type => "Bug"
    end
    
    context "when the ticket saves successfully" do
      before do
        ticket.stub(:save).and_return(true)
        ticket.stub(:type).and_return("Bug")
      end
      
      it "sets a flash[:notice] message" do
        post :create, :ticket => {:title => "Title", :description => "Desc"}, :type => "Bug"
        flash[:notice].should eq("Bug was successfully created.")
      end
      
      it "redirects to the tickets index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end
    
    context "when the ticket fails to save" do
      before do
        ticket.stub(:save).and_return(false)
        ticket.stub(:type).and_return("Bug")
      end
      
      it "assigns @ticket" do
        post :create
        assigns[:ticket].should eq ticket
      end
      
      it "renders the 'new' template for the relevant ticket type" do
        post :create
        response.should redirect_to(:action => "new", :type => "Bug")
      end
    end
    
  end
  
  describe "GET edit" do
    let(:ticket) { mock_model(Ticket).as_null_object }
    
    before do
      Ticket.stub(:find_by_id).and_return(ticket)
    end
    
    it "assigns @ticket" do
      Ticket.should_receive(:find_by_id).with('1').and_return(ticket)
      get :edit, :id => '1'
      assigns[:ticket].should eq ticket
    end
  end
  
  describe "PUT update" do
    let(:ticket) { mock_model(Ticket).as_null_object }
    
    before do
      Ticket.stub(:find_by_id).and_return(ticket)
      Ticket.stub_chain(:state_events, :include?)
      ticket.stub(:type).and_return("Bug")
      ticket.stub(:update_attributes).and_return(true)
    end
    
    it "finds the ticket to update" do
      Ticket.should_receive(:find_by_id).with('1').and_return(ticket)
      put :update, :id => '1', :event => { "fire" => "close" }
      assigns[:ticket].should eq ticket
    end
    
    it "checks the new event is valid" do
      ticket.state_events.include?.should_receive(:close)
      put :update, :id => '1', :event => { "fire" => "close" }
    end
    
    it "updates the attributes for the correct ticket type" do
      ticket.should_receive(:update_attributes).with("bug_params")
      put :update, :id => '1', :bug => "bug_params", :event => { "fire" => "close" }
    end
    
    context "when the ticket updates successfully" do      
      it "sets a flash[:notice] message" do
        put :update, :id => '1', :event => { "fire" => "close" }
        flash[:notice].should eq("Bug was successfully updated.")
      end
      
      it "redirects to the tickets index" do
        put :update, :id => '1', :event => { "fire" => "close" }
        response.should redirect_to(:action => "index")
      end
    end
    
    context "when the ticket fails to update" do
      before do
        ticket.stub(:update_attributes).and_return(false)
      end
      
      it "renders the 'edit' template" do
        put :update, :id => '1', :event => { "fire" => "close" }
        response.should render_template("edit")
      end
    end
  end

end
