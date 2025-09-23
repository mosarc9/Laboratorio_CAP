using {com.logali as logali} from '../db/schema';
using {com.training as training} from '../db/training';

service ProductsService {
    entity Products      as projection on logali.materials.Products;
    entity Currency      as projection on logali.materials.Currencies;
    entity DimensionUnit as projection on logali.materials.DimensionUnits;
    entity Category      as projection on logali.materials.Categories;
    entity Review        as projection on logali.materials.ProductReview;
    entity UnitOfMeasure as projection on logali.materials.UnitOfMeasures;

    entity Suppliers     as projection on logali.sales.Suppliers;
    entity SalesData     as projection on logali.sales.SalesData;
    entity Month         as projection on logali.sales.Months;
}
