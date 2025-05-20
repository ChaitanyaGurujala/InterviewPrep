const cds = require('@sap/cds');

module.exports=cds.service.impl(async function (){
    const {Inventory, SalesOrders} = this.entities;

this.on('lookUpStock',async(req) => {
    const {partNum} =req.data;
    const tx = cds.transaction(req);
    
    const result = await tx.run (
        SELECT.one.from(Inventory).columns('productQty').where('partNum')
    );
    return result?.productQty??0;
    
});

this.on('updateStock', async(req)=> {
    const {partNum,newQty} = req.data;
    const tx =  cds.transaction(req);

    const update = await tx.update(Inventory).set(
        {
            productQty:newQty
        }).where({productName:partNum});

        return update ===1? `Product Stock Updated Successfully`:`Incorrect Product Entered`;

});

});



// Added some corrections to update the service.js file





