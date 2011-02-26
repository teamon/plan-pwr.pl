# encoding: utf-8

class Automate
  def self.run!(login, password)
    agent = Mechanize.new
    
    form = agent.get("https://edukacja.pwr.wroc.pl/EdukacjaWeb/studia.do").forms.first
    form.login = login
    form.password = password
    form.submit
    
    agent.get "https://edukacja.pwr.wroc.pl/EdukacjaWeb/zapisy.do?event=WyborSluchacza"
    page = agent.post "https://edukacja.pwr.wroc.pl/EdukacjaWeb/zapisy.do?href=#hrefZapisySzczSlu", "event_WyborZapisowWidok" => "Przełącz na <Grupy zajęciowe, do których słuchacz jest zapisany w semestrze>"
    
    Epure::Parser.parse!(page.body)
  end
end
