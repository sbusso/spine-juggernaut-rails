require 'spine-juggernaut-rails/rails/engine'


module SpineJuggernautRails

	def self.config(&block)
    @@config ||= SpineJuggernautRails::Engine::Configuration.new
    yield @@config if block
    return @@config
  end
end

