module SwotCollectionMethods
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
end
