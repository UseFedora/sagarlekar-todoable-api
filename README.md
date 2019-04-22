# todoable-api
Interview Test - Ruby wrapper library for the http://todoable.teachable.tech/ API

We use httparty for API calls and RSpec for testing. All API endpoint wrapper methods in `Todoable::TodoableApi` return the httparty response object, it has to be used accordingly.

# TODO
* Obtian new token on token expiration 
* Pack this as a gem
* Write mocked tests for each Api method

# Setup 

```
gem install httparty
gem install rspec
```

Set the username and password as environment variables. These are used to obtain the authentication token. Ref http://todoable.teachable.tech/
``` 
export username=<username>
export passowrd=<password> 
```
  
# Usage
```
todoable_api = Todoable::TodoableApi.new
todoable_api.lists
```

# Test
```
cd todoable-api
rspec tests/todoable_api_spec.rb
```
