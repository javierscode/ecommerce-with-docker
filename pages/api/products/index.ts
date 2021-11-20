import { NextApiHandler } from "next";
import mockedProducts from "../../../lib/products.json";

export type mockedProductsType = typeof mockedProducts;

const handler: NextApiHandler = async (req, res) => {
  const query = req.query;

  const products = query["category"]
    ? mockedProducts.filter((product) => {
        const searchedCategory = query["category"] as string;
        return product.categories.includes(searchedCategory);
      })
    : mockedProducts;

  res.json(products);
};

export default handler;
