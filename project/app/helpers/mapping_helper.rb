module MappingHelper
  def load_collection
    @mappings = Mapping.all
  end

  def create_mapping
    Mapping.create(params[:mapping])
  end

  def delete_mapping
    Mapping.find(params[:mapping]).destroy
  end
end