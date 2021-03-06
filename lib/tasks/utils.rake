namespace :utils do
  desc "TODO"
  task seed: :environment do

      puts "Cadastrando MEMBRO padrão ..."
      Member.create!(
        email: "membro@membro.com.br",
        password: "123456",
        password_confirmation: "123456",
        )
      puts "MEMBRO cadastrado com sucesso!"


      puts "Cadastrando MEMBROS..."
      20.times do
        Member.create!(
          email: Faker::Internet.email,
          password: "123456",
          password_confirmation: "123456"
        )
      end
      puts "MEMBROS cadastrados com sucesso!"
    #################################################################


      puts "Cadastrando anúncios"

      5.times do
        Ad.create!(
          title: Faker::Lorem.sentence([2,3,4,5].sample),
          description: DoctorIpsum::Markdown.entry,
          member: Member.first,
          category: Category.all.sample,
          price: "#{Random.rand(99)}.#{Random.rand(99)}",
          finish_date: Date.today + Random.rand(90),
          picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
        )
      end


      100.times do
        Ad.create!(
          title: Faker::Lorem.sentence([2,3,4,5].sample),
          description: DoctorIpsum::Markdown.entry,
          member: Member.all.sample,
          category: Category.all.sample,
          price: "#{Random.rand(99)}.#{Random.rand(99)}",
          finish_date: Date.today  + Random.rand(90),
          picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
        )
      end

      puts "ANÚNCIOS cadastrados com sucesso!"
    end
end
