<%@page import="conn.ConectionDB"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" session="true" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    //----------------------------------Modulo de Sesiones
    HttpSession sesion = request.getSession();
    String val = "", user = "", id = "";
       String id_uni ="";
    session.getId();
    if (sesion.getAttribute("valida") != null) {
        val = (String) sesion.getAttribute("valida");
        user = (String) sesion.getAttribute("nombre");
        id = (String) sesion.getAttribute("id");
        id_uni = request.getParameter("id_uni");
    }
    if (!val.equals("valida")) {
        response.sendRedirect("index.jsp");
 }
//out.print (val+user+id+session.getId());
//--------------------------------------------------------
    ConectionDB con = new ConectionDB();
    
 


%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <!-- DW6 -->
    <head>
        <script language="javascript" src="list02.js"></script>
        <script language="javascript" src="js/bootstrap-button.js"></script>
        <script src="jquery/jquery.js" type="text/javascript"></script>
        <!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
        <title>:: CONSULTA DE CENSOS ::</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <!-- Bootstrap core CSS -->
        <link href="css/blueberry.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />
        <link  href="css/bootstrap-responsive.css" rel="stylesheet" />
        <link href="css/jumbotron-narrow.css" rel="stylesheet" />

        <script type="text/javascript" src="js/jquery.min.js"></script>

        <script src ="Scripts/jquery-1.6.1.min.js" type = "text/javascript" ></script>
        <!--link rel="stylesheet" href="css/mm_entertainment.css" type="text/css" /-->
        <script language="javascript" src="js/codeJs.js"></script>
        <script language="JavaScript" type="text/javascript" >

            //--------------- LOCALIZEABLE GLOBALS ---------------
            var d = new Date();
            var monthname = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
            //Ensure correct for language. English is "January 1, 2004"
            var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
            //---------------   END LOCALIZEABLE   ---------------

            //<script language="javascript" src="list02.js">
        </script>
        <style type="text/css">
            <!--
            .style1 {
                color: #000000;
                font-weight: bold;
            }
            .style33 {font-size: x-small}
            .style40 {font-size: 9px}
            .style41 {font-size: 9px}
            .style42 {font-family: Arial, Helvetica, sans-serif}
            .style32 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; }
            .style43 {
                font-size: x-small;
                color: #FFFFFF;
                font-weight: bold;
            }
            .style47 {
                font-size: x-small;
                font-weight: bold;
                text-align: center;
            }
            .style49 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; font-weight: bold; }
            .style50 {color: #000000}
            .style51 {color: #BA236A}
            .style58 {font-size: 14px;  font-weight: bold; color: #666666; }
            .style66 {font-size: x-small; font-weight: bold; color: #333333; }
            a:hover {
                color: #333333;
            }
            .style68 {color: #CCCCCC}
            .style75 {color: #333333; }
            a:link {
                color: #711321;
            }
            .style76 {color: #003366}
            .style77 {
                color: #711321;
                font-weight: bold;
            }
            .neg {font-family: Arial, Helvetica, sans-serif;
                  font-size: 14px;
                  font-weight: bold;
                  color: #666;
            }
            .scrollup{
                width:40px;
                height:40px;
                opacity:0.3;
                position:fixed;
                bottom:50px;
                right:100px;
                display:none;
                text-indent:-9999px;
                background: url('icon_top.png') no-repeat;
            }
            .bs-example{
                margin: 50px;
            }
            -->
        </style>
    </head>
    <body>

        <div class="container">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li class="active"><a href="indexMain.jsp">Men&uacute;</a></li>
                    <li><a data-toggle="modal" href="#myModal2">Instrucciones</a></li>
                    <li><a data-toggle="modal" href="#myModal">Sistemas</a></li>
                    <li><a href="index.jsp">Salir</a></li>
                </ul>
                <h3 class="text-primary"><a name="top" id="top"></a>Consulta de Censos Rurales</h3>
            </div>
        </div>



        <table width="900px" border="0" align="center" cellpadding="0" cellspacing="0">

            <tr>
                <td colspan="12">
                    <!-- Default panel contents -->
                    <h2>Seleccione la Unidad Rural de Consulta</h2>
                </td>
                </td>
            </tr>

            <tr>
                <form method="post">
                    <td colspan="7"  class="style58">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><label class="glyphicon glyphicon-header"></label></span>
                                    <select name="id_uni" id="id_yuni" class="form-control">
                                        <option>-- Seleccione Centro de Salud --</option>
                                        <%                                                    con.conectar();
                                            ResultSet rset2 = con.consulta("select t.id_uni, t.nombre_gnk, t.juris from tb_unidades t, tb_a ta where t.id_uni = ta.id_uni order by id_uni asc");
                                            while (rset2.next()) {
                                                out.println("<option value = '" + rset2.getString("id_uni") + "'>" + rset2.getString("juris") + " - " + rset2.getString("nombre_gnk") + "</option>");
                                            }
                                            con.cierraConexion();
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <button class="btn btn-primary btn-block">Ver</button>
                            </div>
                        </div>
                    </td>
                </form>
            </tr>
            <tr>
                <td colspan="7"  class="style43 style51"><hr /></td>
            </tr>
            <tr>
                <td colspan="7"  class="style43 style51"></hr></td>
            </tr>
            <tr>
                <td colspan="10"  class="style58">Seleccione Secci&oacute;n
                    <a href="#a"><input name="a" id="btn_aa" data-toggle="tooltip" title="A. DATOS GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="A" /> </a>
                    <a href="#b"><input name="b" id="btn_bb" data-toggle="tooltip" title="B. TAREAS OPERACIONALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="B" /></a>
                    <a href="#c"><input name="c" id="btn_cc" data-toggle="tooltip" title="C. FARMACIA" type="button" data-loading-text="Loading..." class="btn btn-primary" value="C" /></a>
                    <a href="#d"><input name="d" id="btn_dd" data-toggle="tooltip" title="D. ALMACÉN" type="button" data-loading-text="Loading..." class="btn btn-primary" value="D" /></a>
                    <a href="#e"><input name="e" id="btn_ee" data-toggle="tooltip" title="E. EQUIPO DE CÓMPUTO, INTERNET Y TELEFONÍA" type="button" data-loading-text="Loading..." class="btn btn-primary" value="E" /></a>
                    <a href="#f"><input name="f" id="btn_ff" data-toggle="tooltip" title="F. DESCRIBA OBSERVACIONES Y/O COMENTARIOS GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="F" /></a>
                    <a href="#pic"><button name="pic" id="btn_pic" data-toggle="tooltip" title="G. PICTOGRÁFICO" type="button" data-loading-text="Loading..." class="btn btn-primary">PICTOGRÁFICO</button></a>
                </td>
            </tr>
            <tr>
                <td colspan="12"  class="style58">Elaborado Por: <input name="txtf_elab" id="txtf_elab" type="text" class="form-control neg" onkeypress="return handleEnter(this, event);" size="40" value="GNK Log&iacute;stica S.A. de C.V." /></td>
            </tr>
            <%    con.conectar();
                ResultSet rset = con.consulta("select * from tb_a as a, tb_b as b, tb_c as c, tb_d as d, tb_e as e, tb_f as f, tb_unidades as clave where clave.id_uni=a.id_uni and clave.id_uni=b.id_uni and clave.id_uni=c.id_uni and clave.id_uni=d.id_uni and clave.id_uni=e.id_uni and clave.id_uni=f.id_uni and  clave.id_uni = '" + id_uni + "';");
                while (rset.next()) {
            %>
            <form  method="post" name="form_a" id="form_account_a" class="form-horizontal" action="GuardaSeccion" >
                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="a" id="a"></a>
                            <!-- Default panel contents -->
                            <div class="panel-heading">A. DATOS GENERALES</div>
                        </div>
                    </td>
                </tr>
                <%                        String nomCam = "campo_", nombreC = "";
                    int contCam = 0;
                %>
                <tr>
                    <td width="118" class="style58"><div align="center">A.1</div></td>
                    <td width="297" class="style58">Nombre de la Unidad</td>
                    <td class="style33">
                        <strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>

                        </strong>
                    </td>   
                    <td>&nbsp;</td>
                    <td width="92" bgcolor="#FFFFFF" class="style58">A.2</td>
                    <td class="style58"><div align="left">Direcci&oacute;n</div></td>
                    <td>             

                        <label>    
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="style58">
                        <div align="center">A.3</div>
                    </td>
                    <td class="style58">Referencias</td>
                    <td><label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);"  readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                    <td>&nbsp;</td>
                    <td bgcolor="#FFFFFF" class="style58">A.4</td>
                    <td class="style58"><div align="left">Colonia</div></td>
                    <td><span class="style49">

                            <label>  <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>

                        </span></td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.5</div></td>
                    <td class="style58">Población</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly ><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>  

                        </strong></td>
                    <td>&nbsp;</td>
                    <td bgcolor="#FFFFFF" class="style58">A.6</td>
                    <td width="281" class="style58"><div align="left">C&oacute;digo Postal</div></td>
                    <td width="400"><span class="style49">

                            <label>   <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>  
                        </span></td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.7</div></td>
                    <td class="style58">CLUES</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>  

                        </strong></td>
                    <td>&nbsp;</td>
                    <td class="style58">A.8</td>
                    <td class="style58"><div align="left">Tel&eacute;fono fijo</div></td>
                    <td class="style58"><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                        <%//out.print(nombreC);%></label>  
                    </td>
                </tr>
                <tr>
                    <td class="style58">
                        <div align="center">A.9</div>
                    </td>
                    <td class="style58">Fax</td>
                    <td class="style33">
                        <strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 

                        </strong>
                    </td>
                    <td>&nbsp;</td>
                    <td bgcolor="#FFFFFF" class="style58">A.10</td>
                    <td class="style58"><div align="left">Correo Electr&oacute;nico</div></td>
                    <td><span class="style49">
                            <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label> 
                        </span>
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.11</div></td>
                    <td class="style58">Jurisdicci&oacute;n Perteneciente</td>
                    <td class="style33">
                        <span class="style49">
                            <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label> 
                        </span>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.12</td>
                    <td class="style58">Coordinaci&oacute;n Municipal</td>
                    <td>
                        <span class="style49">
                            <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label> 
                        </span>  
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.13</div></td>
                    <td class="style58">Municipio</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 

                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.14</td>
                    <td class="style58">N&ordm; de Modulos</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    

                        </p></td>
                </tr>
                <tr>
                    <td class="style58"><p align="center" class="style58">A.15</p></td>
                    <td class="style58">Categor&iacute;a</td>
                    <td class="style33">
                        <strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.16</td>
                    <td class="style58">Nombre del Responsable</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    

                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.17</div></td>
                    <td class="style58">Tel&eacute;fono del Responsable</td>
                    <td class="style33">
                        <strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </strong>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.18</td>
                    <td class="style58">Correo Elect. Responsable</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    

                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.19</div></td>
                    <td class="style58">Nombre del Odont&oacute;logo </td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.20</td>
                    <td class="style58">Poblaci&oacute;n Atendida</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.21</div></td>
                    <td class="style58">N&ordm; de Doctores (Base)</td>
                    <td class="style33">
                        <strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly  ><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </strong>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.22</td>
                    <td class="style58">No. Mapa </td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.23</div></td>
                    <td class="style58">N&ordm; de Pasantes</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>   

                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.24</td>
                    <td class="style58">N&ordm; de Enfermeras</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    

                    </td>
                </tr>
                <tr>
                    <td height="26" class="style58"><div align="center">A.25</div></td>
                    <td class="style58">Horario de Atenci&oacute;n </td>
                    <td class="style33"><strong>
                            <label>
                                <span class="style58">Desde:</span></label>
                            <label for="textfield"></label>
                            <input name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%=nombreC%>" size="7" maxlength="7" value="<%=rset.getString(nombreC)%>" readonly />
                            <%//out.print(nombreC);%></label> 
                            <br />
                            <label><span class="style58">Hasta :</span></label>
                            <input name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%=nombreC%>"   size="7" maxlength="7" value="<%=rset.getString(nombreC)%>" readonly />
                            <label><span class="style58">&nbsp;</span>
                                <%//out.print(nombreC);%></label>   

                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.27</td>
                    <td class="style58">Dias Laborales</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.28</div></td>
                    <td class="style58">¿La Unidad cuenta con Servicios?</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 

                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.29</td>
                    <td class="style58">¿Cu&aacute;ntos Servicios?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.30</div></td>
                    <td class="style58">Describa los Servicios</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 

                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.31</td>
                    <td class="style58">Clima Predominante</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>

                    <td colspan="7" class="style58">
                        <div class="panel panel-primary">
                            <!-- Default panel contents -->
                            <!--button type="submit" name="guarda_seccion" value="A" class="btn btn-primary btn-lg btn-block" onclick="return validar_a()">Guardar datos Secci&oacute;n A</button-->
                        </div>
                    </td>
                </tr>               
                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="b" id="b"></a>
                            <!-- Default panel contents -->
                            <div class="panel-heading">B. TAREAS OPERACIONALES</div>
                        </div>
                    </td>
                    <td class="style58">&nbsp;</td>
                </tr>

                <tr> 
                    <td class="style58"><div align="center">B.1</div></td>
                    <td class="style58">¿Existe Sistema Inform&aacute;tico de Captura de Recetas?</td>
                    <td>
                        <span class="style49">
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </span>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.2</div></td>
                    <td class="style58">&iquest;Cu&aacute;ntas Recetas Promedio por d&iacute;a se expiden?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    
                    </td>
                </tr>

                <tr>
                    <td class="style58"><div align="center">B.3</div></td>
                    <td class="style58">&iquest;Cuántos medicamentos preescribe en promedio por receta?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.4</div></td>
                    <td class="style58">Describa el proceso de captura de las recetas</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>

                <tr>
                    <td class="style58"><div align="center">B.5</div></td>
                    <td class="style58">¿Cu&aacute;l es el consumo promedio mensual de piezas?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.6</div></td>
                    <td class="style58">N&uacute;mero de Claves Autorizadas para este Centro </td>
                    <td> 
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="style58">
                        <div align="center">B.7</div>
                    </td>
                    <td class="style58">N&uacute;mero de Claves de Material de Curaci&oacute;n Autorizadas para este Centro</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.8</div></td>
                    <td class="style58">&iquest;Cu&aacute;l es el Procedimiento de Reposici&oacute;n de Inventarios?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label></td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">B.9</div></td>
                    <td class="style58">¿Qui&eacute;n surte a esta Unidad de Atenci&oacute;n?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.10</div></td>
                    <td class="style58">¿Con qu&eacute; frecuencia? </td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">B.11</div></td>
                    <td class="style58">¿Cu&aacute;l es el nivel de abasto actual?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.12</div></td>
                    <td class="style58">
                        ¿Realizan inventarios en la unidad? </td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label></td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">B.13</div></td>
                    <td class="style58">¿D&oacute;nde se guarda el insumo?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.14</div></td>
                    <td class="style58">¿Esta unidad esta certificada? </td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>
                <tr>
                        <td class="style58"><div align="center">B.15</div></td>
                        <td width="297" class="style58">Fecha de &uacute;ltima visita de Abasto</td>
                        <td width="369" class="style58">
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label> 
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58">&nbsp;</td>
                    </tr>
                <tr>
                    <td colspan="7" class="style58">
                        <div class="panel panel-primary">
                            <a name="b" id="b"></a>
                            <!-- Default panel contents -->
                            <!--button type="submit" name="guarda_seccion" value="B" class="btn btn-primary btn-lg btn-block" onclick="return validar_b()">Guardar datos Secci&oacute;n B</button-->
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="c" id="c"></a>
                            <!-- Default panel contents -->

                            <div class="panel-heading">C. FARMACIA</div>
                        </div>
                    </td>
                    <td class="style58">&nbsp;</td>
                </tr>
                <tr>
                    <td height="26" class="style47"><div align="center" class="style58">C.1</div></td>
                    <td class="style58">¿Cuenta con Farmacia?</td>
                    <td><span class="style58">
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>   
                        </span>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">C.2</div></td>
                    <td class="style58">¿Maneja Controlados?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    
                    </td>
                </tr>

                <tr>
                    <td class="style47"><div align="right" class="style77"><a href="consulta_cens.jsp" class="styl e77"></a>
                            <div align="center" class="style58">C.3</div>
                        </div>
                    </td>
                    <td class="style58">Horario de atenci&oacute;n</td>
                    <td><span class="style58">De:</span>
                        <input name="<%=nombreC = nomCam + (contCam += 1)%>" type="text" class="form-control"  id="<%=nombreC%>" size="5" maxlength="5" onkeypress="return handleEnter(this, event);" value="<%=rset.getString(nombreC)%>" readonly />
                        <%//out.print(nombreC);%></label> 
                        <br />
                        <span class="style58">A:</span>
                        <input name="<%=nombreC = nomCam + (contCam += 1)%>"  type="text" class="form-control"  id="<%=nombreC%>" size="5" maxlength="5" onkeypress="return handleEnter(this, event);" value="<%=rset.getString(nombreC)%>" readonly />
                        <%//out.print(nombreC);%></label> 
                        </label></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">C.4</div></td>
                    <td class="style58">¿Qui&eacute;n atiende la farmacia?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    
                    </td>
                </tr>
                <tr>
                    <td class="style47"><div align="center" class="style58">C.5</div></td>
                    <td class="style58">N&ordm;  de Anaqueles</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">C.6</div></td>
                    <td class="style58">Espacio aprox en mts2 de la Farmacia </td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    
                    </td>
                </tr>
                <tr>
                    <td class="style47"><div align="center" class="style58">C.7</div></td>
                    <td class="style58">¿Cuenta con red fr&iacute;a?</td>
                    <td class="style58"><label>
                            <label>  <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 
                    </td>
                    <td class="hidden">&nbsp;</td>
                    <td class="hidden"><div align="center" class="style58">C.8</div></td>
                    <td class="hidden">Fecha de Ultima Visita Proveedor Actual</td>
                    <td> <label><textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control hidden" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>

                <tr>

                    <td colspan="7" class="style58">
                        <div class="panel panel-primary">
                            <a name="c" id="c"></a>
                            <!-- Default panel contents -->
                            <!--button type="submit" name="guarda_seccion" value="C" class="btn btn-primary btn-lg btn-block" onclick="return validar_c()">Guardar datos Secci&oacute;n C</button-->
                        </div>
                    </td>

                </tr>

                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="d" id="d"></a>
                            <!-- Default panel contents -->
                            <div class="panel-heading">D. ALMAC&Eacute;N</div>
                        </div>
                    </td>
                    <td class="style58">&nbsp;</td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">D.1</div></td>
                    <td class="style58">¿Cuenta con &aacute;rea de almac&eacute;n?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">D.2</div></td>
                    <td class="style58">Horario de atenci&oacute;n</td>
                    <td><p>&nbsp;</p>
                        <div align="left"><span class="style58">De:</span>
                            <input name="<%=nombreC = nomCam + (contCam += 1)%>" type="text" class="form-control"  id="<%=nombreC%>" size="7" maxlength="7" value="<%=rset.getString(nombreC)%>" readonly />
                            <%//out.print(nombreC);%>
                            <br />
                            <strong>A:
                                <input name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%=nombreC%>" size="7" maxlength="7" value="<%=rset.getString(nombreC)%>" readonly />
                                <%//out.print(nombreC);%>
                            </strong>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">D.3</div></td>
                    <td class="style58">Espacio aprox en mts2 del Almac&eacute;n</td>
                    <td><label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">D.4</div></td>
                    <td class="style58">N&uacute;mero de Anaqueles o Racks en Almacen</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">D.5</div></td>
                    <td class="style58">¿C&oacute;mo surten los Insumos M&eacute;dicos en el Almac&eacute;n?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">D.6</div></td>
                    <td class="style58">¿Cuentan con &Aacute;rea para carga y descarga en el Almac&eacute;n?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>
                    <td class="hidden"><div align="center">D.7</div></td>
                    <td width="297" class="hidden">Fecha de Ultima Visita Proveedor Actual</td>
                    <td width="369" class="hidden">
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control hidden" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label> 
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">&nbsp;</td>
                </tr>   

                <tr>

                    <td colspan="7" class="style58">
                        <div class="panel panel-primary">
                            <a name="d" id="d"></a>
                            <!-- Default panel contents -->
                            <!--button type="submit" name="guarda_seccion" value="D" class="btn btn-primary btn-lg btn-block" onclick="return validar_d()">Guardar datos Secci&oacute;n D</button-->
                        </div>
                    </td>
                </tr>   
                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="e" id="e"></a>
                            <!-- Default panel contents -->
                            <div class="panel-heading">E. EQUIPO DE C&Oacute;MPUTO, INTERNET Y TELEFON&Iacute;A</div>
                        </div>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td>
                    </td>
                </tr>

                <tr>     
                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                            <div align="center">E.1</div>
                        </div>
                    </td>
                    <td bgcolor="#FFFFFF" class="style58"> <strong class="neg">¿Cuenta con equipo de C&oacute;mputo?</strong></td>
                    <td class="style58">
                        <label>  <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label> 
                    </td>
                    <td class="style58"></td>
                    <td class="style58"><div align="center" class="style58">

                        </div></td>

                    <td>
                        <tr>
                            <td class="style58" colspan="5">E.2 Equipo de Cómputo:</td>
                        </tr>
                        <tr> 
                            <td colspan="2">
                                <div align="center" class="style58">
                                    <div align="center">
                                        <p>
                                            <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" value="<%=rset.getString(nombreC)%>" id="<%=nombreC%>" size="3" maxlength="3"  class="form-control" readonly />
                                            <strong class="neg">CPU</strong></p>
                                            <%//out.print(nombreC);%>
                                    </div>
                                </div>
                            </td>
                            <td colspan="2">
                                <div align="center" class="style58">
                                    <div align="center">
                                        <p>
                                            <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" value="<%=rset.getString(nombreC)%>" id="<%=nombreC%>" size="3" maxlength="3" class="form-control" readonly />
                                            <strong class="neg">Monitor</strong>           </p>
                                            <%//out.print(nombreC);%>
                                    </div>
                                </div>
                            </td>
                            <td colspan="2">
                                <div align="center" class="style58">
                                    <div align="center">
                                        <p>
                                            <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" value="<%=rset.getString(nombreC)%>" id="<%=nombreC%>" size="3" maxlength="3"  class="form-control" readonly />
                                            <strong class="neg">Impresora</strong>                </p>
                                            <%//out.print(nombreC);%>
                                    </div>
                                </div>
                            </td>
                            <td colspan="3">
                                <div align="center" class="style58">
                                    <div align="center">
                                        <p>
                                            <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" value="<%=rset.getString(nombreC)%>" id="<%=nombreC%>" size="3" maxlength="3" class="form-control" readonly />
                                            <strong class="neg">No-Break</strong></p>
                                            <%//out.print(nombreC);%>
                                    </div>
                                </div>
                            </td>
                        </tr>


                    </td>
                    <tr>
                        <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                <div align="center">E.3</div>
                            </div>
                        </td>
                        <td bgcolor="#FFFFFF" class="style58">¿Cuenta con conexi&oacute;n a la Internet?</td>
                        <td class="style58">
                            <span class="style47">
                                <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                    <%//out.print(nombreC);%>
                                </label>
                            </span>
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center" class="style58">
                                <div align="center">E.4</div>
                            </div>
                        </td>
                        <td class="style58">Se&ntilde;al de Telefon&iacute;a Celular</td>
                        <td> 
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>    
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#FFFFFF" class="style68">
                            <div align="center" class="style58">
                                <div align="center">E.5</div>
                            </div>
                        </td>
                        <td bgcolor="#FFFFFF" class="style58">&iquest;Cu&aacute;l (es)?</td>
                        <td class="style58">
                            <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 
                        </td>
                        <td class="style58">&nbsp;</td>
                    </tr>   

                    <td colspan="7" class="style58">
                        <div class="panel panel-primary">
                            <a name="d" id="d"></a>
                            <!-- Default panel contents -->
                            <!--button type="submit" name="guarda_seccion" value="E" class="btn btn-primary btn-lg btn-block" onclick="return validar_e()">Guardar datos Secci&oacute;n E</button-->
                        </div>
                    </td>
                </tr>   
                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="f" id="f"></a>
                            <!-- Default panel contents -->
                            <div class="panel-heading">F.DESCRIBA OBSERVACIONES Y/O COMENTARIOS GENERALES</div>
                        </div>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <!-- Preguntas Censos Plus Ver-->
                    <tr>
                        <td colspan="7" class="style47">
                            <div align="center">
                                <strong>
                                    <span class="style41">
                                        <strong>
                                            <span class="style58">
                                                <strong>
                                                    <label>  <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="140" rows="10" class="form-control style58" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                                        <%//out.print(nombreC);%>
                                                    </label>
                                                </strong>
                                            </span>
                                        </strong>
                                    </span>
                                </strong>
                            </div>
                        </td>

                    </tr>

                    <tr>
                        <td colspan="7" class="style58">
                            <div class="panel panel-primary">
                                <a name="d" id="d"></a>
                                <!-- Default panel contents -->
                                <!--button type="submit" name="guarda_seccion" value="F" class="btn btn-primary btn-lg btn-block" onclick="return validar_f()">Guardar datos Secci&oacute;n F</button-->
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10" height="">
                            <div class="blueberry" style="width: 600px; height: 500px;">
                                <a name="pic" id="pic"></a>
                                <ul class="slides">
                                    <%
                                        try {
                                            con.conectar();

                                            //out.print(qery);
                                            ResultSet rsetimg = con.consulta("select imagen from tb_imagenes where id_uni = '" + id_uni + "'");
                                            while (rsetimg.next()) {
                                                out.print("<li><img src='imagenes/" + id_uni + "/" + rsetimg.getString("imagen") + "' width = '600px' height = '320px' /> </li>");
                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {
                                        }
                                    %> 
                                </ul>
                            </div>
                        </td>

                        <a name="abajo" id="abajo"></a>
                    </tr>
                    <%
                        }

                        con.cierraConexion();
                    %>

            </form>      

            <td colspan="7" class="style47">
                <strong class="neg">DERECHOS RESERVADOS GNKL/DESARROLLOS WEB &reg; 2009 - 2014</strong></td>
            </tr>
            <!-- 
                                                           Mensaje de Acerca de...
            -->
            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">INSTRUCCIONES DE CONSULTA</h4>
                        </div>
                        <div class="modal-body">
                            <img src="imagenes/GNKL_Small.JPG" />Previamente debes de checar que haya conexi&oacute;n a Internet<br>
                                <ul>
                                    <li>Seleccione la Unidad a consultar, y a continuación de clic en el boton "Ver"</li>
                                </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            <!--button type="button" class="btn btn-primary">Guardar Info</button-->
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


            <!-- 
             fin Mensaje de Acerca de...
            -->                            
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Ingresa tus Datos</h4>
                        </div>
                        <div class="modal-body">
                            <form name="form_com" method="post" id="form_com">
                                Nombre: <input type="text" class="form-control" autofocus placeholder="Ingrese su Nombre" name="txtf_nom" id="txtf_nom" />
                                Cuenta de Correo: <input type="text" class="form-control"  placeholder="Ingrese su Cuenta de Correo" name="txtf_cor" id="txtf_cor" onblur="validarEmail(this.form.txtf_cor.value);" />
                                Deje su Comentario: <textarea name="txta_com" cols="10" rows="5" class="form-control" id="txta_com"></textarea>
                                <div class="modal-footer">

                                    <input type="submit" class="btn btn-primary" value="Guardar" id="btn_com" onClick="return verificaCom(document.forms.form_com);" />
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                </div>

                            </form>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </table>
        <a href="#" class="scrollup">Scroll</a>
    </body>
</html>
<!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="//code.jquery.com/jquery.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bjqs-1.3.min.js"></script>
<script src="js/libs/jquery.secret-source.min.js"></script>
<script src="js/jquery.blueberry.js"></script>
<script>
                                        $(window).load(function() {
                                            $('.blueberry').blueberry();
                                        });
</script>
<!-- End SlidesJS Required -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#form').submit(function() {

            //alert("Ingresó");
            return false;
        });


        $('#form_com').submit(function() {
            //alert("huges");
            return false;
        });
        $("#btn_com").click(function() {

            var nom = $('#txtf_nom').val();
            var cor = $('#txtf_cor').val();
            var com = $('#txta_com').val();
            //alert(id+" "+id);
            if (nom == '' || cor == '' || com == '') {
                return false;
            }
            else {
                var dataString = $('#form_com').serialize();
                //alert('Datos serializados: '+dataString);
                var dir = 'servletCorreo';

                $.ajax({
                    url: dir,
                    type: "POST",
                    data: dataString,
                    success: function(data) {
                        alert("Sus datos han sido Enviados");
                        location.reload();
                        //$("#form_com").fadeOut("slow");
                        /*$('#txtf_nom').value='huge';
                         $('#txtf_cor').value='';
                         $('#txta_com').value='';*/
                    },
                });
            }
        });

    });
</script>
<script>
    $(document).ready(function() {
        $('.carousel').carousel({
            interval: 3000
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {

        $(window).scroll(function() {
            if ($(this).scrollTop() > 100) {
                $('.scrollup').fadeIn();
            } else {
                $('.scrollup').fadeOut();
            }
        });

        $('.scrollup').click(function() {
            $("html, body").animate({scrollTop: 0}, 600);
            return false;
        });

    });
</script>
<script type="text/javascript">
    $(function() {
        $(".popover-examples a").popover({
            title: 'Default title value'
        });
    });
</script>