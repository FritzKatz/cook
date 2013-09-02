# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/ then
      '/'
      # users_path

    when /^the signin\s?page$/ then
      '/signin'
      # signin_path

    when /^the sessions\s?page$/ then
      '/sessions'
      # sessions_path      

    when /^the index page$/
      #'/index'
      index_path 

    when /^the new user page$/
      '/new'
      # new_user_path

    when /^the users page$/
      #'/users'
      users_path  

    when /^the edit page for "([^"]+)"$/
      edit_user_path(User.find_by_name($1).id)

    when /^the users page for "([^"]+)"$/
      user_path(User.find_by_name($1).id) 


    when /^the recipe index page$/
      recie_index_path  
    when /^the topdf page$/
      topdf_path
    when /^the recipes page$/
      recipes_path
    when /^the preview page$/
      preview_path      
     
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)