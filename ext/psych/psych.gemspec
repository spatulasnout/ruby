# -*- encoding: utf-8 -*-
_VERSION = "1.2.0"

Gem::Specification.new do |s|
  s.name = %q{psych}
  s.version = '1.2.0'

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ['Aaron Patterson']
  s.date = %q{2011-08-03}
  s.description = %q{Psych is a YAML parser and emitter.  Psych leverages libyaml[http://libyaml.org]
for its YAML parsing and emitting capabilities.  In addition to wrapping
libyaml, Psych also knows how to serialize and de-serialize most Ruby objects
to and from the YAML format.}
  s.email = %w{aaron@tenderlovemaking.com}
  s.extensions = %w{extconf.rb}
  s.files = %w[
    ext/psych/emitter.c,
    ext/psych/emitter.h,
    ext/psych/extconf.rb,
    ext/psych/parser.c,
    ext/psych/parser.h,
    ext/psych/psych.c,
    ext/psych/psych.h,
    ext/psych/to_ruby.c,
    ext/psych/to_ruby.h,
    ext/psych/yaml_tree.c,
    ext/psych/yaml_tree.h,
    lib/psych.rb,
    lib/psych/coder.rb,
    lib/psych/core_ext.rb,
    lib/psych/deprecated.rb,
    lib/psych/handler.rb,
    lib/psych/json.rb,
    lib/psych/json/ruby_events.rb,
    lib/psych/json/stream.rb,
    lib/psych/json/tree_builder.rb,
    lib/psych/json/yaml_events.rb,
    lib/psych/nodes.rb,
    lib/psych/nodes/alias.rb,
    lib/psych/nodes/document.rb,
    lib/psych/nodes/mapping.rb,
    lib/psych/nodes/node.rb,
    lib/psych/nodes/scalar.rb,
    lib/psych/nodes/sequence.rb,
    lib/psych/nodes/stream.rb,
    lib/psych/omap.rb,
    lib/psych/parser.rb,
    lib/psych/scalar_scanner.rb,
    lib/psych/set.rb,
    lib/psych/stream.rb,
    lib/psych/streaming.rb,
    lib/psych/tree_builder.rb,
    lib/psych/visitors.rb,
    lib/psych/visitors/depth_first.rb,
    lib/psych/visitors/emitter.rb,
    lib/psych/visitors/json_tree.rb,
    lib/psych/visitors/to_ruby.rb,
    lib/psych/visitors/visitor.rb,
    lib/psych/visitors/yaml_tree.rb,
    test/psych/helper.rb,
    test/psych/json/test_stream.rb,
    test/psych/nodes/test_enumerable.rb,
    test/psych/test_alias_and_anchor.rb,
    test/psych/test_array.rb,
    test/psych/test_boolean.rb,
    test/psych/test_class.rb,
    test/psych/test_coder.rb,
    test/psych/test_date_time.rb,
    test/psych/test_deprecated.rb,
    test/psych/test_document.rb,
    test/psych/test_emitter.rb,
    test/psych/test_encoding.rb,
    test/psych/test_engine_manager.rb,
    test/psych/test_exception.rb,
    test/psych/test_hash.rb,
    test/psych/test_json_tree.rb,
    test/psych/test_merge_keys.rb,
    test/psych/test_nil.rb,
    test/psych/test_null.rb,
    test/psych/test_object.rb,
    test/psych/test_omap.rb,
    test/psych/test_parser.rb,
    test/psych/test_psych.rb,
    test/psych/test_scalar.rb,
    test/psych/test_scalar_scanner.rb,
    test/psych/test_serialize_subclasses.rb,
    test/psych/test_set.rb,
    test/psych/test_stream.rb,
    test/psych/test_string.rb,
    test/psych/test_struct.rb,
    test/psych/test_symbol.rb,
    test/psych/test_tainted.rb,
    test/psych/test_to_yaml_properties.rb,
    test/psych/test_tree_builder.rb,
    test/psych/test_yaml.rb,
    test/psych/visitors/test_depth_first.rb,
    test/psych/visitors/test_emitter.rb,
    test/psych/visitors/test_to_ruby.rb,
    test/psych/visitors/test_yaml_tree.rb,
  ]
  s.homepage = %q{http://redmine.ruby-lang.org}
  s.require_paths = %w{lib}
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubyforge_project = %q{psych}
  s.rubygems_version = %q{1.8.6.1}
  s.summary = %q{Psych is a YAML parser and emitter}
end
