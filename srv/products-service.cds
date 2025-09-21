using {com.logali as logali} from '../db/schema';

service ProductsService {
    entity ProductsSrv  as projection on logali.Products;
    entity SuppliersSrv as projection on logali.Suppliers;
    entity UnitOfMeasures as projection on logali.UnitOfMeasures;
}
