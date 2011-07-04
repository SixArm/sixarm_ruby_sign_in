# -*- coding: utf-8 -*-
require 'simplecov'
SimpleCov.start
require 'test/unit'
require 'sixarm_ruby_sign_in'

class SignInTest < Test::Unit::TestCase
  
  include SignIn
  
  RIGHT=:foo
  WRONG=:bar
  
  def setup
   @sign_in_attempt_seen=nil
   @sign_in_success_seen=nil
   @sign_in_failure_seen=nil
 end
  
  def test_sign_in_right
   user=RIGHT
   x=sign_in(user)
   assert( @sign_in_attempt_seen,"sign_in_attempt_seen user:#{user}")
   assert( @sign_in_success_seen,"sign_in_success_seen user:#{user}")
   assert(!@sign_in_failure_seen,"sign_in_failure_seen user:#{user}")
   assert_equal(true,x,"sign_in x:#{x}")
 end
  
  def test_sign_in_wrong
   user=WRONG
   x=sign_in(user)
   assert( @sign_in_attempt_seen,"sign_in_attempt seen user:#{user}")
   assert(!@sign_in_success_seen,"sign_in_success_seen user:#{user}")
   assert( @sign_in_failure_seen,"sign_in_failure_seen user:#{user}")
   assert_equal(false,x,"sign_in user:#{x}")
  end
  
  def sign_in_attempt(options=nil)
   @sign_in_attempt_seen=true
   if options==WRONG then raise SecurityError end
   return options==RIGHT
  end

  def sign_in_success(options=nil)
    @sign_in_success_seen=true
  end
  
  def sign_in_failure(options=nil)
   @sign_in_failure_seen=true
 end

end
