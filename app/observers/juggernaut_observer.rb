class JuggernautObserver < ActiveRecord::Observer
    observe SpineJuggernautRails.config.register

    def after_create(rec)
      publish(:create, rec)
    end
    
    def after_update(rec)
      publish(:update, rec)
    end
    
    def after_destroy(rec)
      publish(:destroy, rec)
    end
    
    protected
      def publish(type, rec)
        # p "observer publish on juggernaut"
        Juggernaut.publish(
          "/observer", #TODO: channel parameter
          { 
            type:   type, 
            id:     rec.id, 
            class:  "App."+rec.class.name, 
            record: rec
           },
          :except => rec.session_id
        )
      end
end