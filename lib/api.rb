require 'httparty'

module Todoable
    class Api
        include HTTParty
        base_uri 'http://todoable.teachable.tech/api'

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
            username = ENV["username"]
            password = ENV["password"]
            
            if username.nil? || password.nil?
                puts "set 'username' and 'password' as environment variables."
                puts "exiting"
                exit
            end
            auth = {username: username, password: password }
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

api = Todoable::Api.new
list = '{"list": {"name": "test5"}}'
api.create(list)
puts api.lists
# puts api.get("478a076a-0202-44af-935d-3f13d263cfa7")
# list2 = '{"list": {"name": "Not so urgent anymore"}}'
# #puts api.patch("478a076a-0202-44af-935d-3f13d263cfa7", list2)
# puts api.delete("fdc0cef5-289a-4a5b-bca4-3700ad29d30a")

# item = '{"item": {"name": "Feed the cat"}}'
# puts api.create_item("6158102f-a64a-47ae-97ed-bc6c7996f1dd", item)

puts api.delete_item("6158102f-a64a-47ae-97ed-bc6c7996f1dd", "a0bdce90-f18b-45ae-af31-cdcfaa21bf53")