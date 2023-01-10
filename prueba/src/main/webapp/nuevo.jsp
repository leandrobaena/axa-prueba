<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prueba AXA - Colpatria</title>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                $("#form").submit(function (event) {
                    var data = {
                        name: $("#name").val(),
                        age: $("#age").val(),
                        phoneNumber: $("#phoneNumber").val(),
                        address: $("#address").val()
                    };
                    $.ajax({
                        url: 'https://8e7c6b8a-fc46-4674-a529-4ebec57295d3.mock.pstmn.io/customers',
                        type: 'post',
                        data: data,
                        success: function () {
                            alert("Cliente guardado con éxito");
                            volver();
                        }
                    });
                    event.preventDefault();
                });
            });

            function volver() {
                window.location = "index.jsp";
            }
        </script>
    </head>
    <body>
        <h1>Nuevo cliente</h1>
        <form id="form">
            <table>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" id="name" required="true" /></td>
                </tr>
                <tr>
                    <td>Edad:</td>
                    <td><input type="number" id="age" min="0" max="150" required="true" /></td>
                </tr>
                <tr>
                    <td>Teléfono:</td>
                    <td><input type="number" id="phoneNumber" required="true" style="-webkit-appearance: none; margin: 0; -moz-appearance: textfield;" /></td>
                </tr>
                <tr>
                    <td>Dirección:</td>
                    <td><input type="text" id="address" required="true" pattern="^[\w]+ [\d]{2} [#] [\d]{2}[\w]{0,3} [-] [\d]{2}[\w]{0,3}$" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Guardar" /></td>
                    <td><input type="button" value="Volver" onclick="volver()" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
