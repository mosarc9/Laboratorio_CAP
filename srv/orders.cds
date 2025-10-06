using com.training as training from '../db/training';

define service ManageOrders {

    entity GetOrders   as projection on training.Orders;
    entity CreateOrder as projection on training.Orders;
}
