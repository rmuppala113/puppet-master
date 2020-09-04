## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  include ntp
}

node rakeshmuppala1133c.mylabserver.com {
  include mysql
  include apache

  apache::vhosts { 'puppet_project':
    port      => 80,
    subdomain => 'puppetproject',
    admin     => 'admin@mylabserver.com',
    docroot   => '/var/www/html/puppetproject',
  }
}

node rakeshmuppala1132c.mylabserver.com {
  include mysql
  include apache
  
  apache::vhosts { 'puppet_project':
    port      => 80,
    subdomain => 'puppetproject',
    admin     => 'admin@mylabserver.com',
    docroot   => '/var/www/html/puppetproject',
  }

  apache::vhosts { 'puppet_project_dev':
    port      => 8081,
    subdomain => 'puppetproject-dev',
    admin     => '',
    docroot   => '/var/www/html/puppetproject-dev',
  }
}
