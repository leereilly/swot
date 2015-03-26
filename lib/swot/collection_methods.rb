# Module for methods that act on the entire Swot dataset.

module SwotCollectionMethods

  # Parses the files under lib/domains. Does not include blacklist or
  #   ACADEMIC_TLDS in results.
  #
  # Returns an array of domain strings.
  def all_domains
    each_domain.map(&:domain)
  end

  # Yields a Swot instance for every domain under lib/domains
  #
  # returns a Enumerator object with Swot instances if no block is given
  def each_domain
    return to_enum(:each_domain) unless block_given?
    Pathname.glob(Pathname.new(Swot.domains_path).join('**/*.txt')) do |path|
      yield(Swot.from_path(path))
    end
  end
end
