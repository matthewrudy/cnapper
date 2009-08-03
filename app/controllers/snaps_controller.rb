class SnapsController < ApplicationController
  def index
    @recent = Snap.find(:all, :order => "id DESC", :limit => 5)
  end

  def new
    @snap = Snap.new
  end

  def create
    @snap = Snap.new(params[:snap])

    if @snap.save
      redirect_to(@snap)
    else
      flash[:error] = "Failed to create Snap"
    end
  end

  def show
    @snap = Snap.find(params[:id])
  end

end
