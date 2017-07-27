# -*- encoding: utf-8 -*-
# stub: graphql-rails 0.0.9 ruby lib

Gem::Specification.new do |s|
  s.name = "graphql-rails".freeze
  s.version = "0.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["James Reggio".freeze]
  s.date = "2017-07-27"
  s.description = "Zero-configuration GraphQL + Relay support for Rails. Adds a route to process\nGraphQL operations and provides a visual editor (GraphiQL) during development.\nAllows you to specify GraphQL queries and mutations as though they were\ncontroller actions. Automatically maps Mongoid models to GraphQL types.\nSeamlessly integrates with CanCan.\n".freeze
  s.email = ["james.reggio@gmail.com".freeze]
  s.files = ["LICENSE".freeze, "app/controllers".freeze, "app/controllers/graphql".freeze, "app/controllers/graphql/rails".freeze, "app/controllers/graphql/rails/schema_controller.rb".freeze, "config/initializers".freeze, "config/initializers/graphiql.rb".freeze, "config/routes.rb".freeze, "lib/graphql".freeze, "lib/graphql/rails".freeze, "lib/graphql/rails.rb".freeze, "lib/graphql/rails/callbacks.rb".freeze, "lib/graphql/rails/config.rb".freeze, "lib/graphql/rails/controller_extensions.rb".freeze, "lib/graphql/rails/dsl.rb".freeze, "lib/graphql/rails/engine.rb".freeze, "lib/graphql/rails/extensions".freeze, "lib/graphql/rails/extensions/cancan.rb".freeze, "lib/graphql/rails/extensions/mongoid.rb".freeze, "lib/graphql/rails/fields.rb".freeze, "lib/graphql/rails/node_identification.rb".freeze, "lib/graphql/rails/operations.rb".freeze, "lib/graphql/rails/schema.rb".freeze, "lib/graphql/rails/types.rb".freeze, "lib/graphql/rails/version.rb".freeze]
  s.homepage = "https://github.com/jamesreggio/graphql-rails".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Zero-configuration GraphQL + Relay support for Rails".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 4.0.0"])
      s.add_runtime_dependency(%q<graphql>.freeze, ["~> 0.13"])
      s.add_runtime_dependency(%q<graphql-relay>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<graphiql-rails>.freeze, ["~> 1.2"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 4.0.0"])
      s.add_dependency(%q<graphql>.freeze, ["~> 0.13"])
      s.add_dependency(%q<graphql-relay>.freeze, ["~> 0.9"])
      s.add_dependency(%q<graphiql-rails>.freeze, ["~> 1.2"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 4.0.0"])
    s.add_dependency(%q<graphql>.freeze, ["~> 0.13"])
    s.add_dependency(%q<graphql-relay>.freeze, ["~> 0.9"])
    s.add_dependency(%q<graphiql-rails>.freeze, ["~> 1.2"])
  end
end
