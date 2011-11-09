class TodolistsController < ApplicationController
  # GET /todolists
  # GET /todolists.json
  def index
    @todolists = Todolist.all

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
        format.html { redirect_to @todolist, notice: 'Todolist was successfully created.' }
        format.json { render json: @todolist, status: :created, location: @todolist }
      else
        format.html { render action: "new" }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
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
    end
  end
end
