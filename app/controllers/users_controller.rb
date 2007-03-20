class UsersController < DemoController

  active_scaffold :user do |config|
    config.columns = [:id, :name, :first_name, :middle_name, :last_name, :phone_number, :email_address, :login, :password, :roles, :aliases]

    config.columns[:phone_number].description = "(Format: ###-###-####)"
    config.columns[:phone_number].label = "Phone"
    
    config.create.columns.exclude :id, :name
    config.update.columns.exclude :id, :name
    config.list.columns.exclude :first_name, :middle_name, :last_name
    config.subform.columns = [:first_name, :last_name, :login, :password]

    config.list.sorting = {:login => 'ASC'}
    
    config.nested.add_link "Names", [:aliases]
  end

end