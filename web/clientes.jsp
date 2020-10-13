<%-- 
    Document   : clientes
    Created on : 12/10/2020, 11:12:17 AM
    Author     : USUARIO
--%>
<%@page import="modelo.Cliente"%>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
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
            <br><h3 style="text-align: center;" class="text-warning">Lista de Clientes</h3><br>
        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" style="text-align: center;">
            Ingrese un nuevo empleado
        </button><br><br>

        <!-- Inicio de formulario: Modificar cliente -->
        <div class="modal fade" id="modal_ME">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_cliente" method="post" class="form-group" >
                        
                            <div class="modal-header" >
                                <h4 class="modal-title text-danger" ><b>Modificar/Eliminar cliente</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">
                                <label><b>ID del Cliente</b></label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                                <label><b>Nombres: </b></label>
                                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" required>
                                <label><b>Apellidos: </b></label>
                                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" required>
                                <label><b>NIT del cliente: </b></label>
                                <input type="text" name="txt_nit" id="txt_nit" class="form-control" required>
                                <label><b>Genero: </b></label>
                                <select name="drop_genero" id="drop_genero" class="form-control" >
                                    <option>--Elija una opcion--</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                                <label><b>Telefono: </b></label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" required>                                                                                              
                                <label><b>Correo electronico: </b></label>
                                <input type="text" name="txt_correo" id="txt_correo" class="form-control" required>                                
                                <label><b>Fecha de ingreso: </b></label>
                                <input type="text" name="txt_f_ingreso" id="txt_f_ingreso" class="form-control" >
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
        
        <!-- Fin de formulario: Modificar cliente -->
        
        <!-- Inicio de formulario: Ingresar nuevo cliente -->
        
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_cliente" method="post" class="form-group" >
                        
                            <div class="modal-header">
                                <h4 class="modal-title text-info" ><b >Ingreso de nuevo empleado</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">                                
                                <label><b>ID del Cliente</b></label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                                <label><b>Nombres: </b></label>
                                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Juan Pedro" required>
                                <label><b>Apellidos: </b></label>
                                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Lopez Perez" required>
                                <label><b>NIT del cliente: </b></label>
                                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ejemplo: 7251269-2" required>
                                <label><b>Genero: </b></label>
                                <select name="drop_genero" id="drop_genero" class="form-control" >
                                    <option>--Elija una opcion--</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                                <label><b>Telefono: </b></label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 12345678" required>                                                                                              
                                <label><b>Correo electronico: </b></label>
                                <input type="text" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo: ejm123@gmail.com" required>                                
                                <label><b>Fecha de ingreso: </b></label>
                                <input type="datetime-local" name="txt_f_ingreso" id="txt_f_ingreso" class="form-control" >                                                                
                            </div>
                    
                            <br>
                            <div class="modal-footer">
                                <button class="btn btn-info btn-block"  name="btn_agregar" id="btn_agregar" value="agregar"><b>Agregar</b></button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div>        
        <!-- Fin de formulario: Ingresar nuevo cliente -->                    
                      
        <!-- Inicio tabla cliente -->        
            <table class="table table-hover " style="text-align: center; ">
                <thead class="thead-dark">
                    <tr>
                        <th>Nombres</th>
                        <th>Apellidos</th>                        
                        <th>NIT</th>
                        <th>Genero</th>
                        <th>Telefono</th>
                        <th>Correo electronico</th>
                        <th>Fecha de ingreso</th>
                    </tr>
                </thead>
                <tbody id="tbl_clientes" class="table-bordered">                    
                    <% 
                        Cliente cliente = new Cliente();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = cliente.leer();
                        for (int t=0;t<tabla.getRowCount();t++){                          
                            out.println("<tr data-id=" + tabla.getValueAt(t,0) + ">");                                
                            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
                            out.println("</tr>");
                        }
                    %>               
                </tbody>
            </table>
        </div>                             
        <!-- Fin tabla cliente -->    
        
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>    
    <script>
            
            $('#tbl_clientes').on('click','tr td', function(evt){
               var target,id,nombres,apellidos,nit,genero,telefono,correo,fecha_ingreso;
               
               target = $(event.target);
               id = target.parent().data('id');
               nombres = target.parents("tr").find("td").eq(0).html();
               apellidos = target.parents("tr").find("td").eq(1).html();
               nit = target.parents("tr").find("td").eq(2).html();
               genero = target.parents("tr").find("td").eq(3).html();
               telefono = target.parents("tr").find("td").eq(4).html();
               correo = target.parents("tr").find("td").eq(5).html();                              
               fecha_ingreso = target.parents("tr").find("td").eq(6).html();
               
              
               $("#txt_id").val(id);
               $("#txt_nombres").val(nombres);
               $("#txt_apellidos").val(apellidos);
               $("#txt_nit").val(nit);
               $("#drop_genero").val(genero);               
               $("#txt_telefono").val(telefono);            
               $("#txt_correo").val(correo);              
               $("#txt_f_ingreso").val(fecha_ingreso);               
               $("#modal_ME").modal('show');                                             
            });           
        </script>
    </body>
</html>
