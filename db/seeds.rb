User.create([{ first_name: 'Kara', last_name: 'Diaby', address: "16 villa Gaudelet 75012 Paris", email: 'kara.diaby@gmail.com', password: '12345678', phone_number: "0600000000", description: "Pâtissier du Bled", is_baker: "true" },
  { first_name: 'Charles', last_name: 'Marcoin', address: "16 villa Gaudelet 75012 Paris", email: 'charles.marcoin@gmail.com', password: '12345678', phone_number: "0600000000", description: "CTO amateur"},
   { first_name: 'Patrick', last_name: 'Berczelly', address: "16 villa Gaudelet 75012 Paris", email: 'berczellypatrick@gmail.com', password: '12345678', phone_number: "0600000000" ,description: "Amateur total. Inventeur de la formule 'Excellet'"} ])

Pastry.create([{category: "Tarte aux pommes", name: "Tarte aux pommes au coulis de figues", description: "Une excellente tarte avec des tranches de pommes très fine et j'ajoute à la fin un délicieux chutney de figue", slices: 6, order_warning: "2 jours", price: 33, baker_id: 1},
  {category: "Gâteau au chocolat", name: "L'enclume", description: "Un gâteau au chocolat ultra lourd", slices: 6, order_warning: "1 jour", price: 15, baker_id: 2},
  {category: "Macarons", name: "Macarons arc-en-ciel", description: "Un macaron multicolore qui ravira les enfants", slices: 1, order_warning: "2 jours", price: 2, baker_id: 2},
  {category: "Flanc", name: "Flanc aux fruits rouges", description: "Un flanc aux fruits rouges tout à fait excellent", slices: 1, order_warning: "2 jours", price: 2, baker_id: 3}])

Order.create({delivery_date: "12 juin 2017", quantity: 1, user_id: 1, pastry_id: 2})
Order.create({delivery_date: "16 juillet 2017", quantity: 1, user_id: 1, pastry_id: 1})
Order.create({delivery_date: "20 août 2017", quantity: 2, user_id: 2, pastry_id: 3})
Order.create({delivery_date: "12 juin 2017", quantity: 1, user_id: 1, pastry_id: 2})
Order.create({delivery_date: "16 juillet 2017", quantity: 1, user_id: 1, pastry_id: 1})
Order.create({delivery_date: "20 août 2017", quantity: 2, user_id: 2, pastry_id: 2})
Order.create({delivery_date: "22 août 2017", quantity: 3, user_id: 2, pastry_id: 1})
