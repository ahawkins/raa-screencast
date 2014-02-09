require 'sinatra'

class WebService < Sinatra::Base
  post '/invoices' do
    form = SendInvoiceForm.new params['invoice']
    use_case = SendInvoice.new form

    use_case.run!

    status 200
  end
end
