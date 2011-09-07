require 'mkmf'

# :stopdoc:

dir_config 'libyaml'

def asplode missing
  abort "#{missing} is missing. Please install libyaml."
end

asplode('yaml.h')  unless find_header  'yaml.h'
# asplode('libyaml') unless find_library 'yaml', 'yaml_get_version'

$libs << " /usr/local/ruby-deps/lib/libyaml.a"

create_makefile 'psych'

# :startdoc:
