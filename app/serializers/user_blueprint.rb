class UserBlueprint < Blueprinter::Base
    identifier :id
    fields :first_name, :last_name, :username

    view :profile do
        fields :email
    end
end