require 'builder'
module Scruffy::Renderers
  # ===Scruffy::Renderers::Base
  #
  # Author:: Brasten Sager
  # Date:: August 14th, 2006
  #
  # Provides all the base functionality needed to render a graph, but
  # does not provide a default layout.
  #
  # For a basic layout, see Scruffy::Renderers::Standard.
  class Base
    include Scruffy::Helpers::Canvas
    
    attr_accessor :options

    def initialize(options = {})
      self.components = []
      self.options = options
      define_layout
    end

    # Renders the graph and all components.
    def render(options = {})
      options[:graph_id]    ||= 'scruffy_graph'
      options[:complexity]  ||= (global_complexity || :normal)

      # Allow subclasses to muck with components prior to renders.
      rendertime_renderer = self.clone
      rendertime_renderer.instance_eval { before_render if respond_to?(:before_render) }

      svg = Builder::XmlMarkup.new(:indent => 2)
      unless options[:no_doctype_header]
        svg.instruct!
        svg.declare!(:DOCTYPE, :svg, :PUBLIC, "-//W3C//DTD SVG 1.1//EN", "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd")
      end
      svg.svg(:xmlns => "http://www.w3.org/2000/svg", 'xmlns:xlink' => "http://www.w3.org/1999/xlink",
              :viewBox => "0 0 #{options[:size].first} #{options[:size].last}") {
        svg.g(:id => options[:graph_id]) {
          rendertime_renderer.components.each do |component|
            component.render(svg, 
                             bounds_for( options[:size], component.position, component.size ), 
                             options)
          end
        }
      }
      svg.target!
    end
    
    def before_render
      if self.options
        set_values(self.options[:values])    if (self.options[:values] && self.options[:values] != :hide)
        hide_grid     if (self.options[:grid] == :hide)
        hide_values   if (self.options[:values] == :hide)
        hide_labels   if (self.options[:labels] == :hide)
      end
    end
    
    def method_missing(sym, *args)
      self.options = {} if self.options.nil?
      
      if args.size > 0
        self.options[sym] = args[0]
      else
        return self.options[sym]
      end
    end

    protected
      def hide_grid
        grids.each { |grid| grid.visible = false }
      end
    
      def set_values(val)
        values.each { |value| value.markers = val }
        grids.each { |grid| grid.markers = val }
      end
    
      def hide_values
        values.each { |value| value.visible = false }
      end
    
      def hide_labels
        labels.each { |label| label.visible = false }
      end    

    private
      def global_complexity
        if Kernel.const_defined? "SCRUFFY_COMPLEXITY"
          SCRUFFY_COMPLEXITY
        else
          nil
        end
      end
  end   # base
end
