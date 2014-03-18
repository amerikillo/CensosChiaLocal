/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesJava;

import conn.ConectionDB;
import java.sql.SQLException;

/**
 *
 * @author Amerikillo
 */
public class CapCensos {

    ConectionDB con = new ConectionDB();

    public void Captura(String id_uni, String tipo, String gnombre_gnk, String juris, String fecha, String hora, String encuestador, String muni, String clues) throws SQLException {
        con.conectar();
        try {
            con.insertar("insert into tb_registro_censos values ('"+id_uni+"', '"+encuestador+"', NOW(), 'INICIO');");
            con.insertar("insert into tb_a (id_uni, campo_5, campo_1, campo_11, campo_12, campo_13, campo_15, campo_7) values('" + id_uni + "', '" + muni + "', '" + gnombre_gnk + "', '" + juris + "', 'CHIAPAS', '"+muni+"', '"+tipo+"', '"+clues+"')");
            con.insertar("insert into tb_b (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_c (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_d (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_e (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_f values ('" + id_uni + "', '')");
        } catch (SQLException e) {
            try {
                con.actualizar("update tb_a set campo_5 = '" + muni + "', campo_1 = '" + gnombre_gnk + "', campo_11 = '" + juris + "', campo_12 = 'CHIAPAS', CAMPO_13='"+muni+"', campo_15 = '"+tipo+"', campo_7='"+clues+"' where id_uni = '" + id_uni + "' ");
            } catch (Exception ex) {
            }
        }
        con.cierraConexion();
    }
}
