using {warehouse as db} from '../db/data-model';


service warehouseService @(path: '/WarehouseInfo') {
    entity Inventory   as projection on db.Inventory;
    entity SalesOrders as projection on db.SalesOrders;

    @requires: 'authenticated-user'
    function lookUpStock(partNum : String)                   returns Integer;

    action   updateStock(partNum : String, newQty : Integer) returns String;
}


// Added some corrections to update the service.cds file