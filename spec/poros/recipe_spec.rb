require 'rails_helper'

RSpec.describe Recipe do
  describe 'initialize' do
    it 'exists and has attributes' do
      query = 'thailand'
      recipe_data = 
      {
        :uri=>"http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9",
        :label=>"Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
        :image=>
          "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLWVhc3QtMSJHMEUCIQDCTR9hfSHbiJ0IGU6lb2qSmqlW9JVQi4MAYMc47uBvBgIgIL3kCQxla3yCuOJoWgQnGD9ocv5%2BwJgLMmVOAeguMR8qwgUI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDPFKZlWj0dadjWCFZSqWBbsG66bbSrza%2Fn%2BRDuscx4B8k5IklSL0lz%2FJvCBeYhUUlEAGqtIruaqxFdqWwQRM35hR4GpWTv8Ijt7PKiXjBU3X%2BJ3ylTAuDQc3srOHCC43LM4RhmTOI%2BJClDqjiRVImFjaMisYx1vMo82qxMOb8HS9rv%2FcY1MoX117AqxkXnaqAcXDwNI27f6UUXhYcBgm86rfFZjBYXYmli6PazVXLoyvzbG5CkfatHso3KWn7mywVMvsjOP9fG04lthyk%2F5KklmIP5t6AVn9J2Zm%2FPCwAR1kWJUC9D4zRbqVN6QLPmth%2FTybx8EO8Dn1XkQ8w8GmMz4Eh4aUBSRFIHTwnG2ThaTsgUG%2BLlvBfek%2B8OlvdBAIXSRIR8rHthGPEEH2FB0ahzbNMt1uaXvBHOdhEMdD1yOai0qeo7WCKlu5EYDjBj7E15M6FJI2d2VJksPDbI18JSGib214AKAkbIEhSeKn9Us9LAIzCORVG51MI0KH9CbRzDMyBEyCmxMMV8pECjLEv%2Ffwz%2Ff0w6jdTbxFEwLkijhDRHN3Ovbs%2BgjadUGbz%2FGbEma2YZjIqRlnM1rFHnnjG%2F4oz9lOfvYZRp%2BE3Xk4luJAl0tbVDcyj9uIjMXGOnyNnxEj9RCC1eH6cMz57nMaFZDRzdQrRTeHP2zbbgXfrlMKjDK2hmqQVNDfpkKA24akaKP1MLGwuYyKbG1jLIxzePCqZ7M%2BKzpmZvyoFggmeyukIVCojdJT%2BiCMEnGW6REWLfFY0Js11z%2Fysel0BcINwNdZKNqcv74RJI6OGkoiaLJ%2BXLAhlP32DaKQd6p1hHAxeoJGTj2NEUtzu%2FY5qQ%2FKmXAZQlRMk5JyAUikzZ4vJBRpXpk1u5YCcJ92yUpAg%2FdlWS8L%2BqG9MMzxlKAGOrEBeDJOakfIzUGV2HZxPQhTYM77lL7lGzev8dc3Yfqz2RbL4XygCjW%2FOY75AykdxypO0V0MJBLYNvBgWjxmeEUH3hi5SZSsKCk4Tmsm6JBpC2hUrqc0e7ArRMKQSCV%2Bs0ziEvmjnCMCVM2h%2FSSTXkm8MSCRWi6P0QipTwHdXzGjFeKOUn2c%2FyHewGNe5Tlh1YvhNUX3S5H1MC2vsibNcKXTwnYjn7c2dCiKNyytbiETcoty&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230306T020744Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFDD7JSXSH%2F20230306%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d32ccc168c929922ac18a250c2858857189cc52ba84126a6f0104e94028afbc7",
        :images=>
          {:THUMBNAIL=>
            {:url=>
              "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0-s.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLWVhc3QtMSJHMEUCIQDCTR9hfSHbiJ0IGU6lb2qSmqlW9JVQi4MAYMc47uBvBgIgIL3kCQxla3yCuOJoWgQnGD9ocv5%2BwJgLMmVOAeguMR8qwgUI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDPFKZlWj0dadjWCFZSqWBbsG66bbSrza%2Fn%2BRDuscx4B8k5IklSL0lz%2FJvCBeYhUUlEAGqtIruaqxFdqWwQRM35hR4GpWTv8Ijt7PKiXjBU3X%2BJ3ylTAuDQc3srOHCC43LM4RhmTOI%2BJClDqjiRVImFjaMisYx1vMo82qxMOb8HS9rv%2FcY1MoX117AqxkXnaqAcXDwNI27f6UUXhYcBgm86rfFZjBYXYmli6PazVXLoyvzbG5CkfatHso3KWn7mywVMvsjOP9fG04lthyk%2F5KklmIP5t6AVn9J2Zm%2FPCwAR1kWJUC9D4zRbqVN6QLPmth%2FTybx8EO8Dn1XkQ8w8GmMz4Eh4aUBSRFIHTwnG2ThaTsgUG%2BLlvBfek%2B8OlvdBAIXSRIR8rHthGPEEH2FB0ahzbNMt1uaXvBHOdhEMdD1yOai0qeo7WCKlu5EYDjBj7E15M6FJI2d2VJksPDbI18JSGib214AKAkbIEhSeKn9Us9LAIzCORVG51MI0KH9CbRzDMyBEyCmxMMV8pECjLEv%2Ffwz%2Ff0w6jdTbxFEwLkijhDRHN3Ovbs%2BgjadUGbz%2FGbEma2YZjIqRlnM1rFHnnjG%2F4oz9lOfvYZRp%2BE3Xk4luJAl0tbVDcyj9uIjMXGOnyNnxEj9RCC1eH6cMz57nMaFZDRzdQrRTeHP2zbbgXfrlMKjDK2hmqQVNDfpkKA24akaKP1MLGwuYyKbG1jLIxzePCqZ7M%2BKzpmZvyoFggmeyukIVCojdJT%2BiCMEnGW6REWLfFY0Js11z%2Fysel0BcINwNdZKNqcv74RJI6OGkoiaLJ%2BXLAhlP32DaKQd6p1hHAxeoJGTj2NEUtzu%2FY5qQ%2FKmXAZQlRMk5JyAUikzZ4vJBRpXpk1u5YCcJ92yUpAg%2FdlWS8L%2BqG9MMzxlKAGOrEBeDJOakfIzUGV2HZxPQhTYM77lL7lGzev8dc3Yfqz2RbL4XygCjW%2FOY75AykdxypO0V0MJBLYNvBgWjxmeEUH3hi5SZSsKCk4Tmsm6JBpC2hUrqc0e7ArRMKQSCV%2Bs0ziEvmjnCMCVM2h%2FSSTXkm8MSCRWi6P0QipTwHdXzGjFeKOUn2c%2FyHewGNe5Tlh1YvhNUX3S5H1MC2vsibNcKXTwnYjn7c2dCiKNyytbiETcoty&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230306T020744Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFDD7JSXSH%2F20230306%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=568737bc484bdca28a21c33b2a60bac685b574ba9b6f0bcd8521b0142c154a02",
            :width=>100,
            :height=>100},
          :SMALL=>
            {:url=>
              "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0-m.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLWVhc3QtMSJHMEUCIQDCTR9hfSHbiJ0IGU6lb2qSmqlW9JVQi4MAYMc47uBvBgIgIL3kCQxla3yCuOJoWgQnGD9ocv5%2BwJgLMmVOAeguMR8qwgUI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDPFKZlWj0dadjWCFZSqWBbsG66bbSrza%2Fn%2BRDuscx4B8k5IklSL0lz%2FJvCBeYhUUlEAGqtIruaqxFdqWwQRM35hR4GpWTv8Ijt7PKiXjBU3X%2BJ3ylTAuDQc3srOHCC43LM4RhmTOI%2BJClDqjiRVImFjaMisYx1vMo82qxMOb8HS9rv%2FcY1MoX117AqxkXnaqAcXDwNI27f6UUXhYcBgm86rfFZjBYXYmli6PazVXLoyvzbG5CkfatHso3KWn7mywVMvsjOP9fG04lthyk%2F5KklmIP5t6AVn9J2Zm%2FPCwAR1kWJUC9D4zRbqVN6QLPmth%2FTybx8EO8Dn1XkQ8w8GmMz4Eh4aUBSRFIHTwnG2ThaTsgUG%2BLlvBfek%2B8OlvdBAIXSRIR8rHthGPEEH2FB0ahzbNMt1uaXvBHOdhEMdD1yOai0qeo7WCKlu5EYDjBj7E15M6FJI2d2VJksPDbI18JSGib214AKAkbIEhSeKn9Us9LAIzCORVG51MI0KH9CbRzDMyBEyCmxMMV8pECjLEv%2Ffwz%2Ff0w6jdTbxFEwLkijhDRHN3Ovbs%2BgjadUGbz%2FGbEma2YZjIqRlnM1rFHnnjG%2F4oz9lOfvYZRp%2BE3Xk4luJAl0tbVDcyj9uIjMXGOnyNnxEj9RCC1eH6cMz57nMaFZDRzdQrRTeHP2zbbgXfrlMKjDK2hmqQVNDfpkKA24akaKP1MLGwuYyKbG1jLIxzePCqZ7M%2BKzpmZvyoFggmeyukIVCojdJT%2BiCMEnGW6REWLfFY0Js11z%2Fysel0BcINwNdZKNqcv74RJI6OGkoiaLJ%2BXLAhlP32DaKQd6p1hHAxeoJGTj2NEUtzu%2FY5qQ%2FKmXAZQlRMk5JyAUikzZ4vJBRpXpk1u5YCcJ92yUpAg%2FdlWS8L%2BqG9MMzxlKAGOrEBeDJOakfIzUGV2HZxPQhTYM77lL7lGzev8dc3Yfqz2RbL4XygCjW%2FOY75AykdxypO0V0MJBLYNvBgWjxmeEUH3hi5SZSsKCk4Tmsm6JBpC2hUrqc0e7ArRMKQSCV%2Bs0ziEvmjnCMCVM2h%2FSSTXkm8MSCRWi6P0QipTwHdXzGjFeKOUn2c%2FyHewGNe5Tlh1YvhNUX3S5H1MC2vsibNcKXTwnYjn7c2dCiKNyytbiETcoty&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230306T020744Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFDD7JSXSH%2F20230306%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=24ff639cf764a894d3f98f70352e3b5fd278a320d1e5bdcda3ed48ba71fa6bb1",
            :width=>200,
            :height=>200},
          :REGULAR=>
            {:url=>
              "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLWVhc3QtMSJHMEUCIQDCTR9hfSHbiJ0IGU6lb2qSmqlW9JVQi4MAYMc47uBvBgIgIL3kCQxla3yCuOJoWgQnGD9ocv5%2BwJgLMmVOAeguMR8qwgUI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDPFKZlWj0dadjWCFZSqWBbsG66bbSrza%2Fn%2BRDuscx4B8k5IklSL0lz%2FJvCBeYhUUlEAGqtIruaqxFdqWwQRM35hR4GpWTv8Ijt7PKiXjBU3X%2BJ3ylTAuDQc3srOHCC43LM4RhmTOI%2BJClDqjiRVImFjaMisYx1vMo82qxMOb8HS9rv%2FcY1MoX117AqxkXnaqAcXDwNI27f6UUXhYcBgm86rfFZjBYXYmli6PazVXLoyvzbG5CkfatHso3KWn7mywVMvsjOP9fG04lthyk%2F5KklmIP5t6AVn9J2Zm%2FPCwAR1kWJUC9D4zRbqVN6QLPmth%2FTybx8EO8Dn1XkQ8w8GmMz4Eh4aUBSRFIHTwnG2ThaTsgUG%2BLlvBfek%2B8OlvdBAIXSRIR8rHthGPEEH2FB0ahzbNMt1uaXvBHOdhEMdD1yOai0qeo7WCKlu5EYDjBj7E15M6FJI2d2VJksPDbI18JSGib214AKAkbIEhSeKn9Us9LAIzCORVG51MI0KH9CbRzDMyBEyCmxMMV8pECjLEv%2Ffwz%2Ff0w6jdTbxFEwLkijhDRHN3Ovbs%2BgjadUGbz%2FGbEma2YZjIqRlnM1rFHnnjG%2F4oz9lOfvYZRp%2BE3Xk4luJAl0tbVDcyj9uIjMXGOnyNnxEj9RCC1eH6cMz57nMaFZDRzdQrRTeHP2zbbgXfrlMKjDK2hmqQVNDfpkKA24akaKP1MLGwuYyKbG1jLIxzePCqZ7M%2BKzpmZvyoFggmeyukIVCojdJT%2BiCMEnGW6REWLfFY0Js11z%2Fysel0BcINwNdZKNqcv74RJI6OGkoiaLJ%2BXLAhlP32DaKQd6p1hHAxeoJGTj2NEUtzu%2FY5qQ%2FKmXAZQlRMk5JyAUikzZ4vJBRpXpk1u5YCcJ92yUpAg%2FdlWS8L%2BqG9MMzxlKAGOrEBeDJOakfIzUGV2HZxPQhTYM77lL7lGzev8dc3Yfqz2RbL4XygCjW%2FOY75AykdxypO0V0MJBLYNvBgWjxmeEUH3hi5SZSsKCk4Tmsm6JBpC2hUrqc0e7ArRMKQSCV%2Bs0ziEvmjnCMCVM2h%2FSSTXkm8MSCRWi6P0QipTwHdXzGjFeKOUn2c%2FyHewGNe5Tlh1YvhNUX3S5H1MC2vsibNcKXTwnYjn7c2dCiKNyytbiETcoty&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230306T020744Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFDD7JSXSH%2F20230306%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d32ccc168c929922ac18a250c2858857189cc52ba84126a6f0104e94028afbc7",
            :width=>300,
            :height=>300},
          :LARGE=>
            {:url=>
              "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0-l.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLWVhc3QtMSJHMEUCIQDCTR9hfSHbiJ0IGU6lb2qSmqlW9JVQi4MAYMc47uBvBgIgIL3kCQxla3yCuOJoWgQnGD9ocv5%2BwJgLMmVOAeguMR8qwgUI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDPFKZlWj0dadjWCFZSqWBbsG66bbSrza%2Fn%2BRDuscx4B8k5IklSL0lz%2FJvCBeYhUUlEAGqtIruaqxFdqWwQRM35hR4GpWTv8Ijt7PKiXjBU3X%2BJ3ylTAuDQc3srOHCC43LM4RhmTOI%2BJClDqjiRVImFjaMisYx1vMo82qxMOb8HS9rv%2FcY1MoX117AqxkXnaqAcXDwNI27f6UUXhYcBgm86rfFZjBYXYmli6PazVXLoyvzbG5CkfatHso3KWn7mywVMvsjOP9fG04lthyk%2F5KklmIP5t6AVn9J2Zm%2FPCwAR1kWJUC9D4zRbqVN6QLPmth%2FTybx8EO8Dn1XkQ8w8GmMz4Eh4aUBSRFIHTwnG2ThaTsgUG%2BLlvBfek%2B8OlvdBAIXSRIR8rHthGPEEH2FB0ahzbNMt1uaXvBHOdhEMdD1yOai0qeo7WCKlu5EYDjBj7E15M6FJI2d2VJksPDbI18JSGib214AKAkbIEhSeKn9Us9LAIzCORVG51MI0KH9CbRzDMyBEyCmxMMV8pECjLEv%2Ffwz%2Ff0w6jdTbxFEwLkijhDRHN3Ovbs%2BgjadUGbz%2FGbEma2YZjIqRlnM1rFHnnjG%2F4oz9lOfvYZRp%2BE3Xk4luJAl0tbVDcyj9uIjMXGOnyNnxEj9RCC1eH6cMz57nMaFZDRzdQrRTeHP2zbbgXfrlMKjDK2hmqQVNDfpkKA24akaKP1MLGwuYyKbG1jLIxzePCqZ7M%2BKzpmZvyoFggmeyukIVCojdJT%2BiCMEnGW6REWLfFY0Js11z%2Fysel0BcINwNdZKNqcv74RJI6OGkoiaLJ%2BXLAhlP32DaKQd6p1hHAxeoJGTj2NEUtzu%2FY5qQ%2FKmXAZQlRMk5JyAUikzZ4vJBRpXpk1u5YCcJ92yUpAg%2FdlWS8L%2BqG9MMzxlKAGOrEBeDJOakfIzUGV2HZxPQhTYM77lL7lGzev8dc3Yfqz2RbL4XygCjW%2FOY75AykdxypO0V0MJBLYNvBgWjxmeEUH3hi5SZSsKCk4Tmsm6JBpC2hUrqc0e7ArRMKQSCV%2Bs0ziEvmjnCMCVM2h%2FSSTXkm8MSCRWi6P0QipTwHdXzGjFeKOUn2c%2FyHewGNe5Tlh1YvhNUX3S5H1MC2vsibNcKXTwnYjn7c2dCiKNyytbiETcoty&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230306T020744Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFDD7JSXSH%2F20230306%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=52fdf7c809d68de617f960f1c2b4d80690d28b88d73e35537e55c43e86d7fd68",
            :width=>600,
            :height=>600}},
        :source=>"Serious Eats",
        :url=>"https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
        :shareAs=>"http://www.edamam.com/recipe/andy-ricker-s-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup-3a551652abf5a1cef1421660d1b657d9/thailand",
        :yield=>2.0,
        :dietLabels=>["Low-Fat", "Low-Sodium"],
        :healthLabels=>
          ["Low Potassium",
          "Kidney-Friendly",
          "Vegan",
          "Vegetarian",
          "Pescatarian",
          "Dairy-Free",
          "Gluten-Free",
          "Wheat-Free",
          "Egg-Free",
          "Peanut-Free",
          "Tree-Nut-Free",
          "Soy-Free",
          "Fish-Free",
          "Shellfish-Free",
          "Pork-Free",
          "Red-Meat-Free",
          "Crustacean-Free",
          "Celery-Free",
          "Mustard-Free",
          "Sesame-Free",
          "Lupine-Free",
          "Mollusk-Free",
          "Alcohol-Free",
          "No oil added",
          "FODMAP-Free",
          "Kosher"],
        :cautions=>[],
        :ingredientLines=>["2 1/2 ounces palm sugar, coarsely chopped", "1/4 cup plus 1 tablespoon water"],
        :ingredients=>
          [{:text=>"2 1/2 ounces palm sugar, coarsely chopped",
            :quantity=>2.5,
            :measure=>"ounce",
            :food=>"palm sugar",
            :weight=>70.8738078125,
            :foodCategory=>"sugars",
            :foodId=>"food_boy2xh8bm7a0p7asp89y6b7cfu73",
            :image=>"https://www.edamam.com/food-img/8c6/8c6662bd73900645c6385b51a95d9b03.jpg"},
          {:text=>"1/4 cup plus 1 tablespoon water",
            :quantity=>0.25,
            :measure=>"cup",
            :food=>"water",
            :weight=>59.25,
            :foodCategory=>"water",
            :foodId=>"food_a99vzubbk1ayrsad318rvbzr3dh0",
            :image=>"https://www.edamam.com/food-img/5dd/5dd9d1361847b2ca53c4b19a8f92627e.jpg"},
          {:text=>"1/4 cup plus 1 tablespoon water",
            :quantity=>1.0,
            :measure=>"tablespoon",
            :food=>"water",
            :weight=>14.786764781,
            :foodCategory=>"water",
            :foodId=>"food_a99vzubbk1ayrsad318rvbzr3dh0",
            :image=>"https://www.edamam.com/food-img/5dd/5dd9d1361847b2ca53c4b19a8f92627e.jpg"}],
        :calories=>269.3204696875,
        :totalWeight=>144.91057259349998,
        :totalTime=>5.0,
        :cuisineType=>["american"],
        :mealType=>["breakfast"],
        :dishType=>["starter"],
        :totalNutrients=>
          {:ENERC_KCAL=>{:label=>"Energy", :quantity=>269.3204696875, :unit=>"kcal"},
          :FAT=>{:label=>"Fat", :quantity=>0.0, :unit=>"g"},
          :FASAT=>{:label=>"Saturated", :quantity=>0.0, :unit=>"g"},
          :FATRN=>{:label=>"Trans", :quantity=>0.0, :unit=>"g"},
          :FAMS=>{:label=>"Monounsaturated", :quantity=>0.0, :unit=>"g"},
          :FAPU=>{:label=>"Polyunsaturated", :quantity=>0.0, :unit=>"g"},
          :CHOCDF=>{:label=>"Carbs", :quantity=>69.52011808328125, :unit=>"g"},
          :"CHOCDF.net"=>{:label=>"Carbohydrates (net)", :quantity=>69.52011808328125, :unit=>"g"},
          :FIBTG=>{:label=>"Fiber", :quantity=>0.0, :unit=>"g"},
          :SUGAR=>{:label=>"Sugars", :quantity=>68.76176833968749, :unit=>"g"},
          :"SUGAR.added"=>{:label=>"Sugars, added", :quantity=>68.76176833968749, :unit=>"g"},
          :PROCNT=>{:label=>"Protein", :quantity=>0.085048569375, :unit=>"g"},
          :CHOLE=>{:label=>"Cholesterol", :quantity=>0.0, :unit=>"mg"},
          :NA=>{:label=>"Sodium", :quantity=>22.80613677874, :unit=>"mg"},
          :CA=>{:label=>"Calcium", :quantity=>61.046363427805005, :unit=>"mg"},
          :MG=>{:label=>"Magnesium", :quantity=>7.1190103509350005, :unit=>"mg"},
          :K=>{:label=>"Potassium", :quantity=>94.262164390625, :unit=>"mg"},
          :FE=>{:label=>"Iron", :quantity=>0.50320403546875, :unit=>"mg"},
          :ZN=>{:label=>"Zinc", :quantity=>0.028665818821849997, :unit=>"mg"},
          :P=>{:label=>"Phosphorus", :quantity=>2.8349523125, :unit=>"mg"},
          :VITA_RAE=>{:label=>"Vitamin A", :quantity=>0.0, :unit=>"??g"},
          :VITC=>{:label=>"Vitamin C", :quantity=>0.0, :unit=>"mg"},
          :THIA=>{:label=>"Thiamin (B1)", :quantity=>0.0, :unit=>"mg"},
          :RIBF=>{:label=>"Riboflavin (B2)", :quantity=>0.0, :unit=>"mg"},
          :NIA=>{:label=>"Niacin (B3)", :quantity=>0.07796118859375, :unit=>"mg"},
          :VITB6A=>{:label=>"Vitamin B6", :quantity=>0.029058261203125, :unit=>"mg"},
          :FOLDFE=>{:label=>"Folate equivalent (total)", :quantity=>0.708738078125, :unit=>"??g"},
          :FOLFD=>{:label=>"Folate (food)", :quantity=>0.708738078125, :unit=>"??g"},
          :FOLAC=>{:label=>"Folic acid", :quantity=>0.0, :unit=>"??g"},
          :VITB12=>{:label=>"Vitamin B12", :quantity=>0.0, :unit=>"??g"},
          :VITD=>{:label=>"Vitamin D", :quantity=>0.0, :unit=>"??g"},
          :TOCPHA=>{:label=>"Vitamin E", :quantity=>0.0, :unit=>"mg"},
          :VITK1=>{:label=>"Vitamin K", :quantity=>0.0, :unit=>"??g"},
          :"Sugar.alcohol"=>{:label=>"Sugar alcohol", :quantity=>0.0, :unit=>"g"},
          :WATER=>{:label=>"Water", :quantity=>74.91243704090651, :unit=>"g"}},
        :totalDaily=>
          {:ENERC_KCAL=>{:label=>"Energy", :quantity=>13.466023484375, :unit=>"%"},
          :FAT=>{:label=>"Fat", :quantity=>0.0, :unit=>"%"},
          :FASAT=>{:label=>"Saturated", :quantity=>0.0, :unit=>"%"},
          :CHOCDF=>{:label=>"Carbs", :quantity=>23.173372694427083, :unit=>"%"},
          :FIBTG=>{:label=>"Fiber", :quantity=>0.0, :unit=>"%"},
          :PROCNT=>{:label=>"Protein", :quantity=>0.17009713875, :unit=>"%"},
          :CHOLE=>{:label=>"Cholesterol", :quantity=>0.0, :unit=>"%"},
          :NA=>{:label=>"Sodium", :quantity=>0.9502556991141667, :unit=>"%"},
          :CA=>{:label=>"Calcium", :quantity=>6.104636342780501, :unit=>"%"},
          :MG=>{:label=>"Magnesium", :quantity=>1.6950024645083335, :unit=>"%"},
          :K=>{:label=>"Potassium", :quantity=>2.0055779657579786, :unit=>"%"},
          :FE=>{:label=>"Iron", :quantity=>2.795577974826389, :unit=>"%"},
          :ZN=>{:label=>"Zinc", :quantity=>0.26059835292590905, :unit=>"%"},
          :P=>{:label=>"Phosphorus", :quantity=>0.4049931875, :unit=>"%"},
          :VITA_RAE=>{:label=>"Vitamin A", :quantity=>0.0, :unit=>"%"},
          :VITC=>{:label=>"Vitamin C", :quantity=>0.0, :unit=>"%"},
          :THIA=>{:label=>"Thiamin (B1)", :quantity=>0.0, :unit=>"%"},
          :RIBF=>{:label=>"Riboflavin (B2)", :quantity=>0.0, :unit=>"%"},
          :NIA=>{:label=>"Niacin (B3)", :quantity=>0.48725742871093747, :unit=>"%"},
          :VITB6A=>{:label=>"Vitamin B6", :quantity=>2.2352508617788462, :unit=>"%"},
          :FOLDFE=>{:label=>"Folate equivalent (total)", :quantity=>0.17718451953125, :unit=>"%"},
          :VITB12=>{:label=>"Vitamin B12", :quantity=>0.0, :unit=>"%"},
          :VITD=>{:label=>"Vitamin D", :quantity=>0.0, :unit=>"%"},
          :TOCPHA=>{:label=>"Vitamin E", :quantity=>0.0, :unit=>"%"},
          :VITK1=>{:label=>"Vitamin K", :quantity=>0.0, :unit=>"%"}},
        :digest=>
          [{:label=>"Fat",
            :tag=>"FAT",
            :schemaOrgTag=>"fatContent",
            :total=>0.0,
            :hasRDI=>true,
            :daily=>0.0,
            :unit=>"g",
            :sub=>
            [{:label=>"Saturated", :tag=>"FASAT", :schemaOrgTag=>"saturatedFatContent", :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"g"},
              {:label=>"Trans", :tag=>"FATRN", :schemaOrgTag=>"transFatContent", :total=>0.0, :hasRDI=>false, :daily=>0.0, :unit=>"g"},
              {:label=>"Monounsaturated", :tag=>"FAMS", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>false, :daily=>0.0, :unit=>"g"},
              {:label=>"Polyunsaturated", :tag=>"FAPU", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>false, :daily=>0.0, :unit=>"g"}]},
          {:label=>"Carbs",
            :tag=>"CHOCDF",
            :schemaOrgTag=>"carbohydrateContent",
            :total=>69.52011808328125,
            :hasRDI=>true,
            :daily=>23.173372694427083,
            :unit=>"g",
            :sub=>
            [{:label=>"Carbs (net)", :tag=>"CHOCDF.net", :schemaOrgTag=>nil, :total=>69.52011808328125, :hasRDI=>false, :daily=>0.0, :unit=>"g"},
              {:label=>"Fiber", :tag=>"FIBTG", :schemaOrgTag=>"fiberContent", :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"g"},
              {:label=>"Sugars", :tag=>"SUGAR", :schemaOrgTag=>"sugarContent", :total=>68.76176833968749, :hasRDI=>false, :daily=>0.0, :unit=>"g"},
              {:label=>"Sugars, added", :tag=>"SUGAR.added", :schemaOrgTag=>nil, :total=>68.76176833968749, :hasRDI=>false, :daily=>0.0, :unit=>"g"}]},
          {:label=>"Protein", :tag=>"PROCNT", :schemaOrgTag=>"proteinContent", :total=>0.085048569375, :hasRDI=>true, :daily=>0.17009713875, :unit=>"g"},
          {:label=>"Cholesterol", :tag=>"CHOLE", :schemaOrgTag=>"cholesterolContent", :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"mg"},
          {:label=>"Sodium", :tag=>"NA", :schemaOrgTag=>"sodiumContent", :total=>22.80613677874, :hasRDI=>true, :daily=>0.9502556991141667, :unit=>"mg"},
          {:label=>"Calcium", :tag=>"CA", :schemaOrgTag=>nil, :total=>61.046363427805005, :hasRDI=>true, :daily=>6.104636342780501, :unit=>"mg"},
          {:label=>"Magnesium", :tag=>"MG", :schemaOrgTag=>nil, :total=>7.1190103509350005, :hasRDI=>true, :daily=>1.6950024645083335, :unit=>"mg"},
          {:label=>"Potassium", :tag=>"K", :schemaOrgTag=>nil, :total=>94.262164390625, :hasRDI=>true, :daily=>2.0055779657579786, :unit=>"mg"},
          {:label=>"Iron", :tag=>"FE", :schemaOrgTag=>nil, :total=>0.50320403546875, :hasRDI=>true, :daily=>2.795577974826389, :unit=>"mg"},
          {:label=>"Zinc", :tag=>"ZN", :schemaOrgTag=>nil, :total=>0.028665818821849997, :hasRDI=>true, :daily=>0.26059835292590905, :unit=>"mg"},
          {:label=>"Phosphorus", :tag=>"P", :schemaOrgTag=>nil, :total=>2.8349523125, :hasRDI=>true, :daily=>0.4049931875, :unit=>"mg"},
          {:label=>"Vitamin A", :tag=>"VITA_RAE", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"??g"},
          {:label=>"Vitamin C", :tag=>"VITC", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"mg"},
          {:label=>"Thiamin (B1)", :tag=>"THIA", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"mg"},
          {:label=>"Riboflavin (B2)", :tag=>"RIBF", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"mg"},
          {:label=>"Niacin (B3)", :tag=>"NIA", :schemaOrgTag=>nil, :total=>0.07796118859375, :hasRDI=>true, :daily=>0.48725742871093747, :unit=>"mg"},
          {:label=>"Vitamin B6", :tag=>"VITB6A", :schemaOrgTag=>nil, :total=>0.029058261203125, :hasRDI=>true, :daily=>2.2352508617788462, :unit=>"mg"},
          {:label=>"Folate equivalent (total)", :tag=>"FOLDFE", :schemaOrgTag=>nil, :total=>0.708738078125, :hasRDI=>true, :daily=>0.17718451953125, :unit=>"??g"},
          {:label=>"Folate (food)", :tag=>"FOLFD", :schemaOrgTag=>nil, :total=>0.708738078125, :hasRDI=>false, :daily=>0.0, :unit=>"??g"},
          {:label=>"Folic acid", :tag=>"FOLAC", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>false, :daily=>0.0, :unit=>"??g"},
          {:label=>"Vitamin B12", :tag=>"VITB12", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"??g"},
          {:label=>"Vitamin D", :tag=>"VITD", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"??g"},
          {:label=>"Vitamin E", :tag=>"TOCPHA", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"mg"},
          {:label=>"Vitamin K", :tag=>"VITK1", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>true, :daily=>0.0, :unit=>"??g"},
          {:label=>"Sugar alcohols", :tag=>"Sugar.alcohol", :schemaOrgTag=>nil, :total=>0.0, :hasRDI=>false, :daily=>0.0, :unit=>"g"},
          {:label=>"Water", :tag=>"WATER", :schemaOrgTag=>nil, :total=>74.91243704090651, :hasRDI=>false, :daily=>0.0, :unit=>"g"}]
      }

      recipe = Recipe.new(recipe_data, query)

      expect(recipe).to be_a(Recipe)
      expect(recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(recipe.url).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
      expect(recipe.country).to eq("thailand")
      expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLWVhc3QtMSJHMEUCIQDCTR9hfSHbiJ0IGU6lb2qSmqlW9JVQi4MAYMc47uBvBgIgIL3kCQxla3yCuOJoWgQnGD9ocv5%2BwJgLMmVOAeguMR8qwgUI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDPFKZlWj0dadjWCFZSqWBbsG66bbSrza%2Fn%2BRDuscx4B8k5IklSL0lz%2FJvCBeYhUUlEAGqtIruaqxFdqWwQRM35hR4GpWTv8Ijt7PKiXjBU3X%2BJ3ylTAuDQc3srOHCC43LM4RhmTOI%2BJClDqjiRVImFjaMisYx1vMo82qxMOb8HS9rv%2FcY1MoX117AqxkXnaqAcXDwNI27f6UUXhYcBgm86rfFZjBYXYmli6PazVXLoyvzbG5CkfatHso3KWn7mywVMvsjOP9fG04lthyk%2F5KklmIP5t6AVn9J2Zm%2FPCwAR1kWJUC9D4zRbqVN6QLPmth%2FTybx8EO8Dn1XkQ8w8GmMz4Eh4aUBSRFIHTwnG2ThaTsgUG%2BLlvBfek%2B8OlvdBAIXSRIR8rHthGPEEH2FB0ahzbNMt1uaXvBHOdhEMdD1yOai0qeo7WCKlu5EYDjBj7E15M6FJI2d2VJksPDbI18JSGib214AKAkbIEhSeKn9Us9LAIzCORVG51MI0KH9CbRzDMyBEyCmxMMV8pECjLEv%2Ffwz%2Ff0w6jdTbxFEwLkijhDRHN3Ovbs%2BgjadUGbz%2FGbEma2YZjIqRlnM1rFHnnjG%2F4oz9lOfvYZRp%2BE3Xk4luJAl0tbVDcyj9uIjMXGOnyNnxEj9RCC1eH6cMz57nMaFZDRzdQrRTeHP2zbbgXfrlMKjDK2hmqQVNDfpkKA24akaKP1MLGwuYyKbG1jLIxzePCqZ7M%2BKzpmZvyoFggmeyukIVCojdJT%2BiCMEnGW6REWLfFY0Js11z%2Fysel0BcINwNdZKNqcv74RJI6OGkoiaLJ%2BXLAhlP32DaKQd6p1hHAxeoJGTj2NEUtzu%2FY5qQ%2FKmXAZQlRMk5JyAUikzZ4vJBRpXpk1u5YCcJ92yUpAg%2FdlWS8L%2BqG9MMzxlKAGOrEBeDJOakfIzUGV2HZxPQhTYM77lL7lGzev8dc3Yfqz2RbL4XygCjW%2FOY75AykdxypO0V0MJBLYNvBgWjxmeEUH3hi5SZSsKCk4Tmsm6JBpC2hUrqc0e7ArRMKQSCV%2Bs0ziEvmjnCMCVM2h%2FSSTXkm8MSCRWi6P0QipTwHdXzGjFeKOUn2c%2FyHewGNe5Tlh1YvhNUX3S5H1MC2vsibNcKXTwnYjn7c2dCiKNyytbiETcoty&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230306T020744Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFDD7JSXSH%2F20230306%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d32ccc168c929922ac18a250c2858857189cc52ba84126a6f0104e94028afbc7")
    end
  end
end