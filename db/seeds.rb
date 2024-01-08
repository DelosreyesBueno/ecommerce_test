# frozen_string_literal: true

require 'factory_bot'

CATEGORIES = [
  "Electrónicos": ['Teléfonos inteligentes', 'Tabletas', 'Laptops', 'Computadoras de escritorio', 'Monitores',
                   'Televisores', 'Cámaras digitales', 'Cámaras de seguridad', 'Auriculares', 'Altavoces',
                   'Reproductores de música', 'Reproductores de DVD y Blu-ray', 'Consolas de videojuegos',
                   'Controladores de videojuegos', 'Impresoras', 'Escáneres',
                   'Fotocopiadoras', 'Dispositivos de almacenamiento externo', 'Discos duros', 'Unidades flash USB',
                   'Tarjetas de memoria', 'Cámaras web', 'Smartwatches', 'Rastreadores de actividad física',
                   'Dispositivos de realidad virtual',
                   'Drones', 'Robot aspirador',
                   'Asistentes de voz inteligentes', 'Dispositivos de domótica', 'Smart TV Box',
                   'Receptores de audio y video', 'Adaptadores y cables', 'Baterías externas',
                   'Cargadores inalámbricos', 'Linternas LED'],
  "Ropa": ['Camisetas', 'Camisas', 'Blusas', 'Pantalones', 'Vaqueros', 'Faldas', 'Vestidos', 'Abrigos', 'Chaquetas',
           'Sweaters', 'Jerseys', 'Ropa interior', 'Calcetines', 'Zapatos', 'Zapatos de vestir', 'Botas', 'Sandalias',
           'Gorras', 'Bufandas', 'Guantes', 'Sombreros', 'Trajes', 'Corbatas', 'Bolsos', 'Mochilas', 'Cinturones',
           'Ropa de dormir', 'Ropa de baño', 'Trajes de baño', 'Ropa deportiva', 'Leggings', 'Ropa de maternidad',
           'Ropa para bebés'],
  "Libros": %w[Novela Biografía Ciencia Fantasía Historia],
  "Deportes": ['Balón de fútbol', 'Raqueta de tenis', 'Mochila', 'Bicicleta', 'Pesa', 'Zapatillas deportivas',
               'Ropa deportiva', 'Mochilas deportivas', 'Botellas de agua', 'Cintas para correr', 'Pesas',
               'Guantes de levantamiento de pesas', 'Bandas de resistencia', 'Pelotas de ejercicio',
               'Cuerdas para saltar', 'Tablas de equilibrio', 'Colchonetas de yoga', 'Ruedas de ejercicio',
               'Bicicletas estáticas', 'Bicicletas de montaña', 'Raquetas de tenis', 'Pelotas de tenis',
               'Palos de golf', 'Pelotas de golf', 'Redes de tenis', 'Redes de voleibol'],
  "Hogar": ['Mueble', 'Lámpara', 'Vajilla', 'Alfombra', 'Cortinas', 'Detergente para ropa', 'Suavizante de telas',
            'Limpiador multiusos', 'Toallas de papel', 'Papel higiénico', 'Jabón para platos', 'Esponjas de cocina',
            'Bolsas de basura', 'Ambientadores', 'Velas aromáticas', 'Repelente de insectos',
            'Insecticidas para el hogar', 'Desinfectante', 'Cepillos y escobas', 'Recogedor de basura',
            'Baldes de limpieza', 'Trapos de limpieza', 'Paños de cocina', 'Escurridor de platos',
            'Organizadores de closet', 'Perchas', 'Cajas de almacenamiento', 'Almohadas'],
  "Cuidado personal": ['Champú', 'Acondicionador', 'Mascarilla capilar', 'Aceite capilar', 'Spray para peinar',
                       'Crema hidratante facial', 'Limpiador facial', 'Tónico facial', 'Protector solar',
                       'Mascarilla facial', 'Pasta de dientes', 'Cepillo de dientes', 'Enjuague bucal',
                       'Hilo dental', 'Blanqueador dental', 'Jabón corporal', 'Gel de ducha', 'Lociones corporales',
                       'Desodorante', 'Aceite corporal', 'Esmalte de uñas', 'Quitaesmalte', 'Cortauñas',
                       'Lima de uñas', 'Tratamiento para uñas', 'Jabón íntimo', 'Toallitas íntimas']
].freeze

ActiveRecord::Base.transaction do
  25.times do
    FactoryBot.create(:admin, password: 'admin12345')
  end

  50.times do
    FactoryBot.create(:client, password: 'client123456')
  end

  CATEGORIES.first.each_key do |c|
    category = Category.create(name: c.to_s, user: Admin.all.sample)

    CATEGORIES.first[c].each do |product|
      next if Product.find_by(name: product)

      new_product = category.products.create(
        name: product,
        price: rand(10.0..100.0).round(2),
        product_type: 'Semi',
        user: Admin.all.sample
      )

      rand(1..3).times do
        new_product.images.create(
          image: File.open("#{Rails.root}/spec/fixtures/files/product_image.jpg")
        )
      end

      rand(1..25).times do
        new_product.purchases.create(
          client: Client.all.sample,
          quantity: rand(1..10)
        )
      end
    end
  end
end
