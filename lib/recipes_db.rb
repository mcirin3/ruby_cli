# frozen_string_literal: true

require_relative "recipe"

module LutongBahay
  module RecipesDB
    module_function

    def all
      [
        Recipe.new(
          name: "Chicken Adobo",
          tags: %w[savory classic],
          ingredients: [
            "2 lb chicken (thighs/drumsticks)",
            "1/2 cup soy sauce",
            "1/3 cup cane vinegar",
            "6 cloves garlic, crushed",
            "2 bay leaves",
            "1 tsp whole peppercorns",
            "1 tbsp brown sugar (optional)",
            "1 tbsp oil",
            "1 cup water"
          ],
          steps: [
            "Marinate chicken in soy sauce, garlic, and peppercorns for 30–60 minutes.",
            "Heat oil in pot; brown chicken on all sides.",
            "Pour in marinade, water, and bay leaves. Bring to a boil.",
            "Lower heat; cover and simmer 20 minutes.",
            "Add vinegar (do not stir), simmer 10 minutes uncovered.",
            "Taste; add sugar if desired. Reduce sauce to your liking.",
            "Serve hot over rice."
          ]
        ),
        Recipe.new(
          name: "Sinigang na Baboy",
          tags: %w[sour soup],
          ingredients: [
            "1.5 lb pork ribs/belly",
            "1 medium onion, quartered",
            "2 tomatoes, quartered",
            "8 cups water",
            "1 daikon (labanos), sliced",
            "1 cup string beans, cut",
            "1 eggplant, sliced",
            "Tamarind soup base packet (or fresh tamarind)",
            "Fish sauce and salt to taste",
            "Kangkong/spinach"
          ],
          steps: [
            "Boil pork with onion and tomatoes; skim scum.",
            "Add radish and simmer until tender.",
            "Add eggplant and string beans.",
            "Stir in tamarind base; season with fish sauce.",
            "Add greens; simmer 1–2 minutes. Serve."
          ]
        ),
        Recipe.new(
          name: "Pancit Bihon",
          tags: %w[noodles stir-fry],
          ingredients: [
            "8 oz bihon (rice noodles)",
            "1/2 lb chicken thigh, sliced",
            "1 cup cabbage, shredded",
            "1 carrot, julienned",
            "1/2 cup green beans, sliced",
            "1 onion + 3 cloves garlic",
            "2 tbsp soy sauce + 1 tbsp oyster sauce",
            "2 cups broth",
            "Calamansi/lemon to serve"
          ],
          steps: [
            "Soak bihon noodles in warm water 10 minutes; drain.",
            "Sauté onion and garlic. Add chicken; cook until opaque.",
            "Add vegetables; stir-fry 2–3 minutes.",
            "Pour in broth + sauces; bring to simmer.",
            "Add noodles; toss until broth is absorbed.",
            "Adjust seasoning; serve with calamansi/lemon."
          ]
        ),
        Recipe.new(
          name: "Tinola (Chicken Ginger Soup)",
          tags: %w[soup light],
          ingredients: [
            "1.5 lb chicken, cut",
            "2 tbsp ginger, sliced",
            "1 onion, chopped",
            "1 green papaya or chayote, wedges",
            "5 cups water",
            "Fish sauce, pepper",
            "Malunggay/spinach leaves"
          ],
          steps: [
            "Sauté ginger and onion; add chicken and cook until lightly browned.",
            "Season with fish sauce; add water and simmer 20 minutes.",
            "Add papaya; cook until tender.",
            "Stir in greens; season with pepper. Serve hot."
          ]
        ),
        Recipe.new(
          name: "Halo-Halo (Mixed Shaved Ice Dessert)",
          tags: %w[dessert cold],
          ingredients: [
            "Shaved ice",
            "Evaporated milk",
            "Ube halaya",
            "Leche flan",
            "Sweetened saba, red beans, garbanzos, nata de coco, kaong",
            "Jackfruit, sweetened",
            "Pinipig/crispy rice",
            "Ice cream (ube or mango)"
          ],
          steps: [
            "Layer sweetened fruits/beans in a tall glass.",
            "Add shaved ice to fill.",
            "Top with ube halaya, leche flan, and ice cream.",
            "Pour evaporated milk; sprinkle pinipig. Mix (halo-halo) and enjoy!"
          ]
        )
      ]
    end
  end
end
