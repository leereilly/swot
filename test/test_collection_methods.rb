require 'helper'
require 'fileutils'
require 'tmpdir'

describe 'SwotCollectionMethods' do
  before do
    @tmp_dir = Dir.mktmpdir "swot-test"
    Swot.instance_variable_set(:@domains_path, @tmp_dir)
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
      write_domain_file "students.texas.edu"
      write_domain_file "mit.edu"
      all_domains = Swot.all_domains
      assert_equal all_domains.size, 2
      assert_includes all_domains, "students.texas.edu"
      assert_includes all_domains, "mit.edu"
    end
  end
end
