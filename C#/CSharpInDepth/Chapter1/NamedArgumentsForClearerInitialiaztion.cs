using System.Collections.Generic;

namespace Chapter1.Listing_1_4
{
    class Product
    {
        private readonly string name;
        private readonly decimal price;

        public string Name { get; }
        public decimal Price { get; private set; }

        public Product(string name, decimal price)
        {
            Name = name;
            Price = price;
        }

        Product()
        {

        }

        public static List<Product> GetSampleProducts()
        {
            return new List<Product>
            {
                new Product (name : "West Side Story", price : 9.99m ),
                // the benefits of explicitly specifying paramter name:
                // 1. reduce confusion when there are too many parameters
                // TMD, you can solve by Builder pattern
                new Product (price : 14.99m , name : "Assassins"), 
                new Product (),
                new Product("Frogs", 13.99m),
            };
        }

        public override string ToString()
        {
            return string.Format("{0}: {1}", Name, Price);
        }
    }
}
