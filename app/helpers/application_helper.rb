module ApplicationHelper
  def entry_time(entry)
    week = entry.week == 0 ? "" : " | #{Epure::Config::WEEKS_NAMES[entry.week]}"
    "#{entry.start_hour}<sup>#{"%02d" % entry.start_min}</sup>-#{entry.end_hour}<sup>#{"%02d" % entry.end_min}</sup>#{week}".html_safe
  end
  
  EXAMPLES = [
    ["PDF", "pdf"],
    ["iCal", "ical"],
    ["Mini PDF", "minipdf"]
  ]

  def examples
    @examples ||= EXAMPLES
  end
end
