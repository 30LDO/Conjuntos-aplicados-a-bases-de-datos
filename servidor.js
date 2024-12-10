import {createPool} from "mysql2/promise";

const pool = createPool({
    host: "localhost",
    port: 3306,
    database:"BancoDB",
    user:"root",
    password: "1234" 
})

const closeConnection = () => {
    pool.end((err)=>{
      if(err)
        console.log("Errror al cerrar la conexion: ", err);
    })
  }

const cuentas_creadas = async () => {
    try{
        const result = await pool.query("SELECT id_cuenta, tipo_cuenta, saldo FROM BancoDB.Cuentas LEFT JOIN BancoDB.Clientes ON BancoDB.Cuentas.id_cliente=BancoDB.Clientes.id_cliente")
        console.log(result);
    }catch(error){
        console.error(error);
    }
}

const clientes_creados = async () => {
    try{
        const result = await pool.query("SELECT BancoDB.Clientes.id_cliente, nombre, ciudad FROM BancoDB.Cuentas RIGHT JOIN BancoDB.Clientes ON BancoDB.Cuentas.id_cliente=BancoDB.Clientes.id_cliente")
        console.log(result);
    }catch(error){
        console.error(error);
    }
}

const asociados = async () => {
    try{
        const result = await pool.query("SELECT id_cuenta, tipo_cuenta, nombre, saldo FROM BancoDB.Cuentas JOIN BancoDB.Clientes ON BancoDB.Cuentas.id_cliente=BancoDB.Clientes.id_cliente")
        console.log(result);
    }catch(error){
        console.error(error);
    }
}

const no_asociados = async () => {
    try{
        const result = await pool.query("SELECT BancoDB.Clientes.id_cliente, nombre FROM BancoDB.Cuentas CROSS JOIN BancoDB.Clientes ON BancoDB.Cuentas.id_cliente=BancoDB.Clientes.id_cliente")
        console.log(result);
    }catch(error){
        console.error(error);
    }
}

cuentas_creadas();
clientes_creados();
asociados();
no_asociados();







