require 'sinatra'

class WebService < Sinatra::Base
  post '/invoices' do
    form = SendInvoiceForm.new
    form.email = params['invoice']['email']
    form.description = params['invoice']['description']
    form.amount = params['invoice']['amount']
    form.name = params['invoice']['name']

    use_case = SendInvoice.new form

    use_case.run!

    status 200
  end
end
