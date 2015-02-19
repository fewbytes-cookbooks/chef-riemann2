# Description

Install and configure Riemann Server, Riemann Dashboard, Riemann Tools.

# Requirements
## Platform
Tested with `test-kitchen` on Ubuntu 13.10, Debian 7.1.0
CentOS 6.4 working without `riemann-dash`

# Usage
### Riemann Server
`include_recipe 'riemann::riemann'`
Will install `riemann` server with default java from `java` cookbook
The configuration file generated from template with `(include node['riemann']['config']['userfile'])` for other configuration. 

### Riemann Dash
`include_recipe 'riemann::riemann-dash'`

# Attributes
```ruby
default['riemann']['download']['url'] = 'http://aphyr.com/riemann/riemann-0.2.4.tar.bz2'
default['riemann']['download']['checksum'] = 'b8776b5175708d8f41305e3db20d159b64db0fdb4440bb2f4dbe2fa8be7c3121'
default['riemann']['download']['version'] = '0.2.4'

default['riemann']['config']['bind'] = '0.0.0.0'
default['riemann']['config']['port'] = '5555'
default['riemann']['config']['ws-port'] = '5556'
default['riemann']['config']['userfile'] = "#{riemann['system']['home_dir']}/etc/user.config"

default['riemann']['system']['user'] = 'riemann'
default['riemann']['system']['group'] = 'riemann'
default['riemann']['system']['home_dir'] = '/usr/local/riemann'
```

# Recipes
`riemann::riemann` - installs the riemann server

# Author

Author:: Fewbytes. (<alex@fewbytes.com>)