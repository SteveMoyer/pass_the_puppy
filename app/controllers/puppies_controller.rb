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
    if @puppy.can_take_puppy? current_user
      @puppy.update_attributes( params[:puppy])
      @puppy.take(current_user)
      if @puppy.save!
        flash.now.alert= 'You have taken the puppy'
      else
        flash.alert='You didn\'t get the puppy'
      end
    else
      flash.now.alert= 'The puppy is not available'
    end
    redirect_to @puppy

  end
 
  def leave
    @puppy=Puppy.find(params[:id])
    if @puppy.leave current_user, params[:left_comment]
      @puppy.save
      flash.now.alert = 'You returned the puppy.'
    else
      flash.now.alert = 'To leave the puppy you must have the puppy.  If you think the puppy is lost contact an admin'
    end
    redirect_to  @puppy

  end 
end
