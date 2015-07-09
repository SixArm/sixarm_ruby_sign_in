# SixArm.com » Ruby » <br> SignIn interface for typical Rails user

[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_sign_in.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_sign_in)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_sign_in.png)](https://travis-ci.org/SixArm/sixarm_ruby_sign_in)

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

    gem "sixarm_ruby_sign_in", ">=1.1.6", "<2"

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
