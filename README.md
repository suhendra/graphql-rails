Documentation is still work in progress.

# Configuration

To configure GraphQL create `config/initializers/graphql.rb` and use following code:

```ruby
GraphQL::Rails.configure do |config|
  config.debug = ::Rails.env.development?
  config.camel_case = true
  
  # other options
end
```

Following options are supported (from `lib/graphql/rails/config.rb`):
* `debug` should GraphQL should be placed into debug mode (default: `Rails.env.development?`)
* `graphiql` should GraphiQL web interface be served (default: `Rails.env.development?`)
* `camel_case` should names be converted to camel case (default: `true`)
* `global_ids` should ids be globally unique (default: `true`)
* `max_depth` maximum nesting for GraphQL queries, `nil` for no limit (default: `8`)
* `mongoid` shouild mongoid extension be loaded (default: `defined?(::Mongoid)`)
* `cancan` should cancan extension be loaded (default: `defined?(::CanCan)`)


# Adding new query types to schema

Add `graph/operations/projects_operations.rb`

```ruby
class ProjectOperation < GraphQL::Rails::Operations
  query all_projects: [::ProjectInterface] do
    description 'This query returns all projects'
    resolve do
      Project.all
    end
  end
end
```

Add `graph/types/project_interface.rb`:

```ruby
ProjectInterface = GraphQL::ObjectType.define do
  name "Project"
  description "Represents project"

  field :id, !types.ID
  field :key, !types.String
  field :name, !types.String
end
```

# Autoloading

This gem adds following paths to Rails autoloading mechanism:
* `app/graph`
* `app/graph/types`
* `app/graph/operations`