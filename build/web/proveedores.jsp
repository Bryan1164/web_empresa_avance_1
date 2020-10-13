<%-- 
    Document   : proveedores
    Created on : 12/10/2020, 11:18:42 AM
    Author     : USUARIO
--%>
<%@page import="modelo.Proveedor"%>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedores</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
   <body>
        
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="index.jsp"><img src="imagenes/socios.png"></a>

        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Productos
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Tabla Productos</a>
                    <a class="dropdown-item" href="marcas.jsp">Tabla Marcas</a>
                </div>    
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Ventas
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Tabla Ventas</a>
                    <a class="dropdown-item" href="clientes.jsp">Tabla Clientes</a>     

                    <a class="nav-link dropdown-toggle text-body" href="empleados.jsp" id="navbardrop" data-toggle="dropdown">
                        Empleados
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="empleados.jsp">Tabla Empleados</a>
                        <a class="dropdown-item" href="puestos.jsp">Tabla Puestos</a>       
                    </div>        
                </div>    
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Compras
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Tabla Compras</a>
                    <a class="dropdown-item" href="proveedores.jsp">Tabla Proveedores</a>
                </div>    
            </li>
        </ul>        
    </nav>
      
     <div class="container">                        
        <br><h3 style="text-align: center;" class="text-danger">Lista de Proveedores</h3><br>
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" style="text-align: center;">
            Ingrese nuevo proveedor
        </button><br><br>

        <!-- Inicio de formulario: Modificar Proveedor -->
        <div class="modal fade" id="modal_ME">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_proveedor" method="post" class="form-group" >
                        
                            <div class="modal-header" >
                                <h4 class="modal-title text-danger" ><b>Modificar/Eliminar Proveedor</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">
                                <label><b>ID del Proveedor</b></label>
                                <input type="text" name="txt_id_proveedor" id="txt_id_proveedor" class="form-control" value="0" readonly>
                                <label><b>Nombre del Proveedor: </b></label>
                                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" placeholder="Ejemplo: Nike" required>
                                <label><b>NIT del Proveedor: </b></label>
                                <input type="text" name="txt_proveedor_nit" id="txt_proveedor_nit" class="form-control" placeholder="Ejemplo: 1121123-k" required>
                                <label><b>Dirección del Proveedor: </b></label>
                                <input type="text" name="txt_proveedor_direccion" id="txt_proveedor_direccion" class="form-control" placeholder="Ejemplo: Guatemala" required>
                                <label><b>Telefono del Proveedor: </b></label>
                                <input type="number" name="txt_proveedor_telefono" id="txt_proveedor_telefono" class="form-control" placeholder="Ejemplo: 22331122" required>                                                                
                            </div>
                    
                            <br>
                            <div class="modal-footer">
                                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-dark btn-lg">Modificar</button>
                                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div>
        
        <!-- Fin de formulario: Modificar Proveedor -->
        
        <!-- Inicio de formulario: Ingresar nuevo Proveedor -->
        
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_proveedor" method="post" class="form-group" >
                        
                            <div class="modal-header">
                                <h4 class="modal-title text-info" ><b >Ingreso de nuevo Puesto</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">                                
                                <label><b>ID del Proveedor</b></label>
                                <input type="text" name="txt_id_proveedor" id="txt_id_proveedor" class="form-control" value="0" readonly>
                                <label><b>Nombre del Proveedor: </b></label>
                                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" placeholder="Ejemplo: Nike" required>
                                <label><b>NIT del Proveedor: </b></label>
                                <input type="text" name="txt_proveedor_nit" id="txt_proveedor_nit" class="form-control" placeholder="Ejemplo: 1121123-k" required>
                                <label><b>Dirección del Proveedor: </b></label>
                                <input type="text" name="txt_proveedor_direccion" id="txt_proveedor_direccion" class="form-control" placeholder="Ejemplo: Guatemala" required>
                                <label><b>Telefono del Proveedor: </b></label>
                                <input type="number" name="txt_proveedor_telefono" id="txt_proveedor_telefono" class="form-control" placeholder="Ejemplo: 22331122" required>
                            </div>
                    
                            <br>
                            <div class="modal-footer">
                                <button class="btn btn-info btn-block"  name="btn_agregar" id="btn_agregar" value="agregar"><b>Agregar</b></button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div>        
        <!-- Fin de formulario: Ingresar nuevo Proveedor -->                    
                      
        <!-- Inicio tabla Proveedor -->        
            <table class="table table-hover " style="text-align: center; ">
                <thead class="thead-dark">
                    <tr>
                        <th>Nombre del Proveedor</th>
                        <th>NIT del Proveedor</th>                       
                        <th>Direccion del Proveedor</th>                       
                        <th>Telefono del Proveedor</th>                       
                    </tr>
                </thead>
                <tbody id="tbl_proveedores" class="table-bordered">                    
                    <% 
                        Proveedor tbl_proveedor = new Proveedor();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = tbl_proveedor.leer();
                        for (int t=0;t<tabla.getRowCount();t++){                          
                            out.println("<tr data-id=" + tabla.getValueAt(t,0) + ">");                                
                            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
                            out.println("</tr>");
                        }
                    %>               
                </tbody>
            </table>
        </div>                             
        <!-- Fin tabla Proveedor -->
        
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>    
        
    <script>
            
            $('#tbl_proveedores').on('click','tr td', function(evt){
               var target,id_proveedor,proveedor,nit,direccion,telefono;
               
               target = $(event.target);
               id_proveedor = target.parent().data('id');               
               proveedor = target.parents("tr").find("td").eq(0).html();
               nit = target.parents("tr").find("td").eq(1).html();
               direccion = target.parents("tr").find("td").eq(2).html();
               telefono = target.parents("tr").find("td").eq(3).html();
              
               $("#txt_id_proveedor").val(id_proveedor);
               $("#txt_proveedor").val(proveedor);
               $("#txt_proveedor_nit").val(nit);                             
               $("#txt_proveedor_direccion").val(direccion);
               $("#txt_proveedor_telefono").val(telefono); 
               $("#modal_ME").modal('show');                                             
            });           
        </script>
        
    </body>
</html>
