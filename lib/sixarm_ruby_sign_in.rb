# -*- coding: utf-8 -*-
=begin rdoc

= SixArm.com » Ruby » SignIn interface for typical Rails user sign in

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2011 Joel Parker Henderson
License:: See LICENSE.txt file

SignIn is a simple abstract framework for managing a user's web session.

Include this in your application controller, then define concrete methods.

This provides one top-level method:
  sign_in(options=nil) => true for success, false for failure

The top level method will call mid-level methods
that you will define in your own controller.

sign_in calls:
  sign_in_attempt(options=nil), e.g. authenticate and set current user
  sign_in_success(options=nil), e.g. redirect to a welcome page
  sign_in_failure(options=nil), e.g. flash notice help messesage

== AuthLogic Example

AuthLogic provides this example:
  def create
    # sign in attempt
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      # sign in success
      redirect_to account_url
    else
      # sign in failure
      render :action => :new
    end
  end

AuthLogic example refactored for improved security and structure:

  def sign_in_attempt
    @user_session = UserSession.new(params[:user_session])
    @user_session.save
  end

  def sign_in_success
    redirect_to account_url
  end

  def sign_in_failure
    render :action => :new
  end

=end



module SignIn


 # The sign_in method calls:
 # - sign_in_attempt
 # - sign_in_success (if sign_in_attempt returns true)
 # - sign_in_failure (if sign_in_attempt returns false or raises a SecurityError)

 def sign_in(options=nil)
   begin
    sign_in_attempt(options) or raise SecurityError
    sign_in_success(options)
    return true
   rescue SecurityError
    sign_in_failure(options)
    return false
   end
 end


 # The sign_in method calls this first.
 #
 # You override this method to e.g.:
 # - get a username and password from params
 # - find the user by username in the user model
 # - authenticate the user by verifying the password
 #
 # If this method succeeds, then control goes to sign_in_success.
 #
 # If this method raises an error, then control goes to sign_in_failure.
 
 def sign_in_attempt(options=nil)
 end


 # The sign_in method calls this second,
 # iff sign_in_attempt succeeds.
 #
 # You override this method to e.g.:
 # - show the user a flash notice message saying "Welcome..."
 # - redirect to the user's home page
 # - customize views based on the user's info

 def sign_in_success(options=nil)
 end


 # The sign_in method calls this second,
 # iff sign_in_attempt raises an exception.
 #
 # You override this method to e.g.:
 # - show the user a flash warning message saying "Sorry..."
 # - redirect to a help page 
 # - log the attempt and possibly see if it's a hacker

 def sign_in_failure(options=nil)
 end

end
