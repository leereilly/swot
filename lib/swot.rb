require "public_suffix"
require "naughty_or_nice"
require_relative "swot/academic_tlds"

class Swot < NaughtyOrNice
  VERSION = "0.4.2"

  # These are domains that snuck into the edu registry,
  # but don't pass the education sniff test
  # Note: validated domain must not end with the blacklisted string
  BLACKLIST = %w(
    si.edu
    america.edu
    californiacolleges.edu
    australia.edu
    cet.edud
  ).freeze

  class << self
    alias_method :is_academic?, :valid?
    alias_method :academic?, :valid?

    def get_institution_name(text)
      Swot.new(text).institution_name
    end
    alias_method :school_name, :get_institution_name

    def domains_path
      @domains_path ||= File.expand_path "domains", File.dirname(__FILE__)
    end
  end

  # Figure out if an email or domain belongs to academic institution.
  #
  # Returns true if the domain name belongs to an academic institution;
  #  false otherwise.
  def valid?
    if domain.nil? || domain_parts.nil?
      false
    elsif BLACKLIST.any? { |d| domain =~ /(\A|\.)#{Regexp.escape(d)}\z/ }
      false
    elsif ACADEMIC_TLDS.include?(domain_parts.tld)
      true
    elsif academic_domain?
      true
    else
      false
    end
  end

  # Figure out the institution name based on the email address/domain.
  #
  # Returns a string with the institution name; nil if nothing is found.
  def institution_name
    @institution_name ||= File.read(file_path, :mode => "rb", :external_encoding => "UTF-8").strip
  rescue
    nil
  end
  alias_method :school_name, :institution_name
  alias_method :name, :institution_name

  # Figure out if a domain name is a know academic institution.
  #
  # Returns true if the domain name belongs to a known academic institution;
  #  false otherwise.
  def academic_domain?
    @academic_domain ||= File.exists?(file_path)
  end

  private

  def file_path
    @file_path ||= File.join(Swot::domains_path, domain_parts.domain.to_s.split(".").reverse) + ".txt"
  end
end
