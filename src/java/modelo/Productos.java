/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author USUARIO
 */
public class Productos extends Marcas {
    private int id_producto,existencia,id_marca; 
    private String producto,descripcion,imagen,fecha_ingreso;
    private float precio_costo,precio_venta;
    private Conexion cn;

    public Productos() {
    }

    public Productos(int id_producto, int existencia, String producto, String descripcion, String imagen, String fecha_ingreso, float precio_costo, float precio_venta, int id_marca, String marca) {
        super(id_marca, marca);
        this.id_producto = id_producto;
        this.existencia = existencia;
        this.id_marca = id_marca;
        this.producto = producto;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.fecha_ingreso = fecha_ingreso;
        this.precio_costo = precio_costo;
        this.precio_venta = precio_venta;
    }
public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public float getPrecio_costo() {
        return precio_costo;
    }

    public void setPrecio_costo(float precio_costo) {
        this.precio_costo = precio_costo;
    }

    public float getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(float precio_venta) {
        this.precio_venta = precio_venta;
    }
    

    public DefaultTableModel leer() {
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     cn = new Conexion();
     cn.abrir_conexion();
      String query = "SELECT p.id_producto as id,p.producto,m.id_marca,m.marca,p.descripcion,p.imagen,p.precio_costo,p.precio_venta,p.existencia,p.fecha_ingreso FROM productos as p inner join marcas as m on p.id_marca = m.id_marca;";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","producto","id_marca","marca","descripcion","imagen","precio_costo","precio_venta","existencia","fecha_ingreso"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[10];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("producto");
          datos[2] = consulta.getString("id_marca");
          datos[3] = consulta.getString("marca");
          datos[4] = consulta.getString("descripcion");
          datos[5] = consulta.getString("imagen");
          datos[6] = consulta.getString("precio_costo");
          datos[7] = consulta.getString("precio_venta");
          datos[8] = consulta.getString("existencia");
          datos[9] = consulta.getString("fecha_ingreso");
        
          tabla.addRow(datos);
         }
        cn.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
 return tabla;
 }

   public int agregar(){
       int retorno = 0;
   try{
       PreparedStatement parametro;
       cn = new Conexion();
       String query  = "insert into productos(id,id_producto,producto,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso,id_marca,marca) values(?,?,?,?,?,?,?,?,?,?);";
       cn.abrir_conexion();
       parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
       parametro.setInt(1, this.getId_marca());
       parametro.setString(2, getMarca());
       parametro.setInt(3, getId_producto());
       parametro.setString(4, getProducto());
       parametro.setString(5, getDescripcion());
       parametro.setString(6, getImagen());
       parametro.setFloat(7, getPrecio_costo());
       parametro.setFloat(8, getPrecio_venta());
       parametro.setInt(9, getExistencia());
       parametro.setString(10, getFecha_ingreso());
      
       retorno = parametro.executeUpdate();
       cn.cerrar_conexion();
       
   }catch(SQLException ex){
   System.out.println(ex.getMessage());
   retorno = 0;
   }
   return retorno;
   }    
   
   public int modificar(){
       int retorno = 0;
   try{
       PreparedStatement parametro;
       cn = new Conexion();
       String query = "update productos set marca=?,id_producto=?,producto=?,descripcion=?,imagen=?,precio_costo=?,precio_venta=?,existencia=?,fecha_ingreso=? where id_marca= ?;";
       cn.abrir_conexion();
       parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
       parametro.setInt(1, this.getId_marca());
       parametro.setString(2, getMarca());
       parametro.setInt(3, getId_producto());
       parametro.setString(4, getProducto());
       parametro.setString(5, getDescripcion());
       parametro.setString(6, getImagen());
       parametro.setFloat(7, getPrecio_costo());
       parametro.setFloat(8, getPrecio_venta());
       parametro.setInt(9, getExistencia());
       parametro.setString(10, getFecha_ingreso());
       retorno = parametro.executeUpdate();
       cn.cerrar_conexion();
       
   }catch(SQLException ex){
   System.out.println(ex.getMessage());
   retorno = 0;
   }
   return retorno;
   }    
  
   public int eliminar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "delete from productos  where id_msrca = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_marca());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
}

    
}
