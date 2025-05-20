namespace warehouse;

entity Inventory {
    key ID: UUID;
    productName: String(32);
    productQty: Integer;
    location: String(32);
    salesorder: Association to SalesOrders on salesorder.item = $self;
}

entity SalesOrders {
    key ID: Integer;
    salesOrderNum: Integer;
    salesOrderQty: Integer;
    item: Association to Inventory;
}

// Removed the View and updated the file.