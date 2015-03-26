# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference for more options
  gem.name                  = 'swot'
  gem.homepage              = 'https://github.com/leereilly/swot'
  gem.license               = 'MIT'
  gem.summary               = 'Identify email addresses or domains names that belong to colleges or universities.'
  gem.description           = 'Identify email addresses or domains names that belong to colleges or universities. Help automate the process of approving or rejecting academic discounts.'
  gem.email                 = 'lee@leereilly.net'
  gem.authors               = ['Lee Reilly']

  gem.required_ruby_version = Gem::Requirement.new('>= 2.0')
  gem.files.exclude *%w(.gitignore .travis.yml .ruby-version)
  gem.test_files            = gem.files.grep(/^test/)

  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "swot #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :add, :sld, :tld, :name do |t, args|
  file_path = "#{File.expand_path(__FILE__+'/..')}/lib/domains/#{args.tld}/#{args.sld}"
  if File.exists?(file_path)
    puts "already exists"
  elsif
    begin
      FileUtils.mkdir_p(File.dirname(file_path))
      File.open( file_path, "w" ) do |contents|
        contents.print args.name
      end
      `git add #{file_path}`
      `git commit -m "Add #{args.name}"`
      puts "commit successful"
    rescue
      puts "commit failed"
    end
  end
end

task :check_files do
  require './lib/swot'
  all_schools = {}
  swot_data_path = Pathname.new(Swot.domains_path)
  Pathname.glob(swot_data_path.join('**/*.txt')) do |path|
    path_dir, file = path.relative_path_from(swot_data_path).split
    backwards_path = path_dir.to_s.split('/').push(file.basename('.txt').to_s)
    unsanitized_school_name = path.readlines.first
    unless unsanitized_school_name.valid_encoding?
      puts "Invalid encoding for #{unsanitized_school_name} in #{path}"
    end
  end
end

task :quackit_import do
  require 'nokogiri'
  require 'open-uri'
  require_relative File.join('lib', 'swot', 'academic_tlds')

  new_domains = Set.new
  doc = Nokogiri::HTML(open('http://www.quackit.com/domain-names/country_domain_extensions.cfm'))
  doc.css('#content li').each do |li|
    desc = li.content.split(/\s+-\s+/, 2)[1]
    if desc =~ /academic|education|school/i
      domain_el = li.at_css('b')
      # some lines have more than one domain listed
      domains = domain_el.content.split(/\s*\/\s*/)
      domains.each do |domain|
        # remove leading space
        domain = domain.strip.sub(/\A\./, '')
        unless Swot::ACADEMIC_TLDS.include?(domain)
          # print out for manual review
          puts "#{domain} - #{desc.strip.gsub(/\s+/, ' ')}"
          new_domains << domain
        end
      end
    end
  end

  puts "\nNEW DOMAINS (#{new_domains.size}):\n\n"

  new_domains.each do |domain|
    puts domain
  end
end
