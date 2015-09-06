PDFKit.configure do |config|
  config.wkhtmltopdf = ''
  ENV['PATH'].split(File::PATH_SEPARATOR).any? do |directory|
    config.wkhtmltopdf = File.join(directory, program.to_s) if File.executable?(File.join(directory, program.to_s))
  end
end
