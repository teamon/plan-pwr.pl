# encoding: utf-8

module Epure
  module Config
    WINTER = 1.freeze
    SUMMER = 2.freeze
    SEMESTERS = { "Letni" => SUMMER, "Zimowy" => WINTER }.freeze
    SEMESTERS_NAMES = SEMESTERS.invert.freeze
    COURSE_TYPES = { "Wykład" => "W", "Ćwiczenia" => "C", "Seminarium" => "S",
      "Zajęcia laboratoryjne" => "L", "Projekt" => "P", "Inne" => "X" }.freeze
    COURSE_TYPES_NAMES = COURSE_TYPES.invert.freeze
    WEEKS = { "" => 0, "TN" => 1, "TP" => 2 }.freeze
    WEEKS_NAMES = WEEKS.invert.freeze
    WEEK_DAYS = { "pn" => 0, "wt" => 1, "śr" => 2, "cz" => 3, "pt" => 4, "sb" => 5, "nd" => 6 }.freeze
    WEEK_DAYS_NAMES = ["Poniedziałek", "Wtorek", "Środa", "Czwartek", "Piątek", "Sobota", "Niedziela"].freeze

    HOURS = (7..21).freeze
    MINUTES = (0..11).freeze

    WEEKS_SELECT = { "Co tydzień" => 0, "Tydzień nieparzysty" => 1, "Tydzień parzysty" => 2 }.freeze
    WEEK_DAYS_SELECT = Hash[WEEK_DAYS_NAMES.map.with_index{|e,i| [e, i]}].freeze
    HOURS_SELECT = (7..21).map {|e| ["%.2d" % e, e] }.freeze
    MINUTES_SELECT = (0..11).map {|e| ["%.2d" % (e*5), e*5] }.freeze
    
    COLOR_SCHEMES = {
      :default => {
        "W" =>  %w(#f3b6b7 #e63021 #e63021),
        "C" =>  %w(#aeed91 #47ae03 #47ae03),
        "L" =>  %w(#a5c4f7 #1c64dc #1c64dc),
        "P" =>  %w(#efbcf0 #bb3abd #bb3abd),
        "S" =>  %w(#f5dcc0 #f38e00 #f38e00),
        "X" =>  %w(#ccc1ec #5c3ab2 #5c3ab2)
      },
      :bw => {
        "W" =>  %w(#fff #000 #000),
        "C" =>  %w(#fff #000 #000),
        "L" =>  %w(#fff #000 #000),
        "P" =>  %w(#fff #000 #000),
        "S" =>  %w(#fff #000 #000),
        "X" =>  %w(#fff #000 #000)
      }
    }
  end
end
