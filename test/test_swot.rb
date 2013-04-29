require 'helper'

class TestEmail < Test::Unit::TestCase
  should "recognizes academic email addresses and domains" do
    assert_equal Swot::is_academic?('lreilly@stanford.edu'),          true
    assert_equal Swot::is_academic?('LREILLY@STANFORD.EDU'),          true
    assert_equal Swot::is_academic?('Lreilly@Stanford.Edu'),          true
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

    assert_equal Swot::is_academic?('stanford.edu'),                  true
    assert_equal Swot::is_academic?('slac.stanford.edu'),             true
    assert_equal Swot::is_academic?('www.stanford.edu'),              true
    #assert_equal Swot::is_academic?('http://www.stanford.edu'),       true
    #assert_equal Swot::is_academic?('http://www.stanford.edu:9393'), true
    assert_equal Swot::is_academic?('strath.ac.uk'),                  true
    assert_equal Swot::is_academic?('soft-eng.strath.ac.uk'),         true
    assert_equal Swot::is_academic?('ugr.es'),                        true
    assert_equal Swot::is_academic?('uottawa.ca'),                    true
    assert_equal Swot::is_academic?('mother.edu.ru'),                 true
    assert_equal Swot::is_academic?('ucy.ac.cy'),                     true

    assert_equal Swot::is_academic?('leerilly.net'),                  false
    assert_equal Swot::is_academic?('gmail.com'),                     false
    assert_equal Swot::is_academic?('stanford.edu.com'),              false
    assert_equal Swot::is_academic?('strath.ac.uk.com'),              false

    assert_equal Swot::is_academic?(nil),                             false
    assert_equal Swot::is_academic?(''),                              false
    assert_equal Swot::is_academic?('the'),                           false

    assert_equal Swot::is_academic?(' stanford.edu'),                 true
    assert_equal Swot::is_academic?('lee@strath.ac.uk '),             true
    assert_equal Swot::is_academic?(' gmail.com '),                   false
  end

  should "returns name of valid institution" do
    assert_equal Swot::get_institution_name('lreilly@cs.strath.ac.uk'), "University of Strathclyde"
  end
end
