class PuppyController < ApplicationController
 View_Puppy_Path ='/puppy/view'

 def get_puppy_status(puppy)
  if puppy.owner
    (puppy.owner ==current_user ? "You have ":puppy.owner.email+" has ") + "the puppy."
  else
    "The puppy is available."
  end   
 end
 def get_the_puppy()
     Puppy.find_by_id(1)
 end
 def view
  @puppy = get_the_puppy
  @puppy_status = get_puppy_status(@puppy)
  @puppy_comments = @puppy.comments
  @puppy_is_available= @puppy.owner==nil
  @can_take_puppy =  current_user && @puppy_is_available
  @can_leave_puppy = current_user && @puppy.owner &&(current_user==@puppy.owner ||current_user.is_admin)
 end
 def take
  @puppy =get_the_puppy
  if !@puppy.owner
   @puppy.owner =current_user
   @puppy.update_attributes( params[:puppy])
   @puppy.save
    flash.now.alert= 'You have taken the puppy'
  else
   flash.now.alert= 'The puppy is not available'
  end
  redirect_to View_Puppy_Path
  
 end
 def leave
  @puppy=get_the_puppy
  if @puppy.owner==current_user || current_user.is_admin
   @puppy.owner=nil
   @puppy.comments=nil 
   @puppy.save
   flash.now.alert = 'You returned the puppy.'

 else
  flash.now.alert = 'To leave the puppy you must have the puppy.  If you think the puppy is lost contact an admin'
 end
 redirect_to  View_Puppy_Path
 
 end 
end
