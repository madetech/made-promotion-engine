module ActiveAdmin
  module LocaliseExtension
    extend ActiveSupport::Concern

    def localise_inputs(inputs)
      if Promotion.config.localisable
        self.translated_inputs do |t|
          inputs.each do |input|
            t.input get_field(input), get_args(input)
          end

          render_hidden_field(t)
        end
      else
        inputs.each do |input|
          self.input get_field(input), get_args(input)
        end
      end
    end

    def localise_has_many(model, inputs)
      if Promotion.config.localisable
        fetch_localise_has_many_localisable(self, model, inputs)
      else
        fetch_localise_has_many_regular(self, model, inputs)
      end
    end

    def promotion_common_inputs
      self.input :placement,  :as => :select,
                              :collection => Promotion.config.placements.map{|k, v| [v[:label], k]},
                              :prompt => "Select a placement"

      if Promotion.config.styles.length > 0
        self.input :style,    :as => :select,
                              :collection => Promotion.config.styles.map{|k, v| [v, k]},
                              :prompt => "Select a style"
      end

      self.input :order, :as => :number
    end

    private
    def fetch_localise_has_many_localisable(form, model, inputs)
      form.has_many model do |f_many|
        f_many.translated_inputs do |t|
          inputs.each do |input|
            t.input get_field(input), get_args(input)
          end

          render_hidden_field(t)
        end
      end
    end

    def fetch_localise_has_many_regular(form, model, inputs)
      form.has_many model do |f_many|
        f_many.inputs do
          inputs.each do |input|
            f_many.input get_field(input), get_args(input)
          end

          render_hidden_field(f_many)
        end
      end
    end

    def render_hidden_field(container)
      # Needed to force the block to yield an input
      container.input :id, as: :hidden
    end

    def get_field(params)
      params[0]
    end

    def get_args(params)
      return {} if params.length < 2
      params[1]
    end
  end
end

ActiveAdmin::FormBuilder.send(:include, ActiveAdmin::LocaliseExtension)
