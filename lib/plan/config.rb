#encoding: utf-8

module Plan
  module Config
    WINTER = 1.freeze
    SUMMER = 2.freeze
    SEMESTERS = { "Letni" => SUMMER, "Zimowy" => WINTER }.freeze
    COURSE_TYPES = { "Wykład" => "W", "Ćwiczenia" => "C", "Seminarium" => "S",
      "Zajęcia laboratoryjne" => "L", "Projekt" => "P", "Inne" => "X" }.freeze
    COURSE_TYPES_NAMES = COURSE_TYPES.invert.freeze
    WEEKS = { "" => 0, "TN" => 1, "TP" => 2 }.freeze
    WEEKS_NAMES = WEEKS.invert.freeze
    WEEK_DAYS = { "pn" => 0, "wt" => 1, "śr" => 2, "cz" => 3, "pt" => 4, "sb" => 5, "nd" => 6 }.freeze
    WEEK_DAYS_NAMES = ["Poniedziałek", "Wtorek", "środa", "Czwartek", "Piątek", "Sobota", "Niedziela"]
    
    HOURS = (7..21).map {|e| "%.2d" % e}.freeze
    MINUTES = (0..11).map {|e| "%.2d" % (e*5)}.freeze
  end
end
