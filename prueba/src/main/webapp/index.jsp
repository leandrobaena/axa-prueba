<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prueba AXA - Colpatria</title>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet" />
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: 'https://8e7c6b8a-fc46-4674-a529-4ebec57295d3.mock.pstmn.io/customers',
                    success: function (result, status, xhr) {
                        result = result.replaceAll("\n", "");
                        result = result.replaceAll("\t", "");
                        result = result.replaceAll("“", "\"");
                        result = result.replaceAll("”", "\"");
                        $('#datos').DataTable({
                            data: JSON.parse(result),
                            columns: [
                                {data: 'name'},
                                {data: 'age'},
                                {data: 'phoneNumber'},
                                {data: 'address'}
                            ]
                        });
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                    }
                });
            });
            
            function adicionarRegistro(){
                window.location = "nuevo.jsp";
            }
        </script>
    </head>
    <body>
        <h1>Listado de clientes</h1>
        <button onclick="adicionarRegistro()">Adicionar cliente</button>
        <br /><br />
        <table id="datos" class="display" style="width:100%">
            <thead>
                <tr>
                    <td>Nombre</td>
                    <td>Edad</td>
                    <td>Teléfono</td>
                    <td>Dirección</td>
                </tr>
            </thead>
        </table>
    </body>
</html>
