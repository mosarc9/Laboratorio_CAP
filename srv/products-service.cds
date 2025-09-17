using {com.logali as logali} from '../db/schema';

service ProductsService {
    entity ProductsSrv as projection on logali.Products;

}
