class PuppiesController < ApplicationController

  def new 
    @puppy=Puppy.new
  end
  def create
    @puppy = Puppy.new params[:puppy]
    if  @puppy.save
      redirect_to  @puppy
    else
      @errors= @puppy.errors 
      render :new
    end

  end 
  def show
    @puppy = Puppy.find(params[:id])
  end
  def index
    @puppylist=true
    @puppies = Puppy.all
  end 
  def take
    @puppy =Puppy.find(params[:id])
    if !@puppy.owner
      @puppy.owner =current_user
      @puppy.update_attributes( params[:puppy])
      @puppy.taken_time=Time.now
      @puppy.save
      flash.now.alert= 'You have taken the puppy'
    else
      flash.now.alert= 'The puppy is not available'
    end
    redirect_to @puppy

  end
  def leave
    @puppy=Puppy.find(params[:id])
    if @puppy.owner==current_user || current_user.is_admin
      puts @puppy.owner
      ph=PuppyHistory.new
      ph.update_attributes({:user => @puppy.owner,:taken_time=>@puppy.taken_time, :left_time=> Time.now,:take_comment=>@puppy.comments, :leave_comment=> params[:left_comment]})
      @puppy.puppy_history<<ph
      @puppy.owner=nil
      @puppy.comments=nil 
      @puppy.save
      flash.now.alert = 'You returned the puppy.'
    else
      flash.now.alert = 'To leave the puppy you must have the puppy.  If you think the puppy is lost contact an admin'
    end
    redirect_to  @puppy

  end 
end
