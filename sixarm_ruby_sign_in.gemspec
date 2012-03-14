Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_sign_in"
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

  SOURCES             = []
  TESTERS             = []

  s.files             = [".gemtest","Rakefile","README.md","LICENSE.txt"]
                        ["lib/#{s.name}.rb"] + SOURCES.map{|x| "lib/#{s.name}/#{x}.rb"} +
                        ["test/#{s.name}.rb"] + TESTERS.map{|x| "test/#{s.name}/#{x}"}
  s.test_files        = SOURCES.map{|x| "test/#{s.name}/#{x}_test.rb"}

end
