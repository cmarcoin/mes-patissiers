Order.destroy_all
Pastry.destroy_all
User.destroy_all

User.create([{ first_name: 'Kara', last_name: 'Diaby', address: "30 avenue de la République, Paris", email: 'kara.diaby@gmail.com', password: '12345678', phone_number: "0600000000", description: "Pâtissier du Bled", is_baker: "true" },
  { first_name: 'Charles', last_name: 'Marcoin', address: "135 rue Saint-Maur, Paris", email: 'charles.marcoin@gmail.com', password: '12345678', phone_number: "0600000000", description: "CTO amateur"},
   { first_name: 'Patrick', last_name: 'Berczelly', address: "202 rue Oberkampf, Paris", email: 'berczellypatrick@gmail.com', password: '12345678', phone_number: "0600000000" ,description: "Amateur total. Inventeur de la formule 'Excellent'", is_baker: "true"},
   { first_name: 'Axel', last_name: 'Marcoin', address: "10 avenue Marinville, Saint-Maur", email: 'axel.marcoin@gmail.com', password: '12345678', phone_number: "0612345678", description: "Amateur éclairé d'éclaires au chocolat"},
  { first_name: 'Tiphaine', last_name: 'Catallan', address: "22 rue Mongallet, Paris", email: 'Tiphaine.Catallan@gmail.com', password: '12345678', phone_number: "0687654321", description: "Vainqueur la 48e édition de top chef", is_baker: "true"},
   { first_name: 'Patrick', last_name: 'Berczelly', address: "202 rue Oberkampf, Paris", email: 'aurelie.dupneu@hotmail.com', password: '12345678', phone_number: "0643215678" ,description: "Ceinture noire d'engloutissage de macarons", is_baker: "true" }])

Pastry.create([{category: "Tarte aux pommes", name: "Tarte aux pommes au coulis de figues", description: "Une excellente tarte avec des tranches de pommes très fine et j'ajoute à la fin un délicieux chutney de figue", slices: 6, order_warning: "2 jours", price: 33, baker_id: 1, remote_photo_url: "http://img-3.journaldesfemmes.com/vAW2MkFeNHMnGKYqmbnZtwHtExE=/750x/smart/image-icu/334282_1193905315.jpg"},
  {category: "Gâteau au chocolat", name: "L'enclume", description: "Un gâteau au chocolat ultra lourd", slices: 6, order_warning: "1 jour", price: 15, baker_id: 1, remote_photo_url: "https://www.atelierdeschefs.com/media/recette-e20863-gateau-tout-chocolat.jpg"},
  {category: "Macarons", name: "Macarons arc-en-ciel", description: "Un macaron multicolore qui ravira les enfants", slices: 1, order_warning: "2 jours", price: 2, baker_id: 5, remote_photo_url: "http://www.lisbonneaccueil.org/wp-content/uploads/dghkfDqPS7myJzSlyl2W_macaronss.jpeg"},
  {category: "Tarte aux fraises", name: "Tarte à la fraise", description: "La meilleure tarte à la fraise du monde. Avec des vraies fraises dedans", slices: 8, order_warning: "1 jour", price: 15, baker_id: 6, remote_photo_url: "https://static3.hervecuisine.com/wp-content/uploads/2016/06/recette-tarte-aux-fraises-facile.jpg"},
  {category: "Flanc", name: "Flanc aux fruits rouges", description: "Un flanc aux fruits rouges tout à fait excellent", slices: 1, order_warning: "1 jour", price: 2, baker_id: 6, remote_photo_url: "http://www.auxdelicesdupalais.net/wp-content/uploads/2013/12/flan-au-caramelP1031285.jpg"},
  {category: "Paris Brest", name: "Paris Brest version Abidjan", description: "Un Paris Brest avec de l'ananas", slices: 2, order_warning: "1 jour", price: 2, baker_id: 6, remote_photo_url: "http://gateaux-et-delices.com/wp-content/uploads/2015/10/Paris-Brest1.jpg"},
   {category: "Anniversaire", name: "Gateau OM", description: "Un gâteau au chocolat excellent en forme de maillot de l'OM. Je peux écrire ce que vous voulez dessus", slices: 10, order_warning: "1 jour", price: 15, baker_id: 3, remote_photo_url: "http://img.over-blog-kiwi.com/0/42/90/70/201306/ob_cb4c624d827c421da4db197167bcc71f_maillot-de-foot-om.jpg"} ])


10.times do
  Order.create({user_id: 3, pastry_id: 7, delivery_date: "16 juin 2017", quantity: 2})
end
