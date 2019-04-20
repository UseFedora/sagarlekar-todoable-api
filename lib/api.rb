require 'httparty'

module Todoable
    class Api
        include HTTParty
        base_uri 'http://todoable.teachable.tech/api'

        attr_accessor :token
        
        def initialize
            
        end

        def lists
            self.class.get("/lists", :headers=>headers)
        end
        
        def create(list)
            self.class.post("/lists", :body=> list , :headers=>headers)  
        end
        
        def get(id)
            self.class.get("/lists/#{id}", :headers=>headers)  
        end
        
        def get(id)
            self.class.get("/lists/#{id}", :headers=>headers)  
        end
        
        def patch(id, list)
            self.class.patch("/lists/#{id}", :body=> list, :headers=>headers)  
        end
        
        def delete(id)
            self.class.delete("/lists/#{id}",:headers=>headers)  
        end
        
        def create_item(id, item)
            self.class.post("/lists/#{id}/items", :body=> item , :headers=>headers)  
        end
        
        def finish_item(id, item_id)
            self.class.put("/lists/#{id}/items/#{item_id}/finish", :headers=>headers)  
        end
        
        def delete_item(id, item_id)
            self.class.delete("/lists/#{id}/items/#{item_id}", :headers=>headers)  
        end
        
      
        def finish_item(id, item_id)
            self.class.put("/lists/#{id}/items/#{item_id}/finish", :headers=>headers)  
        end
        
        private
        def headers
            {
                'Content-Type' => 'application/json', 
                'Accept' => 'application/json',
                'Authorization' => "Token token=\"#{token}\""
            } 
        end
        
                
        def basic_auth_token
            user = "sagar.arlekar@gmail.com"
            password = "todoable"
            auth = {username: user, password: password }
            options = {}
            options.merge!({ basic_auth: auth })
            headers = {
                'Content-Type' => 'application/json', 
                'Accept' => 'application/json'
            }
            options.merge!({ basic_auth: auth })
            options.merge!({headers: headers})
            response = self.class.post('/authenticate', options)
            @token = response.parsed_response["token"]
        end
        
        def token
            @token ||= basic_auth_token
        end
        
    end
end

