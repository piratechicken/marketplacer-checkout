# Marketplacer's Code Exercise

## About Marketplacer

Marketplacer's core product is an e-commerce platform for online
marketplaces that connects customers to a range of products to buy.
We'd like you to build a checkout system for one of our marketplaces.

## The Challenge

Your application should contain the following functionality:

- Load a list of products from a file.
- List product details to the user.
- Add products to a Shopping Cart.
- Apply promotional discounts.
- Calculate and display the total cost.

You can find the list of available products in the attached file `products.json`

List of available promotions is provided below:

- 10% off on total greater than $20
- 15% off on total greater than $50
- 20% off on total greater than $100

The output might but doesn't have to look like the one below:

```
Products in Shopping Cart:
1. Jockey Wheels - Orange - $15.39
2. Chain Ring 146mm - $65.95
3. Carbon Brake Pads - $92.00
4. Front Derailleur - 34.9mm - $31.22

Discount applied: 20% off on total greater than $100

TOTAL: $163.65
```

**Happy coding and good luck! :tada:**

## Recommendations

We encourage you to include a README file with any additional information
you would like to provide us with. It's a great place to include the getting
started how-to, explain your design decisions etc. You're free to submit your
solution as CLI (most common), Rails, or Sinatra application. Remember to
write a clean and well-structured solution and to commit early and often.
Feel free to address the problem creatively and keep the extensibility in mind
as we ask successful candidates to extend their implementation.

## Submitting your solution

Once you’re happy to submit your solution, please use `git bundle` to create a copy of your repository as a single file and send it to us as an email attachment. Alternatively, you can publish your application to Github.

```
git bundle create marketplacer-test.bundle master
```
