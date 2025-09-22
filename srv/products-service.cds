using {com.logali as logali} from '../db/schema';

service ProductsService {
    entity Products       as projection on logali.Products;
    entity Suppliers      as projection on logali.Suppliers;
    entity Currency       as projection on logali.Currencies;
    entity DimensionUnit  as projection on logali.DimensionUnits;
    entity Category       as projection on logali.Categories;
    entity SalesData      as projection on logali.SalesData;
    entity Review         as projection on logali.ProductReview;
    entity UnitOfMeasures as projection on logali.UnitOfMeasures;
}
