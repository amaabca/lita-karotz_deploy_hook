# lita-karotz_deploy_hook

TODO: Add a description of the plugin.

## Installation

Add lita-karotz_deploy_hook to your Lita instance's Gemfile:

``` ruby
gem "lita-karotz_deploy_hook"
```


## Configuration

Lita.configure do |config|
  config.handlers.karotz_deploy_hook.karotz_deployment_endpoint = "http://my-karotz-app.com/deployments"
end

## Usage

The deployment message we use, which gets matched is in the form:

User_Name is starting deploy of 'project_name' from branch 'branch_name' to environment_name

## License

[MIT](http://opensource.org/licenses/MIT)
