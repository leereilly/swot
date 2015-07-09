require 'helper'
require 'fileutils'
require 'tmpdir'

describe 'SwotCollectionMethods' do
  before do
    @tmp_dir = Dir.mktmpdir "swot-test"
    Swot.instance_variable_set(:@domains_path, @tmp_dir)
    write_domain_file "students.texas.edu"
    write_domain_file "mit.edu"
  end

  after do
    FileUtils.remove_entry @tmp_dir
  end

  def write_domain_file(domain, school_name = 'The University')
    parts = domain.split('.').reverse
    parts.last.concat('.txt')
    path = Pathname.new(@tmp_dir).join(*parts)
    path.dirname.mkpath
    path.open('w') { |f| f.puts school_name }
  end

  describe 'all_domains' do
    it 'gets all domains from files on disk' do
      all_domains = Swot.all_domains
      assert_equal all_domains.size, 2
      assert_includes all_domains, "students.texas.edu"
      assert_includes all_domains, "mit.edu"
    end
  end

  describe 'each_domain' do
    it 'yields a swot instance for every domain file' do
      domains = []
      Swot.each_domain { |d| domains << d }
      assert_equal domains.size, 2
      assert_equal true, domains.all?{ |d| d.is_a? Swot }
      assert_includes domains.map(&:to_s), "students.texas.edu"
      assert_includes domains.map(&:to_s), "mit.edu"
    end
  end
end
