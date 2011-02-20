require File.join(Rails.root, "lib", "epure", "edate")

Epure::EDate.load!
Epure::Config::YEARS_SELECT = Epure::EDate.semesters.keys.freeze
