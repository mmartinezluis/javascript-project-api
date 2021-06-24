class CategoryBlueprint < Blueprinter::Base
 identifier :id
 field :name

 view :normal do
  association :quotes, blueprint: QuoteBlueprint
 end
end