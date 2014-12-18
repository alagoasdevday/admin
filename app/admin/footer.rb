module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"

        div do
          para "Alagoas Dev Day #{Date.today.year}"
        end
      end

    end
  end
end
