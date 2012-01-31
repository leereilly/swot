require 'public_suffix'

module Email
  VERSION = "0.1.0"

  ACADEMIC_TLDS = %w(edu ac.uk)
  ACADEMIC_DOMAINS = %w(ugr.es uottawa.ca)

  class << self
    def academic?(email)
      domain = PublicSuffix.parse(email.split("@")[1])

      if ACADEMIC_TLDS.include?(domain.tld)
        true
      elsif ACADEMIC_DOMAINS.include? (domain.domain)
        true
      else
        false
      end
    end
end
end