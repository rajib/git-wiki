# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sinatra}
  s.version = "0.9.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Blake Mizerany"]
  s.date = %q{2009-07-26}
  s.description = %q{Classy web-development dressed in a DSL}
  s.email = %q{sinatrarb@googlegroups.com}
  s.files = ["test/base_test.rb", "test/builder_test.rb", "test/erb_test.rb", "test/extensions_test.rb", "test/filter_test.rb", "test/haml_test.rb", "test/helpers_test.rb", "test/mapped_error_test.rb", "test/middleware_test.rb", "test/options_test.rb", "test/render_backtrace_test.rb", "test/request_test.rb", "test/response_test.rb", "test/result_test.rb", "test/route_added_hook_test.rb", "test/routing_test.rb", "test/sass_test.rb", "test/server_test.rb", "test/sinatra_test.rb", "test/static_test.rb", "test/templates_test.rb", "test/test_test.rb"]
  s.homepage = %q{http://sinatra.rubyforge.org}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{sinatra}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Classy web-development dressed in a DSL}
  s.test_files = ["test/base_test.rb", "test/builder_test.rb", "test/erb_test.rb", "test/extensions_test.rb", "test/filter_test.rb", "test/haml_test.rb", "test/helpers_test.rb", "test/mapped_error_test.rb", "test/middleware_test.rb", "test/options_test.rb", "test/render_backtrace_test.rb", "test/request_test.rb", "test/response_test.rb", "test/result_test.rb", "test/route_added_hook_test.rb", "test/routing_test.rb", "test/sass_test.rb", "test/server_test.rb", "test/sinatra_test.rb", "test/static_test.rb", "test/templates_test.rb", "test/test_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0.9.1"])
      s.add_development_dependency(%q<shotgun>, ["< 1.0", ">= 0.2"])
      s.add_development_dependency(%q<rack-test>, [">= 0.3.0"])
    else
      s.add_dependency(%q<rack>, [">= 0.9.1"])
      s.add_dependency(%q<shotgun>, ["< 1.0", ">= 0.2"])
      s.add_dependency(%q<rack-test>, [">= 0.3.0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0.9.1"])
    s.add_dependency(%q<shotgun>, ["< 1.0", ">= 0.2"])
    s.add_dependency(%q<rack-test>, [">= 0.3.0"])
  end
end
