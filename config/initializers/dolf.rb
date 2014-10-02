module Dolf
  def self.config
    @config ||= (YAML.load_file('./config/dolf.yml')[Rails.env] || {})
  end
end