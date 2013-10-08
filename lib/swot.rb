require 'public_suffix'

module Swot
  VERSION = "0.1.0"

  # These top-level domains are guaranteed to be academic institutions.
  ACADEMIC_TLDS = {
    'ac.ae' => 1,
    'ac.at' => 1,
    'ac.bd' => 1,
    'ac.be' => 1,
    'ac.cr' => 1,
    'ac.cy' => 1,
    'ac.fj' => 1,
    'ac.id' => 1,
    'ac.il' => 1,
    'ac.ir' => 1,
    'ac.jp' => 1,
    'ac.ke' => 1,
    'ac.kr' => 1,
    'ac.ma' => 1,
    'ac.mu' => 1,
    'ac.mw' => 1,
    'ac.mz' => 1,
    'ac.nz' => 1,
    'ac.pa' => 1,
    'ac.pg' => 1,
    'ac.rs' => 1,
    'ac.ru' => 1,
    'ac.rw' => 1,
    'ac.th' => 1,
    'ac.tz' => 1,
    'ac.ug' => 1,
    'ac.uk' => 1,
    'ac.yu' => 1,
    'ac.za' => 1,
    'ac.zm' => 1,
    'ac.zw' => 1,
    'edu' => 1,
    'edu.af' => 1,
    'edu.al' => 1,
    'edu.ar' => 1,
    'edu.au' => 1,
    'edu.az' => 1,
    'edu.ba' => 1,
    'edu.bb' => 1,
    'edu.bd' => 1,
    'edu.bh' => 1,
    'edu.bi' => 1,
    'edu.bn' => 1,
    'edu.bo' => 1,
    'edu.br' => 1,
    'edu.bs' => 1,
    'edu.bt' => 1,
    'edu.bz' => 1,
    'edu.co' => 1,
    'edu.cu' => 1,
    'edu.do' => 1,
    'edu.dz' => 1,
    'edu.ec' => 1,
    'edu.ee' => 1,
    'edu.eg' => 1,
    'edu.er' => 1,
    'edu.es' => 1,
    'edu.et' => 1,
    'edu.ge' => 1,
    'edu.gh' => 1,
    'edu.gr' => 1,
    'edu.gt' => 1,
    'edu.hk' => 1,
    'edu.hn' => 1,
    'edu.ht' => 1,
    'edu.iq' => 1,
    'edu.jm' => 1,
    'edu.jo' => 1,
    'edu.kg' => 1,
    'edu.kh' => 1,
    'edu.kn' => 1,
    'edu.kw' => 1,
    'edu.ky' => 1,
    'edu.kz' => 1,
    'edu.la' => 1,
    'edu.lb' => 1,
    'edu.lv' => 1,
    'edu.ly' => 1,
    'edu.mk' => 1,
    'edu.mm' => 1,
    'edu.mn' => 1,
    'edu.mo' => 1,
    'edu.mt' => 1,
    'edu.mx' => 1,
    'edu.my' => 1,
    'edu.ni' => 1,
    'edu.np' => 1,
    'edu.om' => 1,
    'edu.pa' => 1,
    'edu.pe' => 1,
    'edu.ph' => 1,
    'edu.pk' => 1,
    'edu.pl' => 1,
    'edu.pr' => 1,
    'edu.ps' => 1,
    'edu.pt' => 1,
    'edu.py' => 1,
    'edu.qa' => 1,
    'edu.rs' => 1,
    'edu.ru' => 1,
    'edu.sa' => 1,
    'edu.sd' => 1,
    'edu.sg' => 1,
    'edu.sv' => 1,
    'edu.sy' => 1,
    'edu.tr' => 1,
    'edu.tt' => 1,
    'edu.tw' => 1,
    'edu.ua' => 1,
    'edu.uy' => 1,
    'edu.ve' => 1,
    'edu.vn' => 1,
    'edu.ws' => 1,
    'edu.ye' => 1,
    'edu.zm' => 1,
    'vic.edu.au' => 1,
  }

  class << self

    # Figure out if an email or domain belongs to academic institution.
    #
    # Returns true if the domain name belongs to an academic institution;
    #  false otherwise.
    def is_academic?(text)
      return false if text.nil?
      begin
        domain = get_domain(text)
        return false if domain.nil?

        if ACADEMIC_TLDS[domain.tld]
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
      File.exists?(get_path(domain))
    end

    # Figure out the institutions' name based on the domain name.
    #
    # Return the institution name, or nil if not found.
    def name_from_academic_domain(domain)
      begin
        File.read(get_path(domain), :mode => "rb").strip
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
