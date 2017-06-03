# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create role: 2, last_name: 'Dummy', first_name: 'Admin', email: 'dummy@mail.ru', password: '123123123', password_confirmation: '123123123'

Grower.create name: 'iseli', title: 'Iseli Nursery', phone: '800-777-6202', 
              url: 'http://www.iselinursery.com', 
              about: 'The Wholesale growers of rare and beautiful dwarf conifers, Japanese maples',
              description: 'The Co is dedicated to producing the finest quality Colorful Conifers®, dwarf conifers, miniature conifers, Japanese maples and other landscape plants and making them available to consumers through quality garden center retailers and professional landscapers throughout the United States and Canada'

grower_id = Grower.find_by(name: 'iseli').id
Plant.create grower_id: grower_id, title_la: "Picea glauca 'Pendula'",     title: "Weeping white spruce",         kind: 1, zone_min: 2, zone_max: 6
Plant.create grower_id: grower_id, title_la: "Picea abies 'Acrocona'",     title: "Norway spruce 'Acrocona'",     kind: 1, zone_min: 3, zone_max: 7
Plant.create grower_id: grower_id, title_la: "Pinus densiflora 'Pendula'", title: "Weeping Japanese red pine",    kind: 1, zone_min: 4, zone_max: 7
Plant.create grower_id: grower_id, title_la: "Chionanthus virginicus",     title: "Fringe tree",                  kind: 0, zone_min: 3, zone_max: 9
Plant.create grower_id: grower_id, title_la: "Acer palmatum 'Tamukeyama'", title: "Japanese maple  'Tamukeyama'", kind: 0, zone_min: 5, zone_max: 8

Plant.create grower_id: grower_id, title_la: "Pinus strobus 'Bergman's contorta'",          title: "Eastern white pine 'Bergman's contorta'", kind: 1, zone_min: 3, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Xanthocyparis nootkanensis 'Glauca Pendula'", title: "Weeping Alaska(n) cedar",                 kind: 1, zone_min: 4, zone_max: 7
Plant.create grower_id: grower_id, title_la: "Magnolia [hybrid] 'Jane'",                    title: "Magnolia 'Jane'",                         kind: 0, zone_min: 4, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Heptacodium miconioides",                     title: "Seven-son flower tree",                   kind: 0, zone_min: 5, zone_max: 9
Plant.create grower_id: grower_id, title_la: "Spiraea x japonica 'Neon Flash'",             title: "'Neon Flash' spirea",                     kind: 0, zone_min: 4, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Spiraea x vanhouttei 'Renaissance'",          title: "Vanhoutte spirea, or bridalwreath",       kind: 0, zone_min: 3, zone_max: 8, hybrid_parentage: "S. trilobata x S. cantoniensis"
Plant.create grower_id: grower_id, title_la: "Spiraea japonica 'Alpina'",                   title: "Spirea 'Alpina'",                         kind: 0, zone_min: 4, zone_max: 8

Plant.create grower_id: grower_id, title_la: "Berberis thunbergii f. atropurpurea 'Rose Glow'", title: "Japanese barberry 'Rose Glow'",           kind: 0, zone_min: 4, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Berberis thunbergii 'Marshall's Upright'",        title: "Japanese barberry 'Marshall's Upright'",  kind: 0, zone_min: 4, zone_max: 8

Plant.create grower_id: grower_id, title_la: "Pinus thunbergii 'Thunderhead'",        title: "Japanese black pine 'Thunderhead'",  kind: 1, zone_min: 5, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Abies concolor 'Blue Cloak'",           title: "White fir 'Blue Cloak'",             kind: 1, zone_min: 3, zone_max: 9
Plant.create grower_id: grower_id, title_la: "Acer palmatum 'Monzukushi'",            title: "Japanese maple 'Monzukushi'",        kind: 0, zone_min: 5, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Cercidiphyllum japonicum 'Pendulum'",   title: "Weeping katsura tree",               kind: 0, zone_min: 4, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Picea orientalis 'Aureospicata'",       title: "Oriental spruce 'Aureospicata'",     kind: 1, zone_min: 4, zone_max: 7
Plant.create grower_id: grower_id, title_la: "Ginkgo biloba 'Saratoga'",              title: "Ginkgo tree 'Saratoga'",             kind: 0, zone_min: 4, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Viburnum carlesii",                     title: "Korean  spice viburnum",             kind: 0, zone_min: 4, zone_max: 7
Plant.create grower_id: grower_id, title_la: "Viburnum x carlcephalum 'Cayuga'",      title: "Cayuga' iburnum",                    kind: 0, zone_min: 5, zone_max: 8, hybrid_parentage: "V. carlesii and V. x carlcephalum"
Plant.create grower_id: grower_id, title_la: "Pinus densiflora 'Oculus Draconis'",    title: "Dragon's Eye' Japanese red pine",    kind: 0, zone_min: 5, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Acer palmatum 'Sango-kaku'",            title: "Coral Bark' Japanese maple",         kind: 0, zone_min: 4, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Cercis canadensis 'Pink Heartbreaker'", title: "Weeping redbud 'Pink Heartbreaker'", kind: 1, zone_min: 5, zone_max: 7
Plant.create grower_id: grower_id, title_la: "Pinus parviflora 'Fukuzumi'",           title: "Japanese white pine 'Fukuzumi'",     kind: 0, zone_min: 4, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Pinus sylvestris 'Hillside Creeper'",   title: "Scotch pine 'Hillside Creeper'",     kind: 1, zone_min: 2, zone_max: 8
Plant.create grower_id: grower_id, title_la: "Pinus cembra  'Chalet'",                title: "Swiss stone pine 'Chalet'",          kind: 1, zone_min: 3, zone_max: 7
Plant.create grower_id: grower_id, title_la: "Cryptomeria japonica 'Elegans Aurea'",  title: "Japanese cedar 'Elegans Aurea'",     kind: 1, zone_min: 5, zone_max: 9
