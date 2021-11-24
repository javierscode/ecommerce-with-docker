import Product from "./product";

export interface OrderByDB {
    id: string;
    date_created: string;
    customer_name: string;
    customer_surname: string;
    customer_postal_code: string;
    customer_city: string;
    order_id: string;
    cart_id: number;
    product_id: number;
    quantity: number;
    name: string;
    variant_name: string;
    description: string;
    image_url:  string;
    price: number;
}

export interface Order {
    id: string;
    date_created: string;
    customer_name: string;
    customer_surname: string;
    customer_postal_code: string;
    customer_city: string;
    products: Array<{
        name: string;
        variant_name: string;
        description: string;
        image_url:  string;
        price: number;
        quantity: number;
    }>;
}
