require 'helper'

class TestEmail < Test::Unit::TestCase
  should "know what a valid acadmic institution email address or domain is" do
    assert_equal Swot::is_academic?('lreilly@stanford.edu'),          true
    assert_equal Swot::is_academic?('lreilly@slac.stanford.edu'),     true
    assert_equal Swot::is_academic?('lreilly@strath.ac.uk'),          true
    assert_equal Swot::is_academic?('lreilly@soft-eng.strath.ac.uk'), true
    assert_equal Swot::is_academic?('lee@ugr.es'),                    true
    assert_equal Swot::is_academic?('lee@uottawa.ca'),                true
    assert_equal Swot::is_academic?('lee@mother.edu.ru'),             true
    assert_equal Swot::is_academic?('lee@ucy.ac.cy'),                 true

    assert_equal Swot::is_academic?('lee@leerilly.net'),              false
    assert_equal Swot::is_academic?('lee@gmail.com'),                 false
    assert_equal Swot::is_academic?('lee@stanford.edu.com'),          false
    assert_equal Swot::is_academic?('lee@strath.ac.uk.com'),          false

    assert_equal Swot::is_academic?('stanford.edu'),          true
    assert_equal Swot::is_academic?('slac.stanford.edu'),     true
    assert_equal Swot::is_academic?('strath.ac.uk'),          true
    assert_equal Swot::is_academic?('soft-eng.strath.ac.uk'), true
    assert_equal Swot::is_academic?('ugr.es'),                    true
    assert_equal Swot::is_academic?('uottawa.ca'),                true
    assert_equal Swot::is_academic?('mother.edu.ru'),             true
    assert_equal Swot::is_academic?('ucy.ac.cy'),                 true

    assert_equal Swot::is_academic?('leerilly.net'),              false
    assert_equal Swot::is_academic?('gmail.com'),                 false
    assert_equal Swot::is_academic?('stanford.edu.com'),          false
    assert_equal Swot::is_academic?('strath.ac.uk.com'),          false

  end
end
