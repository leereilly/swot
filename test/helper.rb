require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'minitest/autorun'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'swot'

# Extracted from Rails ActiveSupport::Testing::Assertions
#
# Assert that an expression is not truthy. Passes if <tt>object</tt> is
# +nil+ or +false+. "Truthy" means "considered true in a conditional"
# like <tt>if foo</tt>.
#
#   assert_not nil    # => true
#   assert_not false  # => true
#   assert_not 'foo'  # => Expected "foo" to be nil or false
#
# An error message can be specified.
#
#   assert_not foo, 'foo should be false'
def assert_not(object, message = nil)
  message ||= "Expected #{mu_pp(object)} to be nil or false"
  assert !object, message
end
