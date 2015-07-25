module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def flash_message(message, type = :info, dismissable = false)
        class_str = dismissable ? "alert alert-#{type} alert-dismissable" : "alert alert-#{type}"
        html.div(class: class_str, role: 'alert') do
          if dismissable
            button(type: 'button', class: 'close', :'data-dismiss' => 'alert', :'aria-label' => 'Close') do
              span('aria-hidden' => true) do
                raw "&times;"
              end
            end
          end
          p message
        end
      end
    end
  end
end
