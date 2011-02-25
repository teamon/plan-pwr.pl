PDFKit.configure do |config|
  if RUBY_PLATFORM =~ /darwin/
    config.wkhtmltopdf = File.join(Rails.root, 'bin', 'wkhtmltopdf-0.9.9-OS-X.i368')
  else  
    config.wkhtmltopdf = File.join(Rails.root, 'bin', 'wkhtmltopdf-amd64')
  end
end
