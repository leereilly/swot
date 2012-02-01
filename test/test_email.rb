require 'helper'

class TestEmail < Test::Unit::TestCase
  should "know what a valid educational institution email address is" do
    assert_equal Email::academic?('lreilly@stanford.edu'),          true
    assert_equal Email::academic?('lreilly@slac.stanford.edu'),     true
    assert_equal Email::academic?('lreilly@strath.ac.uk'),          true
    assert_equal Email::academic?('lreilly@soft-eng.strath.ac.uk'), true
    assert_equal Email::academic?('lee@ugr.es'),                    true
    assert_equal Email::academic?('lee@uottawa.ca'),                true
    assert_equal Email::academic?('lee@leerilly.net'),              false
    assert_equal Email::academic?('lee@gmail.com'),                 false
    assert_equal Email::academic?('lee@stanford.edu.com'),          false
    assert_equal Email::academic?('lee@strath.ac.uk.com'),          false
  end

  should "should populate academic domains" do
    Email::populate_academic_domains
  end
end
