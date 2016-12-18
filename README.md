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

# Adding new mutations to schema

Add `graph/operations/create_organization_with_user.rb`:

```ruby
class CreateOrganizationWithUser < GraphQL::Rails::Operations
  
  mutation create_organization_with_user: {token: String, user: GraphQL::Rails::Types.resolve(UserInterface)} do
    description 'Creates organization with first user'

    argument :organization, OrganizationInput, :required
    argument :user, UserInput, :required

    resolve do
      # Some code that will actually mutate the app state
      # then return hash with output fields defined above
      {
        user: User.first,
        token: "token"
      }
    end
  end
  
end
```

Add `graph/types/user_input.rb`

```ruby
UserInput = GraphQL::InputObjectType.define do
  name "UserInput"
  description "Represents user input"

  argument :email, !types.String
end
```

Add `graph/types/organization.rb`

```ruby
OrganizationInput = GraphQL::InputObjectType.define do
  name "OrganizationInput"
  description "Represents organization input"

  argument :name, !types.String
  argument :slug, !types.String
end
```

Also add `graph/types/user_interface.rb`

```ruby
UserInterface = GraphQL::ObjectType.define do
  name "User"
  description "Represents user"

  field :id, !types.ID
  field :email, !types.String
end
```

# Autoloading

This gem adds following paths to Rails autoloading mechanism:
* `app/graph`
* `app/graph/types`
* `app/graph/operations`