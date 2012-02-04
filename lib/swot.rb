require 'public_suffix'

module Swot
  VERSION = "0.1.0"

  # These top-level domains are guaranteed to be academic instituions.
  ACADEMIC_TLDS = [
    'ac.uk',
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
      text = text.split("@")[1] if text.include? "@"
      domain = PublicSuffix.parse(text)

      if ACADEMIC_TLDS.include?(domain.tld)
        true
      elsif match_academic_domain?(domain)
        true
      else
        false
      end

    end

    # Figure out if a domain name is a know academic institution.
    #
    # Returns true if the domain name belongs to a known academic instition;
    #  false otherwise.
    def match_academic_domain?(domain)
      File.exists?("lib/domains/#{domain.tld}/#{domain.sld}")
    end
  end
end