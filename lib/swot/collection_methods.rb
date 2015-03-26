# Module for methods that act on the entire Swot dataset.

module SwotCollectionMethods

  # Parses the files under lib/domains. Does not include blacklist or
  #   ACADEMIC_TLDS in results.
  #
  # Returns an array of domain strings.
  def all_domains
    all_domains = []
    swot_data_path = Pathname.new(Swot.domains_path)
    Pathname.glob(swot_data_path.join('**/*.txt')) do |path|
      path_dir, file = path.relative_path_from(swot_data_path).split
      backwards_path = path_dir.to_s.split('/').push(file.basename('.txt').to_s)
      all_domains << backwards_path.reverse.join('.')
    end
    all_domains
  end

  # Yields a Swot instance for every domain under lib/domains
  def each_domain
    Pathname.glob(Pathname.new(Swot.domains_path).join('**/*.txt')) do |path|
      yield(Swot.from_path(path))
    end
  end
end
