# encoding: utf-8

module Epure
  class Automate
    def self.run!(login, password)
      agent = Mechanize.new

      form = agent.get("https://edukacja.pwr.wroc.pl/EdukacjaWeb/studia.do").forms.first

      form.login = login
      form.password = password
      page = form.submit

      if page.title =~ /Błąd logowania/
        raise LoginException
      end

      page = page.link_with(:text => 'Zapisy').click

      form = page.forms.find do |e|
        e.buttons.any? do |f|
          f.value == "Przełącz na <Grupy zajęciowe, do których słuchacz jest zapisany w semestrze>"
        end
      end

      page = agent.submit(form, form.buttons.first)

      Epure::Parser.parse!(page.body)
    end
  end
end
