class InfoBlock < Liquid::Tag
  Message = /(info|warning|danger) (.*)/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Message then
      @type = $1

      case @type
      when "info"
        @title = "Note"
      when "warning"
        @title = "Tip"
      when "danger"
        @title = "Warning"
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
    "<div class=\"alert alert-#{@type}\"><strong>#{@title}</strong>: #{@message}</div>"
  end

  Liquid::Template.register_tag "infoblock", self
end
