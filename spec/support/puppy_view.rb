class PuppyView
  include Capybara::DSL
  include RSpec::Matchers
  def take_puppy (comment=nil)
    fill_in 'puppy_comments',:with=> comment
    click_button 'Take the puppy'
  end   
  def leave_puppy(comment=nil)
    fill_in 'left_comment',:with=> comment
    click_button 'Leave the puppy'
  end

  def verify_i_have_the_puppy()
    page.should have_content 'You have taken the puppy'
  end

end
