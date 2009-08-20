module Scruffy::Renderers
    class LegendToRight < Empty
    
    def define_layout
      super do |components|
        components << Scruffy::Components::Title.new(:title, :position => [5, 2], :size => [90, 7])
        components << Scruffy::Components::Viewport.new(:view, :position => [2, 18], :size => [65, 77]) do |graph|
          graph << Scruffy::Components::ValueMarkers.new(:values, :position => [0, 2], :size => [20, 89])
          graph << Scruffy::Components::Grid.new(:grid, :position => [22, 0], :size => [78, 89])
          graph << Scruffy::Components::DataMarkers.new(:labels, :position => [17, 92], :size => [83, 8])
          graph << Scruffy::Components::Graphs.new(:graphs, :position => [22, 0], :size => [78, 89])
        end
        #components << Scruffy::Components::Legend.new(:legend, :position => [10, 13], :size => [90, 4.5])  # Top
        components << Scruffy::Components::Legend.new(:legend, :position => [68, 18], :size => [30, 77])  # Right
      end
    end
    
    protected
      def hide_values
        super
        component(:view).position[0] = -10
        component(:view).size[0] = 100
      end
    
      def labels
        [component(:view).component(:labels)]
      end
    
      def values
        [component(:view).component(:values)]
      end
      
      def grids
        [component(:view).component(:grid)]
      end
    end
end