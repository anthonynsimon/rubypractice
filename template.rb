class BasicReport
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def export
    @data.to_s
  end
end

class HtmlReport < BasicReport
  def export
    result = StringIO.new
    result << '<p>'
    result << @data
    result << '</p>'
    result.string
  end
end

report = BasicReport.new(123)
p report.export

report2 = HtmlReport.new(456)
p report2.export
