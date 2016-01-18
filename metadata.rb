name 'kodi'
maintainer 'James Cuzella'
maintainer_email 'james.cuzella@lyraphase.com'
license 'gplv3'
description 'Installs/Configures kodi'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.2'

depends 'apt', '>= 2.6.0'

supports 'ubuntu'

provides 'kodi::default'
recipe 'kodi::default', 'Installs kodi, and optionally any addons specified in attributes'
attribute 'kodi/addons',
  :display_name => 'Kodi Addons',
  :description => 'An optional list of extra kodi addon packages to install. Accepts an array of package names.  For full list of available packages, see kodi ppa: http://kodi.wiki/view/Official_Ubuntu_PPA',
  :type => 'array',
  :required => 'optional',
  :recipes => [ 'kodi::default' ],
  :default => "[]"

