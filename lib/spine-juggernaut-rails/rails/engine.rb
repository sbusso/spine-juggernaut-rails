module SpineJuggernautRails
  begin
    class Engine < ::Rails::Engine

    	observers = config.active_record.observers || []
    	config.active_record.observers = observers.is_a?(Array) ? observers << :juggernaut_observer : [observers, :juggernaut_observer]
    	config.to_prepare do |app|
    		SpineJuggernautRails.config do |juggernaut|
	    		observee = juggernaut.observe.is_a?(Array) ? juggernaut.observe : [juggernaut.observe]
					observee.each do |model_symbol|
						model = model_symbol.to_s.split("_").collect(&:capitalize).join.constantize
						model.send :attr_accessor, :session_id
    				# test .instance_variables include?(:session_id)
					end

					juggernaut.channel ||= '/observer' 
					juggernaut.host ||= 'localhost'
					juggernaut.port ||= 'port' 
				end
    	end

    end
  rescue NameError
  end
end