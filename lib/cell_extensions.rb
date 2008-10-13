module Cell
  # These ControllerMethods are automatically added to all Controllers when
  # the cells plugin is loaded.
  module ControllerMethods

    # Equivalent to ActionController#render_to_string, except with Cells
    # rather than regular templates.
    def render_cell_to_string(name, state, opts={})
      cell = Base.create_cell_for(self, name, opts)
      
      return cell.render_state(state)
    end
  end
  module ArMethods
    def update_cells
      begin
        cell_name = (self.class.to_s + "Cell").constantize
        cell_name.update_states
      rescue NameError
        # No cell for this model
      end
    end
  end
end

