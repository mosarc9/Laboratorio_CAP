const { error } = require("@sap/cds");
const cds = require("@sap/cds"); //Libreria SAP.CDS
const { Orders } = cds.entities("com.training"); //Obtenemos todas las entidades que se ubican en com.trainig

//exportamos un modulo de funcion dentro del fichero
module.exports = (srv) => {

    //       READ      //
    srv.on("READ", "GetOrders", async (req) => {

        if (req.data.ClientEmail !== undefined) {
            return await SELECT.from`com.training.Orders`.where`ClientEmail = ${req.data.ClientEmail}`;
        }
        return await SELECT.from(Orders)
    });

    srv.after("READ", "GetOrders", (data) => {
        return data.map((order) => { order.Reviewed = true });
    });


    //       READ      //
    srv.on("CREATE", "CreateOrder", async (req) => {

        //        await cds.transaction(req).run().then().catch();
        let returnData = await cds.transaction(req)
            .run(
                INSERT.into(Orders).entries({
                    ClientEmail: req.data.ClientEmail,
                    FirstName: req.data.FirstName,
                    LastName: req.data.LastName,
                    CreatedOn: req.data.CreatedOn,
                    Reviewed: req.data.Reviewed,
                    Approved: req.data.Approved
                })
            )
            .then((resolve, reject) => {   //funcion de tipo arrow function
                console.log("Resolve", resolve);
                console.log("Reject", reject);

                if (typeof resolve !== undefined) {
                    return req.data;
                } else {
                    req.error(409, "Registro no insertado");

                }

            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return returnData;
    });

    srv.before("CREATE", "CreateOrder", (req) => {

        req.data.CreatedOn = new Date().toISOString().slice(0,10)
        return req;
    } );
};
