require 'sinatra'

class WebService < Sinatra::Application
  post '/invoices' do
    form = SendInvoiceForm.new

    form.name = params['invoice']['name']
    form.email = params['invoice']['email']
    form.description = params['invoice']['description']
    form.amount = params['invoice']['amount']

    use_case  = SendInvoice.new form

    use_case.run!

    status 200
  end
end
