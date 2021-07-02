module RailsAdmin
    module Config
      module Actions
        # common config for custom actions
        class Customaction < RailsAdmin::Config::Actions::Base
          register_instance_option :member do  #	this is for specific record
            true
          end
          register_instance_option :pjax? do
            false
          end
          register_instance_option :visible? do
            authorized? 		# This ensures the action only shows up for the right class
          end
        end
        class Foo < Customaction
            RailsAdmin::Config::Actions.register(self)
            register_instance_option :foo do
              true
            end
            register_instance_option :link_icon do
              'fa fa-paper-plane' # use any of font-awesome icons
            end
            register_instance_option :http_methods do
              [:get, :post]
            end
            register_instance_option :controller do
              Proc.new do
                # call model.method here
                flash[:notice] = "Did custom action on #{@object.name}"
                redirect_to back_or_index
              end
            end
          end
        class Bar < Customaction
            
        end
        class Collection < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
          register_instance_option :collection do
            true	#	this is for all records in specific model
          end
          
        end
        class Root < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
          register_instance_option :root do
            true	#	this is for all records in all models
          end
          
        end
      end
    end
    def load_roots  
      @roots_default = Gmaps4rails.build_markers(Root.all) do |plot, marker|  
         marker.lat plot.latitude  
         marker.lng plot.longitude  
   
         @status = rand(1..4)  
         @battery = rand(10..90)  
         @ip = "192.168."+rand(0..255).to_s+"."+rand(15..250).to_s  
         @connected = rand(50..100)  
   
         if @status == 1  
           url_alert = "/good.png"  
           @status == "Normal"  
         else  
           url_alert = "/alert.png"  
         end  
   
         marker.picture({  
           "url" => url_alert,  
           "width" => 35,  
           "height" => 30  
         })  
   
         marker.infowindow render_to_string(:partial => "/root/info",   
           :locals => {:name => plot.name, :battery => @battery, :date => rand(6.months.ago..Time.now), :ip => @ip, :connected => @connected })  
      end  
    end
   
   def index  
      load_roots  
   
      @roots = Root.all  
   end
  end