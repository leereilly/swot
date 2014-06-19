require "public_suffix"
require File.join(File.dirname(__FILE__), "swot", "academic_tlds.rb")

module Swot
  VERSION = "0.3.0"

  # These are domains that snuck into the edu registry,
  # but don't pass the education sniff test
  # Note: validated domain must not end with the blacklisted string
  BLACKLIST = %w(
    si.edu
  ).freeze

  class << self

    # Figure out if an email or domain belongs to academic institution.
    #
    # Returns true if the domain name belongs to an academic institution;
    #  false otherwise.
    def is_academic?(text)
      return false if text.nil?
      begin
        domain = get_domain(text)
        if domain.nil?
          false
        elsif BLACKLIST.any? { |d| domain.name =~ /(\A|\.)#{Regexp.escape(d)}\z/ }
          false
        elsif ACADEMIC_TLDS.include?(domain.tld)
          true
        elsif match_academic_domain?(domain)
          true
        else
          false
        end

      rescue PublicSuffix::DomainInvalid => di
        return false

      rescue PublicSuffix::DomainNotAllowed => dna
        return false
      end
    end
    alias_method :academic?, :is_academic?

    # Figure out the institution name based on the email address/domain.
    #
    # Returns a string with the institution name; nil if nothing is found.
    def get_institution_name(text)
      name_from_academic_domain(get_domain(text))
    end
    alias_method :school_name, :get_institution_name

    # Figure out if a domain name is a know academic institution.
    #
    # Returns true if the domain name belongs to a known academic institution;
    #  false otherwise.
    def match_academic_domain?(domain)
      File.exists?(get_path(domain)) if domain.tld && domain.sld
    end

    # Figure out the institutions' name based on the domain name.
    #
    # Return the institution name, or nil if not found.
    def name_from_academic_domain(domain)
      begin
        File.read(get_path(domain), :mode => "rb", :external_encoding => "UTF-8").strip
      rescue
        return nil
      end
    end

    # Get the FQDN name from a URL or email address.
    #
    # Returns a string with the FQDN; nil if there's an error.
    def get_domain(text)
      PublicSuffix.parse text.strip.downcase.match(domain_regex).captures.first
    rescue
      return nil
    end

    def get_path(domain)
      File.join(File.dirname(__FILE__), "domains", domain.tld, domain.sld)
    end

    private

    # http://rubular.com/r/uW2GqSxvqD
    def domain_regex
      /([^@\/:]+)[:\d]*$/
    end
  end
end
