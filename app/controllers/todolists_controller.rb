class TodolistsController < ApplicationController
  # GET /todolists
  # GET /todolists.json
  before_filter :authenticate_user!
  after_filter :add_flash_to_header
  def index
    @todolists = Todolist.order("position")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todolists }
      
    end
  end

  # GET /todolists/1
  # GET /todolists/1.json
  def show
    @todolist = Todolist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todolist }
    end
  end

  # GET /todolists/new
  # GET /todolists/new.json
  def new
    @todolist = Todolist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todolist }
      format.js {}
    end
  end

  # GET /todolists/1/edit
  def edit
    @todolist = Todolist.find(params[:id])
  end

  # POST /todolists
  # POST /todolists.json
  def create
    @todolist = Todolist.new(params[:todolist])

    respond_to do |format|
      if @todolist.save
        flash[:notice]="Success"
        format.html { redirect_to @todolist, notice: 'Todolist was successfully created.' }
        format.json { render json: @todolist, status: :created, location: @todolist }
        format.js {  }
      else
        flash[:alert]="Unsuccessfull"
        format.html { render action: "new" }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
        format.js {    }
      end
    end
  end

  # PUT /todolists/1
  # PUT /todolists/1.json
  def update
    @todolist = Todolist.find(params[:id])

    respond_to do |format|
      if @todolist.update_attributes(params[:todolist])
        format.html { redirect_to @todolist, notice: 'Todolist was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todolists/1
  # DELETE /todolists/1.json
  def destroy
    @todolist = Todolist.find(params[:id])
    @todolist.destroy

    respond_to do |format|
      format.html { redirect_to todolists_url }
      format.json { head :ok }
      format.js {}
    end
  end
  
  
  def sort
    params[:todolist].each_with_index do |id ,index|
    Todolist.update_all({ position: index+1}, {id: id})
    end
    render :nothing=>true
    
    
  end
  
  
  def add_flash_to_header
      # only run this in case it's an Ajax request.
      return unless request.xhr?

      # add different flashes to header
      response.headers['X-Flash-Error'] = flash[:error] unless flash[:error].blank?
      response.headers['X-Flash-Warning'] = flash[:warning] unless flash[:warning].blank?
      response.headers['X-Flash-Notice'] = flash[:notice] unless flash[:notice].blank?
      response.headers['X-Flash-Message'] = flash[:message] unless flash[:message].blank?

      # make sure flash does not appear on the next page
      flash.discard
    end
  
  
end
