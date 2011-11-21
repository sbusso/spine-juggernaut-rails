module SpineJuggernautRails
  begin
    class Engine < ::Rails::Engine

    	initializer :load_config_initializers do |app| 
    		observers = app.config.active_record.observers || []
    		app.config.active_record.observers = observers.is_a?(Array) ? observers << :juggernaut_observer : [observers, :juggernaut_observer]
    		#SpineJuggernautRails.config.channel ||= '/observer' TODO: default value to channel
    	end

    end
  rescue NameError
  end

  def self.config(&block)
    @@config ||= SpineJuggernautRails::Engine::Configuration.new
    yield @@config if block
    return @@config
  end
end