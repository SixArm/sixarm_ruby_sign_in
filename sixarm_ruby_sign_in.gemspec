Gem::Specification.new do |s|

  NAME                = "sixarm_ruby_sign_in"
  SOURCES             = []
  TESTERS             = []

  s.name              = NAME
  s.summary           = "SixArm.com » Ruby » Sign In abstraction for a typical web app user"
  s.version           = "1.1.4"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true

  s.files             = [".gemtest","Rakefile","README.rdoc","LICENSE.txt"]
                        ["lib/#{NAME}.rb"] + SOURCES.map{|x| "lib/#{NAME}/#{x}.rb"} +
                        ["test/#{NAME}.rb"] + TESTERS.map{|x| "test/#{NAME}/#{x}"}
  s.test_files        = SOURCES.map{|x| "test/#{NAME}/#{x}_test.rb"}

end
