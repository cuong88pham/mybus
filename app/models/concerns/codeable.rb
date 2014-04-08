module Codeable

  # General code
  # For all model has code param
  # Author Cuong Pham
  def self.format_code(prefix, id)
    prefix + '_' + id
  end
end