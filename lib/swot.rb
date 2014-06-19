require 'public_suffix'
require 'set'

module Swot
  VERSION = "0.3.0"

  # These top-level domains are guaranteed to be academic institutions.
  ACADEMIC_TLDS = %w(
    ac.ae
    ac.at
    ac.bd
    ac.be
    ac.cr
    ac.cy
    ac.fj
    ac.id
    ac.il
    ac.ir
    ac.jp
    ac.ke
    ac.kr
    ac.ma
    ac.mu
    ac.mw
    ac.mz
    ac.nz
    ac.pa
    ac.pg
    ac.rs
    ac.ru
    ac.rw
    ac.th
    ac.tz
    ac.ug
    ac.uk
    ac.yu
    ac.za
    ac.zm
    ac.zw
    edu
    edu.af
    edu.al
    edu.ar
    edu.au
    edu.az
    edu.ba
    edu.bb
    edu.bd
    edu.bh
    edu.bi
    edu.bn
    edu.bo
    edu.br
    edu.bs
    edu.bt
    edu.bz
    edu.co
    edu.cu
    edu.do
    edu.dz
    edu.ec
    edu.ee
    edu.eg
    edu.er
    edu.es
    edu.et
    edu.ge
    edu.gh
    edu.gr
    edu.gt
    edu.hk
    edu.hn
    edu.ht
    edu.iq
    edu.jm
    edu.jo
    edu.kg
    edu.kh
    edu.kn
    edu.kw
    edu.ky
    edu.kz
    edu.la
    edu.lb
    edu.lv
    edu.ly
    edu.mk
    edu.mm
    edu.mn
    edu.mo
    edu.mt
    edu.mx
    edu.my
    edu.ni
    edu.np
    edu.om
    edu.pa
    edu.pe
    edu.ph
    edu.pk
    edu.pl
    edu.pr
    edu.ps
    edu.pt
    edu.py
    edu.qa
    edu.rs
    edu.ru
    edu.sa
    edu.sd
    edu.sg
    edu.sv
    edu.sy
    edu.tr
    edu.tt
    edu.tw
    edu.ua
    edu.uy
    edu.ve
    edu.vn
    edu.ws
    edu.ye
    edu.zm
    vic.edu.au
  ).to_set.freeze

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
