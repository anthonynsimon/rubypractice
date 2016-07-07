class HtmlFormatter
  def export(report)
    result = StringIO.new
    result << '<p>'
    result << report.data
    result << '</p>'
    result.string
  end
end

class Report
  attr_accessor :data, :formatter

  def default_formatter
    -> (report) { report.data.to_s }
  end

  def initialize(data, formatter = default_formatter)
    @data = data
    @formatter = formatter
  end

  def export
    if @formatter.respond_to? :export
      @formatter.export(self)
    else
      @formatter.call(self)
    end
  end
end

report = Report.new(123)
p report.export

report.formatter = Proc.new do |report|
  "Report #{object_id} contains data #{report.data}"
end

p report.export

report.formatter = HtmlFormatter.new

p report.export
