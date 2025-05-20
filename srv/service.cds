using {warehouse as db} from '../db/data-model';


service warehouseService @(path: '/WarehouseInfo') {
    entity Inwentoree   as projection on db.Inventory;
    entity SalesOrderruu as projection on db.SalesOrders;

    @requires: 'authenticated-user'
    function lookUpStock(partNum : String)                   returns Integer;

    action   updateStock(partNum : String, newQty : Integer) returns String;
}

// Entity Name Updated to new branch (rebase merge option). 