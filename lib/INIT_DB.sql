USE ecommerce;

DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    variant_name varchar(255),
    description TEXT,
    image_url varchar(255),
    price FLOAT(6, 2),
    PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS Categories;
CREATE TABLE Categories (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Products_Categories;
CREATE TABLE Products_Categories (
    product_id int NOT NULL,
    category_id int NOT NULL,
    PRIMARY KEY (product_id, category_id)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    id int NOT NULL AUTO_INCREMENT,
    date_created DATETIME,
    customer_name varchar(255),
    customer_surname varchar(255),
    customer_address varchar(255),
    customer_postal_code varchar(255),
    customer_city varchar(255),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Carts;
CREATE TABLE Carts (
    id int NOT NULL AUTO_INCREMENT,
    product_id int NOT NULL,
    quantity int NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Orders_Carts;
CREATE TABLE Orders_Carts (
    order_id int NOT NULL,
    cart_id int NOT NULL,
    PRIMARY KEY (order_id, cart_id)
);

INSERT INTO Categories (name)
VALUES ('Facial'),
    ('Corporal'),
    ('Capilar'),
    ('Sólidos'),
    ('Rutinas');

INSERT INTO Products (
        name,
        variant_name,
        description,
        image_url,
        price
    )
VALUES (
        "Omega Rich Well-Ageing Cream",
        NULL,
        "Omega Rich redefine, revoluciona y reinterpreta el concepto anti-aging. Los últimos estudios científicos indican que el envejecimiento se produce por la pérdida de nuestra estructura epigenética, la energía celular baja con los años, el NAD y el ATP, y no activamos las sirtuinas y la ruta metabólica AMPK, la llave para mantenernos jóvenes más tiempo. Omega Rich es un tratamiento 360º para mejorar la edad biológica de tu piel facial, reparar el daño celular y reestructurar la producción de proteínas para revertir arrugas, líneas de expresión, flacidez, piel apagada y piel deshidratada. Omega Rich incorpora una extraordinaria concentración de 8 activos clínicos naturales, los más potentes, la Ribosa, el Glucógeno vegetal, el Young Skin Booster y un Smart Hyaluronic Acid Capsules de varios pesos moleculares para obtener resultados visibles a partir de los 28 días. Su textura te enamorará desde la primera aplicación, se funde con tu piel para un acabado jugoso. Omega Rich no es una crema anti-aging, es ciencia natural para envejecer mejor. ¡La era del well-ageing ha llegado!",
        "https://www.freshlycosmetics.com/img/media/290/omegarich_1_large_default.jpg?9becd60a962291584e07ea9c189f4393",
        "23.4"
    ),
    (
        "Rose Quartz Facial Cleanser",
        "Estándar  (100ml)",
        "Este innovador gel limpiador facial de pH fisiológico combina increíbles extractos de plantas con una elevada concentración de saponinas. El Rose Quartz Facial Cleanser es una innovadora alternativa natural no irritante que limpia y elimina residuos e impurezas, aportando a tu piel una extraordinaria concentración de activos vegetales para regular la secreción sebácea y reducir los poros abiertos. Estos glucósidos naturales con propiedades similares a las del jabón no tensan ni irritan la piel. ¡Limpia en profundidad sin resecar ni irritar la piel y enamórate de su textura cremosa e increíble perfume frutal y floral!",
        "https://www.freshlycosmetics.com/img/media/87/Winner_RoseQarzt_premio_large_default.jpg?be26a168582b191c56ab201327ba4274",
        "10.8"
    ),
    (
        "Golden Radiance Body Oil",
        "Estándar  (100ml)",
        "El aceite corporal 100% natural que concentra en un perfecto balance los 12 mejores aceites vegetales y tecnologías naturales para nutrir e hidratar tu piel, reducir la celulitis y mejorar la apariencia de estrías y cicatrices. Su composición incluye aceites vegetales de alta calidad y primera prensada en frío como el de marula virgen, chía virgen, babasú orgánico, jojoba orgánico, rosa mosqueta, avellana orgánico y macadamia. El Golden Radiance Body Oil es la perfecta combinación de ingredientes y activos naturales para nutrir la piel, actuando como reductor, anticelulítico, tratando estrías y cicatrices y mejorando la apariencia de la piel para que tenga un aspecto ¡siempre radiante!",
        "https://www.freshlycosmetics.com/img/media/75/body-oil-aceite-corporal-es-1-telva_large_default.jpg?0443adc0ed63c16225c7062ed20bddba",
        "15.6"
    ),
    (
        "Azelaic Radiance Face Treatment",
        NULL,
        "No se trata de una crema hidratante, sino de un tratamiento facial diseñado específicamente para pieles reactivas y con tendencia al acné. Si buscas prevenir y tratar los signos del acné, rosácea y cuperosis como las espinillas, los puntos negros, la inflamación, las rojeces y las erupciones, ¡este es el tratamiento perfecto para ti! Saluda a una piel uniforme, sedosa y suave en tan solo 14 días de aplicación continua.",
        "https://www.freshlycosmetics.com/img/media/197/AzelaicRadianceFaceTreatment_fondoblanco_large_default.jpg?86f2c4e569711df2691c59546b12e3b7",
        "21"
    ),
    (
        "Blue Radiance Enzymatic Serum",
        NULL,
        "Renueva extraordinariamente y elimina las células muertas de la piel consiguiendo una piel visiblemente más suave, uniforme y luminosa. Este sérum facial exfoliante apto para pieles sensibles, incorpora 12 tecnologías naturales para exfoliar, rejuvenecer, reducir y tratar arrugas, acné, puntos negros, poros abiertos, imperfecciones y enrojecimiento. Consigue un rostro radiante y uniforme en 4 semanas. Esta innovadora alternativa de uso diario a los conocidos exfoliantes ácidos sintéticos AHA y BHA no irrita y suaviza la piel gracias a potentes activos como enzimas de papaya y granada, probiotic lactococcus y alternativas vegetales a los retinoides. ¡Sus resultados visibles desde la primera aplicación harán del Blue Radiance Enzymatic Serum un indispensable en tu rutina facial diaria de noche!",
        "https://www.freshlycosmetics.com/img/media/84/editor_BlueRadiance_premio_large_default.jpg?ff21be39ef2316eb19bf266a824d66e5",
        "21"
    ),
    (
        "Hyper-Concentrate Eye Contour Serum",
        NULL,
        "Mucho más que un tratamiento. El Hyper Concentrate Eye Contour Serum combina de forma increíble 14 tecnologías clínicas naturales en un solo tratamiento que mejora los signos del envejecimiento del contorno de ojos. Su composición contiene una gran concentración de los activos naturales más innovadores que, aplicados sobre la piel de forma simultánea, tratan ojeras, párpados caídos, líneas de expresión, dinámicas y estáticas, pérdida de elasticidad, bolsas, inflamación, pigmentación desigual y manchas, con resultados visibles a partir de los 14 días de aplicación.",
        "https://www.freshlycosmetics.com/img/media/59/hyper-concentrate-eye-contour-serum-es-1_large_default.jpg?498ca8a83f1632f21b821b8ae41e2259",
        "21"
    ),
    (
        "Hair Radiance Keratin Spray",
        "Estándar  (100ml)",
        "¿Un producto, mil beneficios para tu cabello? Sí, con este reparador en spray con queratina vegetal. La fórmula perfecta, sin sulfatos ni siliconas, para un cabello sano, fuerte, brillante y sedoso. Gracias a sus 6 tecnologías vegetales refuerza y reestructura la fibra capilar desde la primera aplicación. Este spray da solución efectiva a los diferentes retos del cabello: no deja el cabello apelmazado ni sucio/graso, protege el cabello de agentes externos (rayos UV) y del daño térmico de secadores y planchas, y consigue una melena de tacto aterciopelado con un acabado ligero.",
        "https://www.freshlycosmetics.com/img/media/135/keratin-spray-1_large_default.jpg?89dcebfa7c7d31cd9d32da9aaa5ee7cd",
        "9.6"
    ),
    (
        "Hyaluronic Energy Body Serum",
        "Estándar  (100ml)",
        "¡La mejor innovación en activos naturales para unas piernas renovadas! Este potente sérum corporal trata y previene piernas cansadas, varices, acumulación de líquidos, inflamación, mala circulación. Su increíble acción combina 8 exclusivos activos vegetales como el goldenrod , el alga roja, dos tipos de ácido hialurónico vegano y dos potentes activos naturales marinos . ¡Despierta con energía renovada gracias a este innovador sérum corporal con textura de gel , de absorción rápida y energético perfume!",
        "https://www.freshlycosmetics.com/img/media/145/hyaluronicenergybodyserum_premios_large_default.jpg?e4b3b420dac1f1902d4fbd13245a6a03",
        "15.6"
    ),
    (
        "Hair Growth & Density Treatment",
        NULL,
        "El Hair Growth & Density Treatment es la solución efectiva para mejorar la salud de tu cabello, incrementar el crecimiento capilar y frenar su caída con un tratamiento 360º, sin hormonas ni efecto rebote y que mejora los motivos de caída capilar por causas hormonales, nutricionales e inflamatorias. Su fórmula incorpora 10 activos clínicos, ¡toda una inyección de vitalidad para tu cabello! Todo ello gracias a la acción del Smart Growth Activator, un nuevo sistema de entrega desarrollado por Freshly de ingredientes naturales que permiten una mayor penetración y eficacia. ¡Su formulación de rápida absorción y sus resultados a 45, 90 y 120 días harán de él tu estrategia eficaz para la caída capilar!",
        "https://www.freshlycosmetics.com/img/media/289/hairgrowth_1_large_default.jpg?905b949081165fdb12ff17eca7c1b47e",
        "17.4"
    ),
    (
        "Green Vitamin Concentrate Serum",
        NULL,
        "El serum de vitamina C con una tecnología natural antioxidante que protege la piel de los radicales libres gracias a su potente acción regeneradora. Consigue tratar el daño oxidativo, reducir el área y número de manchas solares, combatir la polución y acelerar la reparación celular aportando luminosidad, hidratación y suavidad. ¡Descubre todo lo que puede hacer por ti el potente kakadu plum, mayor fuente de vitamina C, el alga astaxantina, potente antioxidante y el ácido hialurónico vegano que incrementa significativamente la hidratación del rostro!",
        "https://www.freshlycosmetics.com/img/media/35/GreenVitamine_fondoblanco_1_large_default.jpg?1d57fb80914980b19106d86ffbad9a4d",
        "21"
    ),
    (
        "Pacific Ocean Moisturising Gel",
        NULL,
        "Una auténtica revolución para la hidratación facial activa de pieles grasas y mixtas ¡natural, oil free y no-comedogénica! El Pacific Ocean Moisturising Gel es una inyección natural de hidratación y retinol vegetal que asegura un rostro terso, firme y uniforme sin engrasar, sin brillos y sin irritar. Pura innovación natural formulada con 8 potentes tecnologías activas que incorporan un innovador mecanismo para hidratar la piel mixta y grasa, tratar manchas y marcas, regular el sebo, revertir el envejecimiento de la piel y proteger del daño oxidativo y la polución.",
        "https://www.freshlycosmetics.com/img/media/250/pacificocean_1_large_default.jpg?67d3604c3b9079847fc2f54f75e1d86d",
        "17.4"
    ),
    (
        "Pro-Repair Jojoba Hand Treatment",
        NULL,
        "El Pro-Repair Jojoba Hand Treatment consigue que luzcas unas manos suaves y sin grietas durante todo el año. Su tecnología natural de hidratación nutre, repara y mejora la  firmeza, elasticidad y suavidad de las manos y fortalece la queratinización de las uñas gracias a su composición con un 99% de ingredientes naturales. Incluye un potente complejo de plantas xerófitas y ácido hialurónico vegano que mejoran la retención de agua en la piel con un concentrado de extracto de arroz y aceites vegetales nutritivos como la manteca de karité, la manteca de algodón y el aceite de aguacate. ¿Quién podría resistirse a esta cómoda crema de manos con envase sostenible tan beneficiosa para tus manos y para el planeta? ¡Querrás llevarla siempre encima! ",
        "https://www.freshlycosmetics.com/img/media/63/prorepairhand_1_large_default.jpg?27ebda1d6bb8cb14c4117f8e1f1c625f",
        "5.4"
    ),
    (
        "Bloom Orchid Face Cream",
        NULL,
        "¿Buscas una crema facial de día recomendada para piel sensible, deshidratada o reactiva? La Bloom Orchid calma e hidrata tu piel, una crema de día que aportará confort, hidratación y tratamiento antioxidante a tu piel. Con la Bloom Orchid Face Cream reduces la sensibilidad, la sequedad y el efecto de los radicales libres, a base un cóctel de agastache mexicana, concentrado de plantas xéricas, ácido hialurónico vegano y el potente antioxidante astaxantina que protegen e hidratan la piel durante 24 horas. ¡Te encantará su textura, su aplicación, su perfume y eficacia!",
        "https://www.freshlycosmetics.com/img/media/34/bloomorquid_fondoblanco_1_large_default.jpg?cfc58d62a1a5fa191f96aa6ae1a3601c",
        "17.4"
    ),
    (
        "Shampoo SolidPod Refill",
        NULL,
        "¡El champú sólido natural que hará de tu ducha un placer y hábito sostenible! Su formulación incluye la última tecnología en tensioactivos sólidos sin sulfatos, consiguiendo un resultado sin sequedad ni astringencia ¡y así penar el cabello sin dificultad! Con +99% de ingredientes naturales y sin sulfatos ni siliconas, limpia tu cabello en profundidad respetando el cuero cabelludo y reduce su inflamación para un acabado sedoso, brillante, sin efecto frizz y fácil de peinar. Un champú sólido apto para todo tipo de cabellos y testado dermatológicamente en pieles sensibles que:",
        "https://www.freshlycosmetics.com/img/media/312/fshampoo_refill_1_large_default.jpg?4697d460699da3ecfed218c9f4944b3f",
        "5.994"
    ),
    (
        "F SolidPod Shampoo",
        NULL,
        "Reimaginamos el champú sólido en pastilla para que tu experiencia de uso sea increíble y hacer este cambio sostenible, te sea fácil y cómodo. Su formulación incluye la última tecnología en tensioactivos sólidos sin sulfatos, consiguiendo un champú para todo tipo de cabellos, sin sequedad, sin astringencia, sin dificultad de peinado. Un champú sólido con 99% ingredientes naturales, vegano, Cruelty Free y sin sulfatos en formato pastilla. Y todo ello gracias al F SolidPod, el aplicador que hace que el champú dure el doble que las pastillas convencionales y se aproveche al 100%, ¡hasta su último gramo!. Este champú sólido te aportará:",
        "https://www.freshlycosmetics.com/img/media/283/fshampoo_solidpod_1-1_large_default.jpg?ddfe21b4752bdde10bde76ebe401b49e",
        "9.6"
    ),
    (
        "Lime Purifying Facial Toner",
        NULL,
        "¿Por qué utilizar un tónico facial? Porque refresca, prepara la piel para la hidratación, purifica y equilibra el pH de la piel y cierra los poros. Una ráfaga de energía y frescura para aplicar justo después de la limpieza facial. Este tónico está formulado a base de extracto ecológico de aloe vera, bardana y lima, para facilitar la eliminación de toxinas, extractos de cola de caballo y camomila, para la producción de colágeno y un potente extracto de 6 plantas con excelentes propiedades sebo reguladoras, calmantes y astringentes.",
        "https://www.freshlycosmetics.com/img/media/28/Tonico_fondoblanco_1_large_default.jpg?b4cb0d02ef997735748a394804110499",
        "8.4"
    ),
    (
        "Radiant Glow Primer Serum",
        NULL,
        "El Radiant Glow Primer Serum hidrata la piel en profundidad proporcionando el mejor efecto anti-fatiga además de actuar como prebase de maquillaje. Consigue un rostro radiante y saludable con un acabado aterciopelado, suave y glow gracias a sus pequeños destellos procedentes de micas de origen mineral. ¡Es perfecto para usar de prebase o aplicar sin maquillaje!",
        "https://www.freshlycosmetics.com/img/media/212/radiantglowpremierserum_1_large_default.jpg?3258f9fd08e53ebf6aedd35ad8c519f7",
        "17.4"
    ),
    (
        "Endless Eyelashes Pack",
        NULL,
        "Este pack de uso diario te ayudará a conseguir unas pestañas más largas, densas y fuertes, con su formulación a base de activos naturales. Con esta combinación podrás tanto maquillarlas como cuidarlas.",
        "https://www.freshlycosmetics.com/img/media/331/packcuidadoojos_fondoblanco_large_default.jpg?da9ff8304c31e4159e85ab2816bb95be",
        "28.2"
    ),
    (
        "Bye Bye Acne Pack",
        NULL,
        "Este pack de uso diario te ayudará a mejorar el aspecto del acné y controlar la aparición de granitos en el rostro gracias a sus potentes tecnologías naturales y respetuosas con la piel.",
        "https://www.freshlycosmetics.com/img/media/320/pack_acne_fondoblanco_large_default.jpg?3e4fd9c24edd8ea21f9a9d475269420b",
        "47.4"
    ),
    (
        "Peony Limitless Eyelash Serum",
        NULL,
        "Este sérum extraordinariamente innovador, combina más de 8 tecnologías clínicas naturales para conseguir unas pestañas más largas, más densas, más fuertes, más brillantes y con mayor intensidad de color en tan solo 60 días. Su potente fórmula actúa directamente sobre el ciclo de crecimiento capilar, consiguiendo algo espectacular, aumentar la cantidad y el volumen de las pestañas y reduciendo su caída. Este sérum de pestañas contiene una gran concentración de factores de crecimiento capilar vegetales como el azuki sprout, mozuku, wakame, cúrcuma y aceite de ricino. No hay mejor manera de conseguir unas pestañas naturalmente largas y visiblemente más saludables e intensas. Aplícalo antes de ir a dormir para dejar que actúe durante toda la noche. Long life eyelashes!",
        "https://www.freshlycosmetics.com/img/media/142/peonylitmlesseyelash_1_large_default.jpg?b2e806ccfe1d973d33d6a3f515d26cf6",
        "21"
    ),
    (
        "Shower Gel SolidPod Refill",
        NULL,
        "Un gel de ducha sólido natural que deja tu piel suave, nutrida, sin tirantez ni astringencia y 99% origen natural, libre de sulfatos, vegano y Cruelty Free ¡es posible! Su formulación en formato pastilla limpia, hidrata, calma y protege la barrera dérmica a base de suaves tensioactivos cremosos. Revitaliza tus cinco sentidos mientras te duchas con el gel de ducha sólido apto para todo tipo de pieles y testado dermatológicamente en pieles sensibles con excelente biocompatibilidad:",
        "https://www.freshlycosmetics.com/img/media/313/fgel_refill_1_large_default.jpg?2876921e91d37f66b6b712a7a1c9eab0",
        "4.794"
    ),
    (
        "F SolidPod Shower Gel",
        NULL,
        "Aterriza la transformadora experiencia de usar el gel de ducha sólido natural, en formato pastilla, vegano, Cruelty Free y sin sulfatos, como nunca la habías imaginado. Pura innovación en ergonomía, respeto por el planeta y facilidad para un uso cómodo sin que la pastilla se quede pegada, se deshaga o se resbale. Todo ello gracias al F SolidPod, su aplicador que se adapta a tu mano, hace que tu pastilla dure el doble y se aproveche al 100%. Este gel de ducha en pastilla:",
        "https://www.freshlycosmetics.com/img/media/284/fgel_solidpod_1-1_large_default.jpg?ed8f8119d31717818fb4d01cc85f5b95",
        "8.4"
    ),
    (
        "Vegan Hero All-purpose Balm",
        NULL,
        "¡El bálsamo vegano que se convertirá en tu héroe inseparable apto para todas las edades!! Este bálsamo multiusos de uso facial y corporal, apto también para peques, es la alternativa vegana sin cera de abejas ni lanolina, 100% natural, de origen vegetal y sin perfume que concentra 7 activos naturales con resultados clínicos increíbles para 9 superpoderosos usos:",
        "https://www.freshlycosmetics.com/img/media/269/VeganHeroBalm_1_large_default.jpg?1da75ccf45b26c608a298d14c1103467",
        "13.2"
    ),
    (
        "Rose Passion Cleansing Pack",
        NULL,
        "La doble limpieza facial nos encanta y está en tendencia. La eficacia del aceite desmaquillante Silky Passion sumada al poder del gel limpiador Rose Quartz conseguirán retirar todo exceso de suciedad y maquillaje de tu rostro en tan solo dos pasos. Cuidando tu piel sin irritarla gracias a sus ingredientes naturales que aportan gran cantidad de vitaminas a la piel y potentes antioxidantes.",
        "https://www.freshlycosmetics.com/img/media/323/pack_limpieza_fondoblanco_large_default.jpg?ead765d2bb6a3647c7ffadf24bb56b49",
        "17.4"
    ),
    (
        "Red Velvet Oil Serum",
        NULL,
        "Sérum facial 100% natural con 15 aceites vegetales orgánicos y de primera prensada en frío para pieles secas, sensibles y apagadas. Éste sérum no contiene agua para conseguir una mayor penetración de los activos en la piel, aportando la mayor nutrición posible. Incorpora un activo concentrado de Omega 3 marino obtenido algas, que incorpora los subtipos EPA y DHA que contribuye a reducir la inflamación, sensibilidad, rojeces, sequedad y manchas provocadas por el sol. ¡Consigue una piel radiante y aterciopelada con el Red Velvet!",
        "https://www.freshlycosmetics.com/img/media/105/red-velve-aceite-serum-facial-1_large_default.jpg?e80c6398aa268b6cdbf034928b3bc15d",
        "21"
    ),
    (
        "Rose Gold Pack",
        NULL,
        "Prepárate para cuidarte con el Rose Gold Pack que combina 2 best-sellers que te van a enamorar, el deseado Golden Radiance Body Oil y el Rose Quartz Facial Cleanser. ¡Si por separado te encantan, imaginatelos en un mismo pack!",
        "https://www.freshlycosmetics.com/img/media/322/pack_regalosbasicos_fondoblanco_large_default.jpg?884c56d170627cd62f4be841b9bc3acc",
        "23.4"
    ),
    (
        "Body Flame Firming Cream",
        NULL,
        "Reafirma, tonifica e hidrata tu piel con la Body Flame Firming Cream. Esta innovadora crema corporal reafirmante de rápida absorción, combina el potente activo dragon's eye y un concentrado de cafeína natural, ingredientes naturales clave para lograr un notable efecto reductor en la piel. Incluye una elevada concentración de los activos naturales más potentes para estimular la combustión de grasa y aumentar la tersura de la piel, reafirmando los tejidos. Su innovadora fórmula con un 99.9% de ingredientes naturales incorpora un complejo de 7 plantas de alto poder hidratante y anti celulítico, como es la hiedra, el naranjo y la centella asiática, que junto a los extractos de jengibre, pepino y alga fucus estimulan la eliminación de toxinas. Sumando a esta crema corporal reafirmante un importante poder antioxidante y detox. ",
        "https://www.freshlycosmetics.com/img/media/29/bodyflame_fondoblanco_1_large_default.jpg?02496f7a0b63ff28bc629fa0c2da58de",
        "15.6"
    ),
    (
        "Concentrate Treatment",
        NULL,
        "Este tratamiento facial natural incluye dos potentes productos well-ageing para tratar todos los signos del envejecimiento de la piel. Es un tratamiento de 2 pasos que unifica el tono, previene y reduce las líneas de expresión e incrementa la hidratación subcutánea y que además trata específicamente la zona del contorno del ojo.",
        "https://www.freshlycosmetics.com/img/media/61/anti-aging-tratamiento-anti-edad-es-1_large_default.jpg?7b0e0a31ddb1077e7299b2d10e3a6b20",
        "39"
    ),
    (
        "Fresh Green Micellar Water",
        NULL,
        "¿Quieres limpiar tu rostro de manera rápida y cómoda, respetando tu piel? El agua micelar Fresh Green Micellar Water marcará un antes y un después en tu rutina facial. Su formulación de base acuosa retira todas las impurezas y trazas de maquillaje dejando una piel limpia y suave mientras respeta la barrera dérmica. ¡Su perfume de manzana te enamorará!",
        "https://www.freshlycosmetics.com/img/media/48/agua-micelar-fresh-green-1_large_default.jpg?783ce19a9e170f37df2357001c8e2e00",
        "8.4"
    ),
    (
        "Deep Nourish Lip Balm",
        NULL,
        "Este bálsamo labial natural contiene una extraordinaria concentración de la mejor combinación de 3 ceras y mantecas vegetales y 5 aceites y activos vegetales que se mezclan para nutrir, reparar y proteger los labios deshidratados y dañados. Su formulación concentra un 85% de mantecas vegetales de alta calidad como la de karité, cupuaçu y murumuru orgánico y un 15% de aceites como el de maracuyá, almendras orgánico, babasú orgánico y marula virgen. Además, incorpora el complejo de Crambe Abyssinica que aumenta en un 60% la hidratación de los labios a los 5 días de su uso. Su potente formulación se funde instantáneamente en los labios aportando una nutrición y reparación profunda. ¡Su perfume de maracuyá es uno de los más adictivos que jamás hayas probado!",
        "https://www.freshlycosmetics.com/img/media/79/nourish-lip-labial-nutitivo-es-1_large_default.jpg?e6e197f990a4301c4b8685b378ad0263",
        "4.8"
    ),
    (
        "Emerald Clay Facial Mask",
        NULL,
        "Purifica y limpia la piel profundamente con esta mascarilla facial formulada con una elevada concentración de carbón activo, arcillas, algas marinas y enzimas vegetales. Esta innovadora fórmula incluye un activo remineralizante de agua de mar que aporta a la piel un acabado saludable y luminoso, reforzado por la acción antiinflamatoria y antioxidante del regaliz.",
        "https://www.freshlycosmetics.com/img/media/127/emerald_fondoblanco_large_default.jpg?da4bee7c32dc586fc4398dc3e58ce0ca",
        "15.6"
    ),
    (
        "Wonder Curls Routine",
        NULL,
        "Desata el poder natural de tus rizos y ondas con la rutina curly de Freshly. Esta rutina consigue que la melena curly luzca espectacular gracias a la extraordinaria combinación de activos naturales de la crema definidora de rizos, y de la increíble composición 100% natural del sérum en aceite.",
        "https://www.freshlycosmetics.com/img/media/235/wondercourlsroutine_fondoblanco_large_default.jpg?4c66441b0618f5a00c3d4fad56b2138a",
        "17.4"
    ),
    (
        "Vibrant Refreshing Shampoo",
        "Estándar  (250ml)",
        "El champú sin sulfatos ni siliconas que mejorará la salud de tu pelo y tu cuero cabelludo. Este champú natural aporta brillo y una fuerza extraordinarios consiguiendo que el cabello aguante limpio más días gracias a una limpieza suave que respeta la barrera dérmica. La fórmula del Vibrant Refreshing Shampoo, ideal para cabellos con la raíz grasa, incorpora un innovador activo, el active baicalensis, que combinado con el mentol natural, proteína de trigo, inulina vegetal, un potente concentrado de 12 plantas más un complejo de té rooibos y castaño de indias, regulan la secreción sebácea y tratan simultáneamente la caspa, el picor, las irritaciones y la caída del cabello. Además, su fórmula a base de un 99,9% de ingredientes naturales incorpora una concentración excepcional de jugo de aloe vera ecológico que ayuda a mejorar la salud del cuero cabelludo. ",
        "https://www.freshlycosmetics.com/img/media/30/vibrant-champu-sin-sulfatos-siliconas-es-1_large_default.jpg?2d7ba6e0bbbef9589dcbc41eea7972a2",
        "7.2"
    ),
    (
        "Shine Control Pack For Oily Skin",
        NULL,
        "¿Tienes la piel grasa o mixta? ¡Esta es la rutina facial de 4 pasos específica para la piel grasa o mixta oil free y no-comedogénica que consigue una piel firme, tersa y sin brillos!",
        "https://www.freshlycosmetics.com/img/media/261/NEW_shinecontrolpack_1_large_default.jpg?47882c5b76ca29ca6818f874e6d81cdb",
        "51"
    ),
    (
        "Silky Passion Cleansing Oil",
        NULL,
        "Este innovador aceite desmaquillante limpia y repara la piel en profundidad sin irritaciones y respetando las zonas más sensibles como son los ojos gracias a su composición 100% natural.",
        "https://www.freshlycosmetics.com/img/media/214/silkypassion_1_large_default.jpg?76a86d945da0ee40788755451ce8403d",
        "10.8"
    ),
    (
        "Bronzing Radiance Self-Tanning Cream",
        NULL,
        "¡Consigue el bronceado natural y radiante que buscas! Con un cautivador aroma frutal, sin manchas ni sensación grasa, consigue un tono natural, y todo de forma gradual y segura. Esta revolucionaria crema de uso facial y corporal produce un efecto dual único: autobroncea y potencia el bronceado, adaptándose a tu tono de piel, consiguiendo un efecto totalmente natural, sin tonos sintéticos. Un bronceado saludable, sin salir de casa y con resultados visibles a partir de los 3 días.",
        "https://www.freshlycosmetics.com/img/media/268/bronzingradiance_fondoblanco_large_default.jpg?41446751c691900790319b0bc4ac9ca4",
        "17.4"
    ),
    (
        "Haircare Detox Plan",
        "Estándar  (250ml)",
        "Este es el plan de imprescindibles para un cabello repleto de salud. Con la combinación de champú natural y acondicionador reparador, conseguirás liberarte de las siliconas y los sulfatos, y el cabello aguantará limpio más días. ¡Te enamorarás de su aroma cítrico y lucirás una melena saludable, con más brillo y más fuerza!",
        "https://www.freshlycosmetics.com/img/media/32/haircare-detox-plan-es-1_large_default.jpg?b52470ab91192d99896c52bc40de5257",
        "15.6"
    ),
    (
        "Super Cleanser Trio",
        NULL,
        "La limpieza del rostro es la mejor forma de comenzar tu rutina facial. Este pack de uso diario te ayudará a mantener la piel limpia, fresca y tonificada en 3 sencillos pasos a base de activos naturales.",
        "https://www.freshlycosmetics.com/img/media/114/super-cleanser-trio-facial-1_large_default.jpg?89f900f0aaff3c1ec228cc9f057701db",
        "25.2"
    ),
    (
        "Vitamin Complex Facial Plan",
        NULL,
        "El Vitamin Complex Facial Plan combina la mejor tecnología natural antioxidante para el rostro. Esta rutina de 2 pasos incluye un sérum de vitamina C y una crema hidratante que incorporan innovadores extractos naturales que incrementan la hidratación, mejoran la tersura de la piel, bloquean la polución y reducen las rojeces y la inflamación provocado por el estrés.",
        "https://www.freshlycosmetics.com/img/media/36/vitamin-complex-facial-plan-es-1_large_default.jpg?b9d96e8ab9425369a04d881e3cae92fc",
        "35.4"
    ),
    (
        "Freshly Makeup Life Pack",
        NULL,
        "El pack más completo de Freshly Makeup tiene todo lo necesario para maquillar y cuidar tu piel de principio a fin, y ahora, puedes conseguirlo con el mayor descuento del año. ",
        "https://www.freshlycosmetics.com/img/media/321/makeuplifepack_1_fondoblanco_large_default.jpg?dfdfeb6735a995f5d510b520de3de45c",
        "122.5"
    ),
    (
        "Reusable Organic Cotton Pads",
        NULL,
        "Discos fabricados en algodón 100% orgánico con certificado GOTS (Global Organic Textile) y responsable con las personas y el medio ambiente. Estos 6 discos de algodón reutilizables son la perfecta alternativa sostenible a los discos convencionales de usar y tirar tan perjudiciales para el medio ambiente. Además de estar fabricados en algodón orgánico procedente de agricultura ecológica, sostenible y totalmente libre del uso de productos tóxicos como tintes o pesticidas, vienen en una bolsa de tela para su correcto lavado. Planet First! ¡Los Reusable Organic Cotton Pads son sostenibles y el complemento perfecto para tu limpieza facial diaria!",
        "https://www.freshlycosmetics.com/img/media/146/cotton-pads-1_large_default.jpg?23345d9fac4682d6ff432ccce4fa7d5a",
        "7.2"
    ),
    (
        "Citrus Nourishing Shower Gel",
        "Estándar  (250ml)",
        "Calma e hidrata la piel con el gel de ducha natural que limpia la piel reduciendo irritaciones gracias a su fórmula suave que respeta la barrera dérmica. El Gel de Ducha Nutritivo es perfecto para pieles sensibles y atópicas porque contiene solo tensioactivos naturales suaves derivados del coco que generan una espuma cremosa. Este gel de ducha natural de fórmula saludable y segura contiene un 99% de ingredientes de origen natural y restablece las funciones de la piel mediante la acción nutritiva e hidratante del aceite de almendras, el aceite de aguacate, una concentración excepcional de aloe vera y avena. ¡Su olor cítrico además de su agradable y cremosa textura te encantarán!",
        "https://www.freshlycosmetics.com/img/media/27/gel-ducha-nutritivo-1_large_default.jpg?12ab76c649645c8a503a77eeb76946b2",
        "5.7"
    ),
    (
        "Red & Blue Serums Pack",
        NULL,
        "¡Nutrición y exfoliación para un rostro vital y radiante!  El Red & Blue Serums Pack será tu aliado en tu rutina de noche porque concentra 15 de los mejores aceites vegetales y 12 tecnologías naturales para el cuidado del rostro. ",
        "https://www.freshlycosmetics.com/img/media/149/redandblueserumspack_1_large_default.jpg?7f65a5b77f079eb80bb989da922f2993",
        "39"
    ),
    (
        "Blueberry Konjac Face Sponge",
        NULL,
        "Esta esponja sostenible de konjac es puro placer para la limpieza del rostro. Su textura tan suave, esponjosa y agradable, es totalmente respetuosa con la piel, siendo perfecta para pieles sensibles porque no irrita y respeta el pH. Es una esponja vegana, 100% biodegradable y de origen vegetal, ya que procede de la raíz de la planta konjac.",
        "https://www.freshlycosmetics.com/img/media/282/blueberry-face-esponja_1_large_default.jpg?14462e845bc850bf8515dce64b752d7c",
        "3.6"
    ),
    (
        "Curly Vibes Defining Cream",
        NULL,
        " Aprende con Freshly sobre la rutina Curly",
        "https://www.freshlycosmetics.com/img/media/233/curlyvibes_fondoblanco_large_default.jpg?fb0716596ddd72de50b55176adc4bfe8",
        "9"
    ),
    (
        "Nourish Restore Hair Mask",
        NULL,
        "Algunos le llaman mascarilla, nosotros decimos Nourish Restore. Esta mascarilla capilar nutritiva reparadora sin siliconas combina 7 aceites vegetales no grasos de alta calidad y los mejores activos naturales para nutrir, reparar y proteger el cabello y la fibra capilar. Su formulación incluye los mejores aceites vegetales para aportar una intensa hidratación al cabello como el argán orgánico, macadamia, chía extra virgen, rosa mosqueta, karité y aguacate. Además, concentra potentes activos naturales como biopéptidos de la soja, ginseng y un concentrado de alcachofa que preservan la densidad del cabello, cohesionan la cutícula y lo protegen de los agentes externos. ¡Su perfume natural es un cóctel de cítricos y papaya que hace del tratamiento una bomba exótica!",
        "https://www.freshlycosmetics.com/img/media/76/mascarilla-capilar-reparadora-es-1_large_default.jpg?159e81730e8fcb690daf32b088600a50",
        "10.8"
    ),
    (
        "Glow Edition Body Oil",
        NULL,
        "El aceite iluminador corporal Glow Edition Body Oil consigue un efecto glow con destellos dorados y un brillo natural en la piel gracias a micas naturales y sostenibles libres de microplásticos. Su extraordinaria fórmula 100% natural la componen 12 de los mejores aceites vegetales como el aceite de marula virgen, babasú orgánico, jojoba, macadamia y chía virgen, y 2 tecnologías naturales de microalgas que consiguen una solución efectiva a los retos a los que se afronta la piel: deshidratación, envejecimiento, piel atópica, celulitis, estrías, cicatrices. ¿El resultado? Una piel luminosa, tersa e hidratada con un brillo dorado para lucir un aspecto saludable y radiante.",
        "https://www.freshlycosmetics.com/img/media/110/glow_large_default.jpg?be29f3b69e5b099b452ecaa29f6b2bd8",
        "17.4"
    ),
    (
        "Smooth Body Pack",
        "Estándar",
        "¡Los dos imprescindibles de tu rutina corporal para un descanso de 10! Te enamorarás de su potente acción para prevenir y reducir celulitis y estrías, y para tratar piernas cansadas y mejorar la circulación. Un pack creado para lucir una piel firme y un cuerpo saludable, esculpido y tonificado.",
        "https://www.freshlycosmetics.com/img/media/325/packbody_fondoblanco_large_default.jpg?b990e362a40f783186152d942932eea4",
        "28.8"
    ),
    (
        "Pacific & Blue Pack",
        NULL,
        "¿Tienes la piel grasa o mixta? Estos dos productos serán tus mejores aliados para controlar el exceso de sebo manteniendo la hidratación necesaria para la piel grasa o mixta oil free y no-comedogénica. ¡Consigue una piel firme, tersa y sin brillos!",
        "https://www.freshlycosmetics.com/img/media/329/packminishine_fondoblanco_large_default.jpg?dae55e2193e2d347a06ef8195d7e813c",
        "35.4"
    ),
    (
        "Biodegradable Raspberry Body Scrub",
        NULL,
        "Exfolia e hidrata la piel con las mejores partículas naturales biodegradables de bambú y semillas de frambuesa. El exfoliante corporal biodegradable:",
        "https://www.freshlycosmetics.com/img/media/26/raspberrybodyscrub_1_large_default.jpg?0a3826ed61b7366b429635c8880260d1",
        "9.6"
    ),
    (
        "Instant Fresh Hand Sanitiser",
        NULL,
        "¡Higieniza e hidrata tus manos de forma instantánea con el Instant Fresh Hand Sanitiser! Este spray natural limpia, higieniza y mantiene las manos seguras y protegidas. Su balanceada concentración de alcohol vegetal ecológico y activos hidratantes aporta una limpieza profunda sin resecar las manos, clave para respetar la barrera dérmica. Gracias a la acción del concentrado de raponticina y un complejo de plantas purificadoras, este spray de secado rápido y sin aclarado, incrementa la hidratación de la piel estimulando la retención de agua y aportando una sensación instantánea de calma en las manos.",
        "https://www.freshlycosmetics.com/img/media/139/wellnes_individual_premio_large_default.jpg?4c22a3255bd6917dab8db3451dba523c",
        "3.6"
    ),
    (
        "Daily Bath Pack",
        "Estándar (200ml)",
        "La rutina de baño 100% natural para limpiar la piel y el cabello del bebé de forma suave. El Daily Bath Pack contiene el Champú Suave Smiling Kiwi y el Gel de Baño Nutritivo Funny Aloe, los esenciales para bañar al bebé desde su primer día. El champú suave limpia su cabello sin irritar los ojos gracias a ingredientes derivados del coco y el arroz. Y, el gel de baño incorpora una combinación de aceite de algodón, avena, manzana y aloe vera que nutre y protege la piel del bebé. Este pack hará que los más pequeños tengan una experiencia divertida en la bañera, dándote la seguridad de que cuidas su piel con lo más natural. Happy baths, happy family!",
        "https://www.freshlycosmetics.com/img/media/141/dailybathpack_1_large_default.jpg?4ede6760f863e8b3bbea124ee053c06f",
        "12"
    ),
    (
        "Acondicionador Reparador Anti Frizz",
        "Estándar  (250ml)",
        "El acondicionador natural sin siliconas que mejora el peinado y la salud de la fibra capilar. El Acondicionador Reparador Anti-Frizz incorpora la innovadora tecnología natural de encapsulado de rosa polar, que actúa en la fibra capilar regulando y bloqueando la humedad para evitar el encrespamiento. Este acondicionador compuesto por un 99% de ingredientes de origen natural proporciona un efecto reparador y nutritivo mediante la actividad de los aceites vegetales de coco orgánico y manteca de karité. Además, se han incluido activos de vinagre de manzana, granada y verbena que aportan brillo y agentes detoxificantes para proteger el cabello de las agresiones externas.",
        "https://www.freshlycosmetics.com/img/media/31/acondicionador_fondoblanco_1_ES_large_default.jpg?e8cc4ee87f223715edfdf52bfb9266d9",
        "9.6"
    ),
    (
        "Pure Freshness Toothbrush",
        "Verde",
        "Este cepillo de dientes natural y sostenible es apto para veganos, está fabricado en bambú biodegradable, las cerdas son de Nylon 6 y hay 5 colores entre los que elegir. ¡Es el complemento perfecto para acompañar tu pasta de dientes natural Pure Freshness! Elaborado en bambú, una planta con una inigualable capacidad de crecimiento, flexible y resistente con propiedades antibacterianas que ayudan a evitar la proliferación de bacterias y hongos, lo convierten en el material idóneo para sustituir el uso de plásticos. El Nylon 6 por su parte cuenta con el mayor índice de biodegradabilidad para fabricar las cerdas del cepillo sin necesidad de hacer uso de pelo animal. El packaging del cepillo de dientes Pure Freshness Toothbrush es libre de plásticos, 100% reciclable y compostable. La mejor opción para tu sonrisa y la del planeta.",
        "https://www.freshlycosmetics.com/img/media/103/cepillodiente_fondoblanco_1_large_default.jpg?9347abf8a3eaaed6473393b4475e5bc3",
        "2.4"
    ),
    (
        "Powerful Body Trio",
        NULL,
        "¡El trío de ases de tu rutina corporal! Este pack de 3 bestsellers está pensado para lucir una piel hidratada, firme, tonificada y tratar retos a los que se enfrenta la piel como la inflamación, el envejecimiento y la disfunción vascular. ¡Te enamorarás de la combinación de aceite corporal, crema reafirmante y sérum corporal por sus texturas, aromas, y por la sensación y resultados que notarás en la piel!",
        "https://www.freshlycosmetics.com/img/media/164/powerfulbodytrio_1_large_default.jpg?d5ac3ddf4f0cdc6c24cd7bf936b1f8b1",
        "43.2"
    ),
    (
        "Pure Freshness Toothpaste",
        NULL,
        "La pasta de dientes Pure Freshness Toothpaste limpia y refresca dientes, encías y toda la cavidad bucal de forma natural, saludable y respetuosa con el medioambiente.",
        "https://www.freshlycosmetics.com/img/media/68/pasta-dientes-pure-freshness-1_large_default.jpg?414640a56c99eeab6d062b33407b1f2e",
        "3.9"
    ),
    (
        "Radiant Curls Oil Serum",
        NULL,
        " Aprende con Freshly sobre la rutina Curly",
        "https://www.freshlycosmetics.com/img/media/234/radiantcurls_fondoblanco_large_default.jpg?7ab61e18025321e426b5668e59f353f7",
        "11.4"
    ),
    (
        "Soothing Pack For Sensitive Skin",
        NULL,
        "Consigue un rostro limpio, fresco, hidratado, suave y luminoso con esta rutina de 3 pasos de mañana y noche pensada especialmente para piel sensible. Un limpiador facial, una hidratante 24h y un aceite de tratamiento es todo lo que necesitas para cuidar tu piel de forma suave y respetuosa con la barrera dérmica..",
        "https://www.freshlycosmetics.com/img/media/148/soothingpackfotsensitiveskin_1_large_default.jpg?ccc8aa1c9f9540fbbcdbe78324d7694c",
        "45.6"
    ),
    (
        "Sweet Body Pack",
        "Estándar",
        "El cuidado 100% natural más delicado para la piel de bebés y mamás. Acompaña los mimos y caricias más dulces con el Sweet Body Pack de Freshly Kids, combina el Golden Radiance Body Oil para el cuidado de la piel de mamá y la Sweet Apple Body Cream para mimar y calmar la piel del bebé. La perfecta unión entre los mejores aceites vegetales y los ingredientes naturales más beneficiosos para la piel de mayores y pequeños. Cuenta con aceite de jojoba, rosa mosqueta, marula, chía, almendras, algodón, manzana, mango, plátano y aloe vera, todo en un mismo pack. El Sweet Body Pack hidrata y suaviza la piel con los mejores ingredientes de la naturaleza. ¡El cuidado corporal más saludable y “sweet” para bebés y mamás!",
        "https://www.freshlycosmetics.com/img/media/112/sweetbody_fondoblanco_1_large_default.jpg?91293250154f46b418f95b344ad1f578",
        "23.4"
    ),
    (
        "Freshly Kids Life",
        NULL,
        "¡Tu oportunidad de conseguir TODOS los productos de Freshly KIDS a un precio brutal! Es un pack exclusivo de Black Month de edición limitada ¡Que no se te escape, aprovecha los mayores descuentos del año!",
        "https://www.freshlycosmetics.com/img/media/202/kidslifepack_1fondoblanco_large_default.jpg?12238964eb42a4237ac05a64d2888a0f",
        "56"
    ),
    (
        "Healthy Protection Facial Sunscreen",
        NULL,
        "La Healthy Protection Facial Sunscreen con SPF 50 de amplio espectro te protegerá de las radiaciones y del daño celular provocado por los rayos UVA y UVB sin generar residuos en el planeta porque sus ingredientes naturales son parte de él, simplemente vuelven a su origen. Esta crema solar con filtros físicos naturales incorpora el potente antioxidante de polifenoles del lingonberry y la astaxantina que previene el fotoenvejecimiento cutáneo, reduciendo la aparición de arrugas. Su fórmula saludable compuesta por un 99% de ingredientes de origen natural se completa con la actividad del ácido hialurónico vegano que aumenta la retención de agua y los aceites vegetales no-comedogénicos de jojoba, aguacate y almendras. Su textura fluida y de fácil aplicación con acabado mate sin piel blanca la hacen perfecta para los días de exposición solar y el día a día. ¡Disfruta del sol de forma saludable protegiendo tu piel y el planeta con Freshly Cosmetics!",
        "https://www.freshlycosmetics.com/img/media/45/solar_facial_fondoblanco_1_large_default.jpg?063ad2c60c5df98b488cbe76dd0ebdcf",
        "21"
    ),
    (
        "Healthy Protection Pack",
        NULL,
        "¡Protégete del sol de forma saludable y sostenible con este pack! Compuesto por la Healthy Protection Facial Sunscreen y la Healthy Protection Body Sunscreen, ofrecen una protección SPF 50 para protegerte de las radiaciones UVA y UVB gracias a filtros físicos naturales que respetan tu piel y el planeta. Su textura fluida y fácil aplicación sin tacto pegajoso la hacen perfecta para los días de exposición solar y el día a día. ¡Disfruta del sol de forma saludable con Freshly Cosmetics!",
        "https://www.freshlycosmetics.com/img/media/47/healthy-protection-pack-1_large_default.jpg?92bc73c16235dda48fbe6150dd2453d8",
        "35.4"
    ),
    (
        "Healthy Protection Body Sunscreen",
        NULL,
        "Protege y potencia las defensas de tu piel contra el sol y el daño de sus radiaciones, con esta crema solar de amplio espectro SPF 50 que incorpora los mejores filtros físicos naturales que además no dejan residuos en el planeta, siendo biodegradables y respetuosos con el medio ambiente. La Healthy Protection Body Sunscreen incluye una elevada concentración de aloe vera que protege y combate el enrojecimiento cutáneo provocado por el sol. Su acción protectora se potencia al incluir el potente antioxidante astaxantina, que es especialmente eficaz combatiendo los radicales libres provocados por la radiación UVA y UVB. Su fórmula compuesta por un 99% de ingredientes de origen natural se completa con los aceites vegetales de jojoba, aguacate y almendras ricos en vitaminas A, B, E y F, que hidratan y suavizan la piel. Su textura fluida y de fácil aplicación sin tacto pegajoso la hacen perfecta para los días de exposición solar. ¡Disfruta del sol de forma saludable protegiendo tu piel y el planeta con Freshly Cosmetics!",
        "https://www.freshlycosmetics.com/img/media/46/SolarCorporal_fondoblanco_1_large_default.jpg?05c270a4fce577af1123855a32e79de7",
        "17.4"
    ),
    (
        "Superoxide Dismutase Face Mist",
        NULL,
        "Especialmente formulado para tratar pieles grasas, con brillos y acné, esta bruma facial consigue un rostro firme, sin arrugas y libre de imperfecciones. Su increíble fórmula combina 5 tecnologías naturales para hidratar, reducir la secreción sebácea, las líneas de expresión y unificar el tono de la piel. Hidrata la piel sin generar grasa gracias a los activos lotus concentrate, el antioxidante superóxido dismutasa y un complejo de factores de hidratación natural obtenidos del liquen y el musgo. Apto para todo tipo de pieles y súper cómodo y práctico para aplicar en cualquier momento del día ¡te va a encantar!",
        "https://www.freshlycosmetics.com/img/media/69/face-mist-bruma-facial-es-1_large_default.jpg?14ad1c908493b3b42250fad9055a19a1",
        "13.2"
    ),
    (
        "Iconic Mini Serums Pack",
        NULL,
        "¡Iconic Mini Serums Pack la combinación más esperada en versión de 15ml! Combina los 3 sérums faciales Freshly para exfoliar, hidratar en profundidad y tratar arrugas, líneas de expresión, manchas, rojeces, acné, puntos negros e imperfecciones. Este exclusivo pack incluye el Green Vitamin Concentrate Serum, el Red Velvet Oil Serum y el Blue Radiance Enzymatic Serum. Gracias a sus más de 20 tecnologías naturales a base de aceites vegetales y activos naturales, la combinación de estos tres sérums es ideal para lucir un rostro rejuvenecido, hidratado y sin imperfecciones. Aptos para todo tipo de pieles, combínalos en diferentes rutinas de mañana y noche. Su formato es mini pero, ¡sus beneficios son enormes!",
        "https://www.freshlycosmetics.com/img/media/131/iconic-mini-serums-pack-1_large_default.jpg?1de2af60ac7e3d9253ada2f638b3e3f1",
        "35.4"
    ),
    (
        "Cherry Blossom Facial Mask",
        NULL,
        "Repara, nutre y trata la picazón, quemazón, irritación e inflamación de la piel con esta extraordinaria mascarilla facial de textura cremosa, que incorpora una elevada concentración de activos vegetales como la salicornia, siempreviva, agastache mexicana, microalgas y aceites vegetales. Contiene salicornia que aporta un incremento del 206% de hidratación en 2 días, fruto de azaí para nutrir y reforzar la función barrera natural de la piel y ectoína con probada acción antiestrés. Esta mascarilla se completa con la poderosa suma de la planta siempreviva, pimienta de Tasmania, corteza del árbol de Candeia y agastache mexicana que aportan una sensación instantánea de calma, tratando la inflamación y disminuyendo la reactividad de la piel en un 79% en 5 minutos. Consigue una piel nutrida, calmada, saludable y revitalizada. ¡Disfruta de sus más de 20 usos y descubre una sensación instantánea de calma en tu rostro!",
        "https://www.freshlycosmetics.com/img/media/126/cherry-blossom-facial-mask-es-1_large_default.jpg?da6ad3850b79bf7d922c687c4663e116",
        "15.6"
    ),
    (
        "Facial Antiox Plan",
        NULL,
        "Este plan facial, con un enfoque totalmente innovador, incorpora la rutina Green de 4 pasos: Clean, Purify, Antiox & Moisturize para limpiar, purificar, aportar antioxidantes e hidratar la piel mejorando todos los procesos celulares y combatir los efectos negativos de la contaminación, la radiación solar y el estrés. Compuesto por el Fresh Green Micellar Water, el Lime Purifying Facial Toner, Green Vitamin Concentrate Serum y la Bloom Orchid Face Cream, aporta una elevada concentración de extractos y antioxidantes vegetales como la astaxantina, la ciruela kakadu, el brócoli, la manzana verde o la lima para conseguir que tu rostro luzca saludable.",
        "https://www.freshlycosmetics.com/img/media/49/facialantiox_1_large_default.jpg?2b74680a88e039a0ab63e3e84017e801",
        "49.2"
    ),
    (
        "Pure Freshness Pack",
        NULL,
        "¡La pareja perfecta! ¿Buscas un cuidado bucal natural, saludable y sostenible? Aquí lo tienes, el Pure Freshness Pack incluye la pasta de dientes Pure Freshness Toothpaste y el Pure Freshness Toothbrush, una pasta de dientes compuesta de ingredientes y activos naturales y con un envase sostenible de cartón, junto a un cepillo de dientes de bambú, apto para veganos. La pasta de dientes está compuesta de ácido hialurónico, aceite de coco orgánico y aceite esencial de menta para conseguir una mucosa y una membrana bucal saludables. Además, contiene xilitol, un ingrediente natural con una potente actividad anti-caries que consigue también la remineralización del esmalte dental. Por su parte, el Pure Freshness Toothbrush, está fabricado en bambú biodegradable y Nylon 6. Esta interesante combinación conseguirá mejorar tu salud bucal mientras cuidas del planeta.",
        "https://www.freshlycosmetics.com/img/media/104/pure-freshness-pack-1_large_default.jpg?dce7a9bb7aa56eec3e0a2d192b489952",
        "5.4"
    ),
    (
        "Newborn Pack",
        NULL,
        "¡Lo mejor de la naturaleza para cuidar la piel de tu bebé desde su primer día! El Newborn Pack cuenta con 4 imprescindibles 100% naturales, seguros y aptos para pieles atópicas. ",
        "https://www.freshlycosmetics.com/img/media/150/newbornpack_1_large_default.jpg?4ee9f371c068b2dbaed173f6de74fcad",
        "35.4"
    ),
    (
        "Eyeshadow Beauty Brush Pack",
        NULL,
        "El dúo de brochas sostenible que cambiará la forma de maquillar los ojos ha llegado. Suaves, y ergonómicas, fabricadas con materiales sostenibles y respetuosas con tus ojos y con el planeta. ",
        "https://www.freshlycosmetics.com/img/media/231/eyeshadowbeautybrush_fondoblanco_1_large_default.jpg?e2d1a032de574d26270ad577c9f8976c",
        "11.4"
    ),
    (
        "Bronzing Brush Pack",
        NULL,
        "Los polvos bronceadores 100% naturales y la brocha de bambú vegana son perfectos para broncear la piel de forma saludable y sostenible durante todo el año. Cuida y mima la piel del rostro con activos y pigmentos naturales, con la suavidad y delicadeza de los pelitos sintéticos de nuestra brocha multiusos.",
        "https://www.freshlycosmetics.com/img/media/236/bronzing-brush-pack-polvos-brocha-1_large_default.jpg?93b6984fbd852464b6d9b1a2e7b4e9df",
        "19.2"
    ),
    (
        "Mineral Beauty Brush Pack",
        NULL,
        "El pack perfecto para potenciar tu mirada de forma saludable. Las 6 sombras compactas en tono nude, 3 mates y 3 con brillo, permiten hacer multitud de combinaciones duraderas gracias a su increíble fórmula de alta pigmentación. Junto a dos innovadoras brochas, una para aplicar la sombra en el párpado y la otra para difuminar la sombra en el pliegue del ojo.",
        "https://www.freshlycosmetics.com/img/media/230/mineralbeautybrush_fondoblanco_large_default.jpg?e0dd649156176cdeed90f642c8b42414",
        "22.8"
    ),
    (
        "Body Essentials Pack",
        NULL,
        "Siéntete genial de pies a cabeza con el Body Essentials Pack que incluye los imprescindibles para mimar e hidratar tu cuerpo. Limpia y nutre tu piel con el gel de ducha de aceite de aguacate y el efecto depurativo del aloe vera. Luego exfolia tu cuerpo con partículas biodegradables de semillas de frambuesa y polvo de bambú. Por último, suavízala y reafírmala con el aceite de almendras y germen de trigo de la crema corporal reafirmante. Cuando abras esta cajita encontrarás los tres productos Freshly para el cuidado de tu piel corporal, para darte unos baños inolvidables y lucir una piel repleta de salud.",
        "https://www.freshlycosmetics.com/img/media/39/bodyessentials_1_large_default.jpg?816eac06fab40f88e1b969528932d105",
        "27.6"
    ),
    (
        "Makeup Essentials Pack",
        NULL,
        "El Makeup Essentials Pack es el pack más completo de Freshly Makeup para tu rutina diaria de maquillaje. Con 4 productos imprescindibles y con un 99,8% de ingredientes de origen natural contiene el Radiant Glow Primer Serum, serum y prebase de maquillaje en un mismo producto, los Healthy Bronzing Loose Powder, los polvos bronceadores que aportan el efecto sun kissed al rostro, el Iridescent Glow Highlighter el iluminador líquido y multifunción y la Infinite Eyelash Mascara, la máscara de pestañas apta para ojos sensibles.",
        "https://www.freshlycosmetics.com/img/media/276/makeupessentialspack_1_large_default.jpg?e87447409414eb0b5df5a28cd1c5746f",
        "43.2"
    ),
    (
        "Rosacea Treatment Pack",
        NULL,
        "Consigue un rostro uniforme y con tono unificado de la forma más natural. Si tienes rosácea reconocerás zonas más enrojecidas en tu rostro además de tener una piel más sensible y susceptible a los agentes externos. Para cuidar tu piel necesitas productos que la protejan además de actuar sobre las rojeces de forma suave reduciendo la inflamación y su reactividad al entorno. Este pack incluye los imprescindibles para tu rutina facial básica de mañana y noche.",
        "https://www.freshlycosmetics.com/img/media/324/packrosacea_fondoblanco_large_default.jpg?0ad6d56c5b8e289529a511e821d01a1b",
        "45"
    ),
    (
        "Glow Foundation & Concealer Pack",
        NULL,
        "Este pack es la combinación perfecta para unificar el tono de la piel, conseguir un acabado saludable y luminoso, y a la vez reducir imperfecciones y ojeras con los mejores ingredientes naturales.",
        "https://www.freshlycosmetics.com/img/media/327/packbasicglow_fondoblanco_large_default.jpg?5ec00a8a11e498747a5d3293ff00bc57",
        "21"
    ),
    (
        "Satin Foundation & Concealer Pack",
        NULL,
        "Este pack es la combinación perfecta para conseguir un acabado satinado aportando hidratación y nutrientes, y a la vez reducir imperfecciones y ojeras con los mejores ingredientes naturales.",
        "https://www.freshlycosmetics.com/img/media/328/packbasicsatin_fondoblanco_large_default.jpg?e609baeee3a764d3b8b2323d2675f5e5",
        "21"
    ),
    (
        "Ready Steady Pack",
        NULL,
        "Este pack de uso diario te ayudará a conseguir un look radiante y saludable. Aporta brillo y jugosidad a la piel gracias al increíble efecto glow que causan las micas y pigmentos de origen natural. ",
        "https://www.freshlycosmetics.com/img/media/330/glowylookpink_fondoblanco_large_default.jpg?acdd683bb4c2146d76ef9c00d65412bc",
        "23.4"
    ),
    (
        "Must have pack",
        NULL,
        "Este pack de uso diario contiene los básicos que no pueden faltar en tu rutina de maquillaje natural. Aporta brillo y jugosidad a tu piel y color en tus labios con estos dos productos con  una excelente combinación de activos vegetales y pigmentos naturales. ",
        "https://www.freshlycosmetics.com/img/media/333/packmusthave_1_fondoblanco_large_default.jpg?a8b4bc840de41459d5b040b960923c3c",
        "16.2"
    ),
    (
        "Lip Lip Hurray",
        NULL,
        "Este pack de uso diario contiene los básicos para cuidar tus labios y lucirlos radiantes, con un toque de color. Aporta hidratación, brillo, jugosidad y color a tus labios con estos dos productos con una excelente combinación de activos vegetales y pigmentos naturales. ",
        "https://www.freshlycosmetics.com/img/media/334/beautypackmarswhite_1_fondoblanco_large_default.jpg?eb85141623c8eed7eeb1af59bbb79989",
        "16.2"
    );

INSERT INTO Products_Categories (product_id, category_id)
VALUES ("1", "1"),
    ("2", "1"),
    ("3", "2"),
    ("4", "1"),
    ("5", "1"),
    ("6", "1"),
    ("7", "3"),
    ("8", "2"),
    ("9", "3"),
    ("11", "1"),
    ("12", "1"),
    ("13", "2"),
    ("14", "1"),
    ("15", "3"),
    ("15", "4"),
    ("16", "3"),
    ("16", "4"),
    ("17", "1"),
    ("18", "1"),
    ("19", "1"),
    ("19", "5"),
    ("20", "1"),
    ("20", "5"),
    ("21", "1"),
    ("22", "2"),
    ("22", "4"),
    ("23", "2"),
    ("23", "4"),
    ("24", "2"),
    ("24", "1"),
    ("25", "1"),
    ("25", "5"),
    ("26", "1"),
    ("27", "2"),
    ("27", "1"),
    ("27", "5"),
    ("28", "2"),
    ("30", "1"),
    ("30", "5"),
    ("31", "1"),
    ("32", "1"),
    ("33", "1"),
    ("34", "3"),
    ("34", "5"),
    ("35", "3"),
    ("36", "1"),
    ("36", "5"),
    ("37", "1"),
    ("38", "2"),
    ("38", "1"),
    ("39", "3"),
    ("39", "5"),
    ("40", "1"),
    ("40", "5"),
    ("41", "1"),
    ("41", "5"),
    ("42", "5"),
    ("44", "1"),
    ("45", "2"),
    ("46", "1"),
    ("46", "5"),
    ("48", "1"),
    ("50", "3"),
    ("51", "3"),
    ("52", "2"),
    ("53", "2"),
    ("53", "5"),
    ("54", "1"),
    ("54", "5"),
    ("57", "2"),
    ("58", "2"),
    ("59", "5"),
    ("62", "3"),
    ("64", "1"),
    ("65", "2"),
    ("65", "5"),
    ("69", "1"),
    ("70", "3"),
    ("76", "1"),
    ("76", "5"),
    ("77", "5"),
    ("78", "5"),
    ("79", "1"),
    ("80", "2"),
    ("80", "1"),
    ("80", "5"),
    ("81", "2"),
    ("82", "1"),
    ("84", "1"),
    ("84", "5"),
    ("85", "1"),
    ("86", "1"),
    ("86", "5"),
    ("87", "1"),
    ("87", "5"),
    ("88", "5"),
    ("92", "5"),
    ("93", "5"),
    ("95", "5"),
    ("99", "2"),
    ("99", "5"),
    ("100", "5"),
    ("101", "1"),
    ("101", "5"),
    ("102", "5"),
    ("103", "5"),
    ("104", "5"),
    ("105", "5"),
    ("106", "5");
  