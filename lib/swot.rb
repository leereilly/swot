require 'public_suffix'

module Swot
  VERSION = "0.1.0"

  # These top-level domains are guaranteed to be academic instituions.
  ACADEMIC_TLDS = [
    'ac.ae',
    'ac.at',
    'ac.bd',
    'ac.be',
    'ac.cr',
    'ac.cy',
    'ac.fj',
    'ac.id',
    'ac.il',
    'ac.ir',
    'ac.jp',
    'ac.ke',
    'ac.kr',
    'ac.ma',
    'ac.mu',
    'ac.mw',
    'ac.mz',
    'ac.nz',
    'ac.pa',
    'ac.pg',
    'ac.rs',
    'ac.ru',
    'ac.rw',
    'ac.th',
    'ac.tz',
    'ac.ug',
    'ac.uk',
    'ac.yu',
    'ac.za',
    'ac.zm',
    'ac.zw',
    'edu',
    'edu.af',
    'edu.al',
    'edu.ar',
    'edu.au',
    'edu.az',
    'edu.ba',
    'edu.bb',
    'edu.bd',
    'edu.bh',
    'edu.bi',
    'edu.bn',
    'edu.bo',
    'edu.br',
    'edu.bs',
    'edu.bt',
    'edu.bz',
    'edu.cn',
    'edu.co',
    'edu.cu',
    'edu.do',
    'edu.dz',
    'edu.ec',
    'edu.ee',
    'edu.eg',
    'edu.er',
    'edu.es',
    'edu.et',
    'edu.ge',
    'edu.gh',
    'edu.gr',
    'edu.gt',
    'edu.hk',
    'edu.hn',
    'edu.ht',
    'edu.iq',
    'edu.jm',
    'edu.jo',
    'edu.kg',
    'edu.kh',
    'edu.kn',
    'edu.kw',
    'edu.ky',
    'edu.kz',
    'edu.la',
    'edu.lb',
    'edu.lv',
    'edu.ly',
    'edu.mk',
    'edu.mm',
    'edu.mn',
    'edu.mo',
    'edu.mt',
    'edu.mx',
    'edu.my',
    'edu.ni',
    'edu.np',
    'edu.om',
    'edu.pa',
    'edu.pe',
    'edu.ph',
    'edu.pk',
    'edu.pl',
    'edu.pr',
    'edu.ps',
    'edu.pt',
    'edu.py',
    'edu.qa',
    'edu.rs',
    'edu.ru',
    'edu.sa',
    'edu.sd',
    'edu.sg',
    'edu.sv',
    'edu.sy',
    'edu.tr',
    'edu.tt',
    'edu.tw',
    'edu.ua',
    'edu.uy',
    'edu.ve',
    'edu.vn',
    'edu.ws',
    'edu.ye',
    'edu.zm',
    'vic.edu.au'
    ]

  class << self

    # Figure out if an email or domain belongs to academic instituion.
    #
    # Returns true if the domain name belongs to an academic institution;
    #  false oterwise.
    def is_academic?(text)
      return false if text.nil?
      begin
        domain = get_domain(text)
        return false if domain.nil?

        if ACADEMIC_TLDS.include?(domain.tld)
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

    # Figure out the institution name based on the email address/domain.
    #
    # Returns a string with the instution name; nil if nothing is found.
    def get_institution_name(text)
      text.downcase!
      text = text.split("@")[1] if text.include? "@"
      domain = PublicSuffix.parse(text)
      name_from_academic_domain(domain)
    end

    # Figure out if a domain name is a know academic institution.
    #
    # Returns true if the domain name belongs to a known academic instition;
    #  false otherwise.
    def match_academic_domain?(domain)
      File.exists?("#{File.expand_path(__FILE__+'/..')}/domains/#{domain.tld}/#{domain.sld}")
    end

    # Figure out the insitutions' name based on the domain name.
    #
    # Return the institution name, or nil if not found.
    def name_from_academic_domain(domain)
      begin
        file = File.open("#{File.expand_path(__FILE__+'/..')}/domains/#{domain.tld}/#{domain.sld}", "rb")
        contents = file.read
        contents.strip!
        return contents
      rescue
        return nil
      end
    end

    # Get the FQDN name from a URL or email address.
    #
    # Returns a string with the FQDN; nil if there's an error.
    def get_domain(text)
      return false if text.nil?
      text.downcase!
      text = text.split("@")[1] if text.include? "@"

      begin
        domain = PublicSuffix.parse(text)
        return domain
      rescue
        return nil
      end
    end
  end
end