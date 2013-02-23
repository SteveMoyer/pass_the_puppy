class PuppiesController < ApplicationController
  before_filter :authenticate_user!
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
    @puppy.owner
    respond_to do |format|
      format.html 
      format.xml {render :xml=> @puppy.to_xml}
      format.json {render :json=> @puppy.as_json({:include =>[:owner]})}
    end
  end
  
  def index
    @puppylist=true
    @puppies = Puppy.all
    respond_to do |format|
      format.html 
      format.xml {render :xml=> @puppies.to_xml}
      format.json {render :json=> @puppies.to_json}
    end
  end 
  
  def take
    @puppy =Puppy.find(params[:id])
    if @puppy.can_take_puppy? current_user
      @puppy.update_attributes( params[:puppy])
      @puppy.take(current_user)
      if @puppy.save!
        flash.now.notice= 'You have taken the puppy'
      else
        flash.alert='You didn\'t get the puppy'
      end
    else
      flash.now.alert= 'The puppy is not available'
    end
    render "show"
  end
 
  def leave
    @puppy=Puppy.find(params[:id])
    if @puppy.leave current_user, params[:left_comment]
      @puppy.save
      flash.now.notice = 'You returned the puppy.'
    else
      flash.now.alert = 'To leave the puppy you must have the puppy.  If you think the puppy is lost contact an admin'
    end
    render "show"
  end 
end
