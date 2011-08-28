class PuppyController < ApplicationController
 
 def get_the_puppy()
     Puppy.find_by_id(1)
 end
 def view
  @puppy = get_the_puppy
 end
 def take
  @puppy =get_the_puppy
  if !@puppy.owner
   puppy.owner =current_user
   puppy.save
  end
 end
 def leave
  @puppy=get_the_puppy
  if @puppy.owner==current_user || current_user.is_admin
   @puppy.owner=nil
   @puppy.save
  end 
 end 
   

end
