# todoable-api
Interview Test - Ruby wrapper library for the http://todoable.teachable.tech/ API

We use httparty for API calls and Rspec for testing. All API endpoint wrapper methods return the httparty response object, it has to be used accordingly.

# TODO
* Pack this as a gem
* Write mocked tests for each Api method

# Setup 

```
gem install httparty`
gem install rspec
```

Set the username and password to get the authentication token. Ref http://todoable.teachable.tech/
``` 
export username=<username>
export passowrd=<password> 
```
  
# Usage
todoable_api = Todoable::TodoableApi.new
todoable_api.lists

# Test
```
cd todoable-api
rspec tests/todoable_api_spec.rb
```
