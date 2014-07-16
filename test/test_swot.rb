# encoding: UTF-8
require 'helper'

describe Swot do
  it "recognizes academic email addresses and domains" do
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
    assert_equal Swot::is_academic?('http://www.stanford.edu'),       true
    assert_equal Swot::is_academic?('http://www.stanford.edu:9393'),  true
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

    assert_equal Swot::is_academic?('lee@stud.uni-corvinus.hu'),      true
  end

  it "returns name of valid institution" do
    assert_equal Swot::get_institution_name('lreilly@cs.strath.ac.uk'), "University of Strathclyde"
    assert_equal Swot::get_institution_name('lreilly@fadi.at'), "BRG Fadingerstraße Linz, Austria"
  end

  it "returns nil when institution invalid" do
    assert_equal Swot::get_institution_name('foo@shop.com'), nil
  end

  it "test aliased methods" do
    assert_equal Swot::academic?('stanford.edu'), true
    assert_equal Swot::school_name('lreilly@cs.strath.ac.uk'), "University of Strathclyde"
  end

  it "fail blacklisted domains" do
    ["si.edu", " si.edu ", "imposter@si.edu", "foo.si.edu", "america.edu"].each do |domain|
      assert_equal false, Swot::is_academic?(domain), "#{domain} should be denied"
    end
  end

  it "not err on tld-only domains" do
    Swot::is_academic? ".com"
    assert_equal false, Swot::is_academic?(".com")
  end
end
