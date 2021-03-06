name 'kodi'
maintainer 'James Cuzella'
maintainer_email 'james.cuzella@lyraphase.com'
license 'GPL-3.0+'
description 'Installs/Configures kodi'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.7'

source_url 'https://github.com/trinitronx/kodi-cookbook'  if respond_to?(:source_url)
issues_url 'https://github.com/trinitronx/kodi-cookbook/issues'   if respond_to?(:issues_url)

depends 'apt', '>= 2.6.0'

supports 'ubuntu'

chef_version '>= 12.5.1' if respond_to?(:chef_version)

provides 'kodi::default'
recipe 'kodi::default', 'Installs kodi, and optionally any addons specified in attributes'

