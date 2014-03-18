<%-- 
  Document   : indexCap
  Created on : 01-oct-2013, 12:05:12
  Author     : wence
--%>

<%@page import="servlets.login"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conn.ConectionDB"%>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%java.text.DateFormat df3 = new java.text.SimpleDateFormat("HH:mm:ss"); %>
<%
    HttpSession sesion = request.getSession();
    String info = null;
    String qry = "";

    ConectionDB obj = new ConectionDB();
    ResultSet rset = null;
    ResultSet rset2 = null;

    String id_uni = "", juris = "", muni = "", nombre_gnk = "", tipo = "", hora = "", fecha = "";
    int ban = 0;
    try {
        obj.conectar();
        rset2 = obj.consulta("select id_uni, juris, muni, nombre_gnk, tipo from tb_unidades where id_uni = '" + sesion.getAttribute("id_uni") + "' ");
        while (rset2.next()) {
            id_uni = rset2.getString(1);
            juris = rset2.getString(2);
            muni = rset2.getString(3);
            nombre_gnk = rset2.getString(4);
            tipo = rset2.getString(5);
            hora = df3.format(new java.util.Date());
            fecha = df2.format(new java.util.Date());
            ban = 1;
        }
        obj.cierraConexion();
    } catch (Exception e) {
        id_uni = "";
        juris = "";
        muni = "";
        nombre_gnk = "";
        tipo = "";
        hora = "";
        fecha = "";
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>:: Toma de Censos Veracruz ::</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/login.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="../../assets/js/html5shiv.js"></script>
          <script src="../../assets/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="container">
            <!--div class="row marco" >
                <div class="col-md-4">.col-md-4</div>
                <div class="col-md-4">.col-md-4</div>
                <div class="col-md-4">.col-md-4</div>
            </div-->

            <form name ="forma-login" class="marco" method="post" >
                <!--label for="username" class="uname" data-icon="u" > Your email or username </label-->
                <div class="row">
                    <div class="col-md-4"><img src="imagenes/GNKL_Small.JPG" ></div>
                    <div class="col-md-8"><h2>Subida de Imagenes de Unidades de Salud</h2></div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">

                        </div>
                    </div>
                </div> 

                <br>              
                <!--button name="consultar" value="1" class="btn btn-primary btn-lg btn-block" type="submit">Consultar</button>
                <!--button class="btn btn-primary btn-lg btn-block" type="button" onclick="window.location='modificarCensoH.jsp'">Modificar</button-->
            </form>

             <form method="post" class="marco"  action="FileUploadServlet" enctype="multipart/form-data" name="form1"> 
               <br>
               <div class="col-lg-2"><a href="indexCapR.jsp">Regresar</a></div>
                <div class="col-lg-8"><h4>Datos de la Unidad a Censar</h4></div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-saved"></label></span>
                            <input type="text" name="id_uni" id="id_uni" class="form-control" placeholder="Clave del Hospital" value="<%=id_uni%>" readonly="readonlye">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-header"></label></span>
                            <input type="text" name="nombre_gnk" id="nombre_gnk" class="form-control" placeholder="Nombre del Hospital"  value="<%=nombre_gnk%>" readonly="readonlye">
                        </div>
                    </div>
                </div>



                <div class="row">
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-info-sign"></label></span>
                            <input type="text" name="tipo" id="tipo" class="form-control" placeholder="Categor&iacute;a del Hospital" value="<%=tipo%>" readonly="readonlye">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-hand-right"></label></span>
                            <input type="text" name="juris" id="juris" class="form-control" placeholder="Jurisdicci&oacute;n" value="<%=juris%>" readonly="readonlye">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-home"></label></span>
                            <input type="text" name="muni" id="muni" class="form-control" placeholder="Municipio" value="<%=muni%>" readonly="readonlye">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-calendar"></label></span>
                            <input type="text" name="fecha" id="fecha" class="form-control" placeholder="Fecha de Toma del Censo" value="<%=fecha%>" readonly="readonlye">
                        </div>
                    </div>
                </div>

                

            <div class="container">
                    <div class="row-fluid">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>Selecciona la imagen 1</th><td><input type="file" name="file1" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 2</th><td><input type="file" name="file2" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 3</th><td><input type="file" name="file3" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 4</th><td><input type="file" name="file4" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 5</th><td><input type="file" name="file5" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 6</th><td><input type="file" name="file6" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 7</th><td><input type="file" name="file7" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 8</th><td><input type="file" name="file8" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 9</th><td><input type="file" name="file9" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 10</th><td><input type="file" name="file10" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 11</th><td><input type="file" name="file11" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Selecciona la imagen 12</th><td><input type="file" name="file12" accept=".JPG"/></td>
                                </tr>
                                <tr>

                                    <td colspan="2"><button class="btn btn-block btn-primary">CARGAR IMAGENES</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
            <br>



        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="//code.jquery.com/jquery.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="css/MD5.js"></script>
        <script type="text/javascript" src="js/code_js.js"></script>
    </body>
</html>
