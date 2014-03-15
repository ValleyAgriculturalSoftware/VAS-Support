class InfoBlock < Liquid::Tag
  Message = /(note|tip|warning) (.*)/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Message then
      @type = $1

      case @type
      when "note"
        @title = "Note"
        @class = "info"
        @icon = "fa-file-text-o"
      when "tip"
        @title = "Tip"
        @class = "warning"
        @icon = "fa-lightbulb-o"
      when "warning"
        @title = "Warning"
        @class = "danger"
        @icon = "fa-exclamation-triangle"
      end

      if $2.nil?
        @message = "Didn't get anything"
      else
        @message = $2
      end
    else
        raise "Nothing provided"
    end
  end

  def render(context)
    "<div class=\"alert alert-#{@class}\"><p><i class=\"fa #{@icon} fa-2x pull-left\"></i><strong>#{@title}</strong>: #{@message}</p></div>"
  end

  Liquid::Template.register_tag "infoblock", self
end
