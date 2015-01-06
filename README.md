# SixArm.com » Ruby » <br> SignIn interface for typical Rails user sign in

* Doc: <http://sixarm.com/sixarm_ruby_sign_in/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_sign_in>
* Repo: <http://github.com/sixarm/sixarm_ruby_sign_in>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Sign In simple abstract framework.

You can include this module in your application controller,
then your controller can define any of these concrete methods. 

For docs go to <http://sixarm.com/sixarm_ruby_sign_in/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_sign_in

Bundler:

    gem "sixarm_ruby_sign_in", "~>1.1.4"

Require:

    require "sixarm_ruby_sign_in"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_sign_in --trust-policy HighSecurity


## Details

This provides one top-level method:

    sign_in(options=nil) => true for success, false for failure

The top level method will call mid-level methods
that you will define in your own controller.

sign_in calls:

    sign_in_attempt(options=nil), e.g. authenticate and set current user
    sign_in_success(options=nil), e.g. redirect to a welcome page
    sign_in_failure(options=nil), e.g. flash notice help messesage


## AuthLogic Example

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

## Changes

* 2012-03-14 1.1.4 Update docs, tests
* 2010-10-02 1.1.4 Update for Ruby 1.9
## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2015 Joel Parker Henderson
