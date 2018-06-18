# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

    def update_email
        AdminMailer.update_email(Admin.first, Admin.last)
    end

    def send_message
      AdminMailer.send_message('Administrador', "Destinatário",
          'Assunto', 'Mensagem').deliver_now
    end
end
