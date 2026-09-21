<?php
/* --------------------------------
   -- Conexión a la base de datos --
------------------------------- */
$conexion = mysqli_connect("localhost", "root", "", "agencia_de_autos");
if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}

/* ----------------------
   -- AGREGAR PROVEEDOR --
---------------------- */
if (isset($_POST['agregar_proveedor'])) {
    $nombre_empresa = trim($_POST['nombre_empresa']);
    $direccion = trim($_POST['direccion']);
    $telefono = trim($_POST['telefono']);
    $correo = trim($_POST['correo']);

    if ($nombre_empresa === '') {
        echo "<p style='color:red;'>Falta el nombre de la empresa.</p>";
    } else {
        $stmt = mysqli_prepare($conexion, "INSERT INTO proveedor (nombre_empresa, direccion, telefono, correo) VALUES (?, ?, ?, ?)");
        if ($stmt) {
            mysqli_stmt_bind_param($stmt, "ssss", $nombre_empresa, $direccion, $telefono, $correo);
            mysqli_stmt_execute($stmt);
            if (mysqli_stmt_affected_rows($stmt) > 0) {
                echo "<p style='color:green;'>Proveedor agregado correctamente.</p>";
            } else {
                echo "<p style='color:red;'>Error al agregar proveedor: ".htmlspecialchars(mysqli_error($conexion))."</p>";
            }
            mysqli_stmt_close($stmt);
        } else {
            echo "<p style='color:red;'>Error preparando inserción de proveedor: ".htmlspecialchars(mysqli_error($conexion))."</p>";
        }
    }
}

/* ----------------------
   -- ELIMINAR PROVEEDOR --
---------------------- */
if (isset($_GET['eliminar_proveedor']) && (isset($_GET['action']) && $_GET['action'] === 'proveedor_list')) {
    $id_prov = intval($_GET['eliminar_proveedor']);

    $stmt = mysqli_prepare($conexion, "DELETE FROM proveedor WHERE id_proveedor = ?");
    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "i", $id_prov);
        mysqli_stmt_execute($stmt);
        if (mysqli_stmt_affected_rows($stmt) > 0) {
            echo "<p style='color:green;'>Proveedor eliminado correctamente.</p>";
        } else {
            echo "<p style='color:red;'>No se encontró el proveedor con id ".htmlspecialchars($id_prov).".</p>";
        }
        mysqli_stmt_close($stmt);
    } else {
        echo "<p style='color:red;'>Error preparando eliminación de proveedor: ".htmlspecialchars(mysqli_error($conexion))."</p>";
    }
}

/* ----------------------
   -- AGREGAR CLIENTE --
---------------------- */
if (isset($_POST['agregar_cliente'])) {
    $nombre_cliente = trim($_POST['nombre_cliente']);
    $telefono = trim($_POST['telefono']);
    $correo = trim($_POST['correo']);
    $fecha_nac = trim($_POST['fecha_nac']);

    if ($nombre_cliente === '') {
        echo "<p style='color:red;'>Falta el nombre del cliente.</p>";
    } else {
        if (mysqli_begin_transaction($conexion)) {
            try {
                $stmtDatos = mysqli_prepare($conexion, "INSERT INTO datosgenerales (telefono, correo, fecha_nac) VALUES (?, ?, ?)");
                if (!$stmtDatos) throw new Exception("Error preparando inserción datosgenerales: ".mysqli_error($conexion));
                mysqli_stmt_bind_param($stmtDatos, "sss", $telefono, $correo, $fecha_nac);
                mysqli_stmt_execute($stmtDatos);
                $id_datos = mysqli_insert_id($conexion);
                mysqli_stmt_close($stmtDatos);

                $stmtCli = mysqli_prepare($conexion, "INSERT INTO cliente (nombre, id_datos) VALUES (?, ?)");
                if (!$stmtCli) throw new Exception("Error preparando inserción cliente: ".mysqli_error($conexion));
                mysqli_stmt_bind_param($stmtCli, "si", $nombre_cliente, $id_datos);
                mysqli_stmt_execute($stmtCli);
                if (mysqli_stmt_affected_rows($stmtCli) <= 0) throw new Exception("No se pudo insertar cliente.");
                mysqli_stmt_close($stmtCli);

                mysqli_commit($conexion);
                echo "<p style='color:green;'>Cliente agregado correctamente.</p>";
            } catch (Exception $e) {
                mysqli_rollback($conexion);
                echo "<p style='color:red;'>Error al agregar cliente: ".htmlspecialchars($e->getMessage())."</p>";
            }
        } else {
            echo "<p style='color:red;'>No se pudo iniciar transacción para agregar cliente.</p>";
        }
    }
}

/* ----------------------
   -- ELIMINAR CLIENTE --
---------------------- */
if (isset($_GET['eliminar_cliente']) && (isset($_GET['action']) && $_GET['action'] === 'cliente_list')) {
    $id_cliente = intval($_GET['eliminar_cliente']);

    if (mysqli_begin_transaction($conexion)) {
        try {
            $stmtGet = mysqli_prepare($conexion, "SELECT id_datos FROM cliente WHERE id_cliente = ?");
            if (!$stmtGet) throw new Exception("Error preparando selección: ".mysqli_error($conexion));
            mysqli_stmt_bind_param($stmtGet, "i", $id_cliente);
            mysqli_stmt_execute($stmtGet);
            mysqli_stmt_bind_result($stmtGet, $id_datos);
            if (!mysqli_stmt_fetch($stmtGet)) {
                mysqli_stmt_close($stmtGet);
                throw new Exception("No se encontró el cliente con id $id_cliente");
            }
            mysqli_stmt_close($stmtGet);

            $stmtDelCli = mysqli_prepare($conexion, "DELETE FROM cliente WHERE id_cliente = ?");
            if (!$stmtDelCli) throw new Exception("Error preparando eliminación cliente: ".mysqli_error($conexion));
            mysqli_stmt_bind_param($stmtDelCli, "i", $id_cliente);
            mysqli_stmt_execute($stmtDelCli);
            mysqli_stmt_close($stmtDelCli);

            $stmtDelDatos = mysqli_prepare($conexion, "DELETE FROM datosgenerales WHERE id_datos = ?");
            if (!$stmtDelDatos) throw new Exception("Error preparando eliminación datosgenerales: ".mysqli_error($conexion));
            mysqli_stmt_bind_param($stmtDelDatos, "i", $id_datos);
            mysqli_stmt_execute($stmtDelDatos);
            mysqli_stmt_close($stmtDelDatos);

            mysqli_commit($conexion);
            echo "<p style='color:green;'>Cliente eliminado correctamente (y sus datos generales).</p>";
        } catch (Exception $e) {
            mysqli_rollback($conexion);
            echo "<p style='color:red;'>Error al eliminar cliente: ".htmlspecialchars($e->getMessage())."</p>";
        }
    } else {
        echo "<p style='color:red;'>No se pudo iniciar transacción para eliminar cliente.</p>";
    }
}

/* ----------------------
   -- AGREGAR EMPLEADO --
---------------------- */
if (isset($_POST['agregar_empleado'])) {
    $nombre_empleado = trim($_POST['nombre_empleado']);
    $id_tipo_empleado = intval($_POST['id_tipo_empleado']);
    $fecha_contrato = trim($_POST['fecha_contrato']);
    $id_departamento = intval($_POST['id_departamento']);
    $telefono = trim($_POST['telefono']);
    $correo = trim($_POST['correo']);
    $fecha_nac = trim($_POST['fecha_nac']);

    if ($nombre_empleado === '' || $id_tipo_empleado <= 0 || $id_departamento <= 0 || $fecha_contrato === '') {
        echo "<p style='color:red;'>Faltan datos obligatorios para el empleado (nombre, tipo, departamento, fecha de contrato).</p>";
    } else {
        if (mysqli_begin_transaction($conexion)) {
            try {
                $stmtDatos = mysqli_prepare($conexion, "INSERT INTO datosgenerales (telefono, correo, fecha_nac) VALUES (?, ?, ?)");
                if (!$stmtDatos) throw new Exception("Error preparando inserción datosgenerales: ".mysqli_error($conexion));
                mysqli_stmt_bind_param($stmtDatos, "sss", $telefono, $correo, $fecha_nac);
                mysqli_stmt_execute($stmtDatos);
                $id_datos = mysqli_insert_id($conexion);
                mysqli_stmt_close($stmtDatos);

                $stmtEmp = mysqli_prepare($conexion, "INSERT INTO empleados (nombre, id_tipo_empleado, fecha_contrato, id_departamento, id_datos) VALUES (?, ?, ?, ?, ?)");
                if (!$stmtEmp) throw new Exception("Error preparando inserción empleado: ".mysqli_error($conexion));
                mysqli_stmt_bind_param($stmtEmp, "sissi", $nombre_empleado, $id_tipo_empleado, $fecha_contrato, $id_departamento, $id_datos);
                mysqli_stmt_execute($stmtEmp);
                if (mysqli_stmt_affected_rows($stmtEmp) <= 0) throw new Exception("No se pudo insertar empleado.");
                mysqli_stmt_close($stmtEmp);

                mysqli_commit($conexion);
                echo "<p style='color:green;'>Empleado agregado correctamente.</p>";
            } catch (Exception $e) {
                mysqli_rollback($conexion);
                echo "<p style='color:red;'>Error al agregar empleado: ".htmlspecialchars($e->getMessage())."</p>";
            }
        } else {
            echo "<p style='color:red;'>No se pudo iniciar transacción para agregar empleado.</p>";
        }
    }
}

/* ----------------------
   -- ELIMINAR EMPLEADO --
---------------------- */
if (isset($_GET['eliminar_empleado']) && (isset($_GET['action']) && $_GET['action'] === 'empleado_list')) {
    $id_empleado = intval($_GET['eliminar_empleado']);

    if (mysqli_begin_transaction($conexion)) {
        try {
            $stmtGet = mysqli_prepare($conexion, "SELECT id_datos FROM empleados WHERE id_empleado = ?");
            if (!$stmtGet) throw new Exception("Error preparando selección empleado: ".mysqli_error($conexion));
            mysqli_stmt_bind_param($stmtGet, "i", $id_empleado);
            mysqli_stmt_execute($stmtGet);
            mysqli_stmt_bind_result($stmtGet, $id_datos);
            if (!mysqli_stmt_fetch($stmtGet)) {
                mysqli_stmt_close($stmtGet);
                throw new Exception("No se encontró el empleado con id $id_empleado");
            }
            mysqli_stmt_close($stmtGet);

            $stmtDelEmp = mysqli_prepare($conexion, "DELETE FROM empleados WHERE id_empleado = ?");
            if (!$stmtDelEmp) throw new Exception("Error preparando eliminación empleado: ".mysqli_error($conexion));
            mysqli_stmt_bind_param($stmtDelEmp, "i", $id_empleado);
            mysqli_stmt_execute($stmtDelEmp);
            mysqli_stmt_close($stmtDelEmp);

            $stmtDelDatos = mysqli_prepare($conexion, "DELETE FROM datosgenerales WHERE id_datos = ?");
            if (!$stmtDelDatos) throw new Exception("Error preparando eliminación datosgenerales: ".mysqli_error($conexion));
            mysqli_stmt_bind_param($stmtDelDatos, "i", $id_datos);
            mysqli_stmt_execute($stmtDelDatos);
            mysqli_stmt_close($stmtDelDatos);

            mysqli_commit($conexion);
            echo "<p style='color:green;'>Empleado eliminado correctamente (y sus datos generales).</p>";
        } catch (Exception $e) {
            mysqli_rollback($conexion);
            echo "<p style='color:red;'>Error al eliminar empleado: ".htmlspecialchars($e->getMessage())."</p>";
        }
    } else {
        echo "<p style='color:red;'>No se pudo iniciar transacción para eliminar empleado.</p>";
    }
}

/* ----------------------
   -- AGREGAR VENTA DE AUTO --
---------------------- */
if (isset($_POST['agregar_venta'])) {
    $fecha_venta = trim($_POST['fecha_venta']) ?: date('Y-m-d');
    $id_empleado = intval($_POST['id_empleado']);
    $id_cliente = intval($_POST['id_cliente']);
    $id_numserie = trim($_POST['id_numserie']);
    $id_pago = intval($_POST['id_pago']);
    $id_seguro = isset($_POST['id_seguro']) && $_POST['id_seguro'] !== '' ? intval($_POST['id_seguro']) : null;
    $descuento = $_POST['descuento'] !== '' ? floatval($_POST['descuento']) : 0.0;

    // Validaciones básicas
    if ($id_empleado <= 0 || $id_cliente <= 0 || $id_numserie === '' || $id_pago <= 0) {
        echo "<p style='color:red;'>Faltan datos obligatorios para la venta (empleado, cliente, número de serie, método de pago).</p>";
    } else {
        if (mysqli_begin_transaction($conexion)) {
            try {
                //Obtener costo del auto y estado
                $stmtAuto = mysqli_prepare($conexion, "SELECT costo, estado FROM Autos WHERE id_numserie = ?");
                if (!$stmtAuto) throw new Exception("Error preparando consulta del auto: ".mysqli_error($conexion));
                mysqli_stmt_bind_param($stmtAuto, "s", $id_numserie);
                mysqli_stmt_execute($stmtAuto);
                mysqli_stmt_bind_result($stmtAuto, $costo_auto, $estado_auto);
                if (!mysqli_stmt_fetch($stmtAuto)) {
                    mysqli_stmt_close($stmtAuto);
                    throw new Exception("No se encontró el auto con serie $id_numserie");
                }
                mysqli_stmt_close($stmtAuto);

                if ($estado_auto === 'Vendido') {
                    throw new Exception("El auto con serie $id_numserie ya está marcado como vendido.");
                }

                // Obtener costo del seguro si aplica
                $costo_seguro = 0.0;
                if ($id_seguro !== null && $id_seguro > 0) {
                    $stmtSeg = mysqli_prepare($conexion, "SELECT costo_seguro FROM seguro WHERE id_seguro = ?");
                    if (!$stmtSeg) throw new Exception("Error preparando consulta de seguro: ".mysqli_error($conexion));
                    mysqli_stmt_bind_param($stmtSeg, "i", $id_seguro);
                    mysqli_stmt_execute($stmtSeg);
                    mysqli_stmt_bind_result($stmtSeg, $c_seg);
                    if (mysqli_stmt_fetch($stmtSeg)) {
                        $costo_seguro = floatval($c_seg);
                    }
                    mysqli_stmt_close($stmtSeg);
                }

                // Calcular precio final
                $precio_final = floatval($costo_auto) + floatval($costo_seguro) - floatval($descuento);
                if ($precio_final < 0) $precio_final = 0.0;

                // Insertar venta 
                $stmtVenta = mysqli_prepare($conexion, "
                    INSERT INTO ventaautos (fecha_venta, id_empleado, id_cliente, id_numserie, id_pago, id_seguro, descuento, precio_final)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                ");
                if (!$stmtVenta) throw new Exception("Error preparando inserción venta: ".mysqli_error($conexion));
                $fecha_venta_s = $fecha_venta;
                $id_empleado_s = strval($id_empleado);
                $id_cliente_s = strval($id_cliente);
                $id_numserie_s = $id_numserie;
                $id_pago_s = strval($id_pago);
                $id_seguro_s = $id_seguro !== null ? strval($id_seguro) : null;
                $descuento_s = strval($descuento);
                $precio_final_s = strval($precio_final);
                mysqli_stmt_bind_param($stmtVenta, "ssssssss", $fecha_venta_s, $id_empleado_s, $id_cliente_s, $id_numserie_s, $id_pago_s, $id_seguro_s, $descuento_s, $precio_final_s);
                mysqli_stmt_execute($stmtVenta);
                if (mysqli_stmt_affected_rows($stmtVenta) <= 0) {
                    $err = mysqli_error($conexion);
                    mysqli_stmt_close($stmtVenta);
                    throw new Exception("No se pudo insertar la venta. $err");
                }
                mysqli_stmt_close($stmtVenta);

                // 5) Actualizar estado del auto a Vendido
                $stmtUpdAuto = mysqli_prepare($conexion, "UPDATE Autos SET estado = 'Vendido' WHERE id_numserie = ?");
                if (!$stmtUpdAuto) throw new Exception("Error preparando actualización de auto: ".mysqli_error($conexion));
                mysqli_stmt_bind_param($stmtUpdAuto, "s", $id_numserie_s);
                mysqli_stmt_execute($stmtUpdAuto);
                mysqli_stmt_close($stmtUpdAuto);

                mysqli_commit($conexion);
                echo "<p style='color:green;'>Venta registrada correctamente. Precio final: $".htmlspecialchars(number_format($precio_final, 2))."</p>";
            } catch (Exception $e) {
                mysqli_rollback($conexion);
                echo "<p style='color:red;'>Error al registrar venta: ".htmlspecialchars($e->getMessage())."</p>";
            }
        } else {
            echo "<p style='color:red;'>No se pudo iniciar transacción para registrar venta.</p>";
        }
    }
}

/* ----------------------
   -- ELIMINAR VENTA    --
---------------------- */
if (isset($_GET['eliminar_venta']) && (isset($_GET['action']) && $_GET['action'] === 'venta_list')) {
    $id_venta = intval($_GET['eliminar_venta']);

    if (mysqli_begin_transaction($conexion)) {
        try {
            $stmtGet = mysqli_prepare($conexion, "SELECT id_numserie FROM ventaautos WHERE id_venta = ?");
            if (!$stmtGet) throw new Exception("Error preparando selección venta: ".mysqli_error($conexion));
            mysqli_stmt_bind_param($stmtGet, "i", $id_venta);
            mysqli_stmt_execute($stmtGet);
            mysqli_stmt_bind_result($stmtGet, $id_numserie_v);
            if (!mysqli_stmt_fetch($stmtGet)) {
                mysqli_stmt_close($stmtGet);
                throw new Exception("No se encontró la venta con id $id_venta");
            }
            mysqli_stmt_close($stmtGet);

            $stmtDel = mysqli_prepare($conexion, "DELETE FROM ventaautos WHERE id_venta = ?");
            if (!$stmtDel) throw new Exception("Error preparando eliminación venta: ".mysqli_error($conexion));
            mysqli_stmt_bind_param($stmtDel, "i", $id_venta);
            mysqli_stmt_execute($stmtDel);
            mysqli_stmt_close($stmtDel);

            // Restaurar estado del auto 
            $stmtUpd = mysqli_prepare($conexion, "UPDATE Autos SET estado = 'Disponible' WHERE id_numserie = ?");
            if (!$stmtUpd) throw new Exception("Error preparando actualización de auto: ".mysqli_error($conexion));
            mysqli_stmt_bind_param($stmtUpd, "s", $id_numserie_v);
            mysqli_stmt_execute($stmtUpd);
            mysqli_stmt_close($stmtUpd);

            mysqli_commit($conexion);
            echo "<p style='color:green;'>Venta eliminada y auto marcado como disponible.</p>";
        } catch (Exception $e) {
            mysqli_rollback($conexion);
            echo "<p style='color:red;'>Error al eliminar venta: ".htmlspecialchars($e->getMessage())."</p>";
        }
    } else {
        echo "<p style='color:red;'>No se pudo iniciar transacción para eliminar venta.</p>";
    }
}

/* =====================================================================
   INTERFAZ: Muestra menú inicial, formularios y listados según action
===================================================================== */

$action = $_GET['action'] ?? ''; 

?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Agencia de Autos - Panel</title>
<style>
body { font-family: Arial, sans-serif; margin: 30px; background: #fafafa; }
.menu { background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 8px rgba(0,0,0,0.08); width: 360px; }
.menu a { display: block; margin: 8px 0; padding: 8px 10px; background: #007bff; color: white; text-decoration: none; border-radius: 6px; width: fit-content; }
.menu a.secondary { background: #6c757d; }
form { background: #fff; padding: 15px; border-radius: 10px; box-shadow: 0 0 8px rgba(0,0,0,0.1); width: 520px; margin-top: 15px; }
table { border-collapse: collapse; margin-top: 20px; width: 98%; }
th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
th { background-color: #f4f4f4; }
.botonEliminar { background: red; color: white; padding: 5px; border-radius: 5px; text-decoration: none; }
.smallInfo { font-size: 0.95em; color: #333; margin-top: 6px; }
.priceBox { background:#f8f9fa; padding:8px; border-radius:6px; display:inline-block; margin-right:8px; }

/* ==========================
   NUEVOS ESTILOS PARA IMAGEN
   ========================== */
.home-container { display: flex; gap: 30px; align-items: flex-start; }
.hero { flex: 1; display: flex; justify-content: center; align-items: center; padding: 20px; }
.hero img {
  max-width: 400px; /* ancho máximo deseado */
  width: 80%;      /* ocupa hasta el contenedor */
  height: auto;     /* mantiene proporción */
  border-radius: 8px;
  box-shadow: 0 6px 18px rgba(0,0,0,0.08);
  object-fit: cover;
}
/* Ajustes responsive: en pantallas pequeñas apilar */
@media (max-width: 900px) {
  .home-container { flex-direction: column; }
  .menu { width: auto; }
  .hero { padding-top: 10px; }
}
</style>
</head>
<body>

<h1>Agencia de Autos</h1>

<?php
/* ----------------------
   -- MENÚ PRINCIPAL    --
---------------------- */
if ($action === '') {
    ?>
    <div class="home-container">
        <div class="menu">
            <h2>Menú</h2>
            <a href='?action=add'>Agregar Auto</a>
            <a href='?action=list'>Ver Autos Disponibles</a>
            <hr>
            <a href='?action=proveedor_add'>Agregar Proveedor</a>
            <a href='?action=proveedor_list'>Ver Proveedores</a>
            <hr>
            <a href='?action=cliente_add'>Agregar Cliente</a>
            <a href='?action=cliente_list'>Ver Clientes</a>
            <hr>
            <a href='?action=empleado_add'>Agregar Empleado</a>
            <a href='?action=empleado_list'>Ver Empleados</a>
            <hr>
            <a href='?action=venta_add'>Registrar Venta</a>
            <a href='?action=venta_list'>Ver Ventas</a>
        </div>

        <div class="hero">
            <img src="otrolobo.png" alt="Imagen Agencia de Autos" loading="lazy">
        </div>
    </div>

    <p>Selecciona una opción del menú para continuar.</p>
    <?php
}

/* =====================================================================
   VISTAS: Proveedor
===================================================================== */

if ($action === 'proveedor_add') {
    ?>
    <a class="secondary" href="?" style="display:inline-block;margin-bottom:10px;text-decoration:none;color:#fff;padding:6px 8px;background:#6c757d;border-radius:6px;">Volver al menú</a>
    <h2>Agregar Proveedor</h2>
    <form method="post" action="?action=proveedor_add">
        <label>Nombre de la empresa:</label><br>
        <input type="text" name="nombre_empresa" required><br><br>

        <label>Dirección:</label><br>
        <input type="text" name="direccion"><br><br>

        <label>Teléfono:</label><br>
        <input type="text" name="telefono"><br><br>

        <label>Correo:</label><br>
        <input type="email" name="correo"><br><br>

        <button type="submit" name="agregar_proveedor">Agregar Proveedor</button>
    </form>
    <?php
}

if ($action === 'proveedor_list') {
    ?>
    <a class="secondary" href="?" style="display:inline-block;margin-bottom:10px;text-decoration:none;color:#fff;padding:6px 8px;background:#6c757d;border-radius:6px;">Volver al menú</a>
    <h2>Proveedores</h2>
    <table>
    <tr>
        <th>ID</th>
        <th>Nombre Empresa</th>
        <th>Dirección</th>
        <th>Teléfono</th>
        <th>Correo</th>
        <th>Acciones</th>
    </tr>
    <?php
    $resProv = mysqli_query($conexion, "SELECT id_proveedor, nombre_empresa, direccion, telefono, correo FROM proveedor ORDER BY nombre_empresa");
    if ($resProv && mysqli_num_rows($resProv) > 0) {
        while ($p = mysqli_fetch_assoc($resProv)) {
            echo "<tr>";
            echo "<td>".htmlspecialchars($p['id_proveedor'])."</td>";
            echo "<td>".htmlspecialchars($p['nombre_empresa'])."</td>";
            echo "<td>".htmlspecialchars($p['direccion'])."</td>";
            echo "<td>".htmlspecialchars($p['telefono'])."</td>";
            echo "<td>".htmlspecialchars($p['correo'])."</td>";
            echo "<td><a class='botonEliminar' href='?action=proveedor_list&eliminar_proveedor=".urlencode($p['id_proveedor'])."' onclick='return confirm(\"¿Eliminar proveedor?\");'>Eliminar</a></td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='6'>No hay proveedores registrados.</td></tr>";
    }
    ?>
    </table>
    <?php
}

/* =====================================================================
   VISTAS: Cliente
===================================================================== */

if ($action === 'cliente_add') {
    ?>
    <a class="secondary" href="?" style="display:inline-block;margin-bottom:10px;text-decoration:none;color:#fff;padding:6px 8px;background:#6c757d;border-radius:6px;">Volver al menú</a>
    <h2>Agregar Cliente</h2>
    <form method="post" action="?action=cliente_add">
        <label>Nombre:</label><br>
        <input type="text" name="nombre_cliente" required><br><br>

        <label>Teléfono:</label><br>
        <input type="text" name="telefono"><br><br>

        <label>Correo:</label><br>
        <input type="email" name="correo"><br><br>

        <label>Fecha de nacimiento:</label><br>
        <input type="date" name="fecha_nac"><br><br>

        <button type="submit" name="agregar_cliente">Agregar Cliente</button>
    </form>
    <?php
}

if ($action === 'cliente_list') {
    ?>
    <a class="secondary" href="?" style="display:inline-block;margin-bottom:10px;text-decoration:none;color:#fff;padding:6px 8px;background:#6c757d;border-radius:6px;">Volver al menú</a>
    <h2>Clientes</h2>
    <table>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Teléfono</th>
        <th>Correo</th>
        <th>Fecha Nac.</th>
        <th>Acciones</th>
    </tr>
    <?php
    $resCli = mysqli_query($conexion, "
        SELECT c.id_cliente, c.nombre, d.telefono, d.correo, d.fecha_nac
        FROM cliente c
        LEFT JOIN datosgenerales d ON c.id_datos = d.id_datos
        ORDER BY c.nombre
    ");
    if ($resCli && mysqli_num_rows($resCli) > 0) {
        while ($c = mysqli_fetch_assoc($resCli)) {
            echo "<tr>";
            echo "<td>".htmlspecialchars($c['id_cliente'])."</td>";
            echo "<td>".htmlspecialchars($c['nombre'])."</td>";
            echo "<td>".htmlspecialchars($c['telefono'])."</td>";
            echo "<td>".htmlspecialchars($c['correo'])."</td>";
            echo "<td>".htmlspecialchars($c['fecha_nac'])."</td>";
            echo "<td><a class='botonEliminar' href='?action=cliente_list&eliminar_cliente=".urlencode($c['id_cliente'])."' onclick='return confirm(\"¿Eliminar cliente y sus datos?\");'>Eliminar</a></td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='6'>No hay clientes registrados.</td></tr>";
    }
    ?>
    </table>
    <?php
}

/* =====================================================================
   VISTAS: Empleado
===================================================================== */

if ($action === 'empleado_add') {
    // obtener listas para selects: tipoempleado y departamento
    $resTipos = mysqli_query($conexion, "SELECT id_tipo_empleado, puesto FROM tipoempleado ORDER BY puesto");
    $resDeptos = mysqli_query($conexion, "SELECT id_departamento, nombre_departamento FROM departamento ORDER BY nombre_departamento");
    ?>
    <a class="secondary" href="?" style="display:inline-block;margin-bottom:10px;text-decoration:none;color:#fff;padding:6px 8px;background:#6c757d;border-radius:6px;">Volver al menú</a>
    <h2>Agregar Empleado</h2>
    <form method="post" action="?action=empleado_add">
        <label>Nombre:</label><br>
        <input type="text" name="nombre_empleado" required><br><br>

        <label>Tipo de empleado:</label><br>
        <select name="id_tipo_empleado" required>
            <option value="">-- Seleccionar tipo --</option>
            <?php
            if ($resTipos) {
                while ($t = mysqli_fetch_assoc($resTipos)) {
                    echo "<option value='".htmlspecialchars($t['id_tipo_empleado'])."'>".htmlspecialchars($t['puesto'])."</option>";
                }
            }
            ?>
        </select><br><br>

        <label>Departamento:</label><br>
        <select name="id_departamento" required>
            <option value="">-- Seleccionar departamento --</option>
            <?php
            if ($resDeptos) {
                while ($d = mysqli_fetch_assoc($resDeptos)) {
                    echo "<option value='".htmlspecialchars($d['id_departamento'])."'>".htmlspecialchars($d['nombre_departamento'])."</option>";
                }
            }
            ?>
        </select><br><br>

        <label>Fecha de contrato:</label><br>
        <input type="date" name="fecha_contrato" required><br><br>

        <hr>
        <h4>Datos generales del empleado</h4>
        <label>Teléfono:</label><br>
        <input type="text" name="telefono"><br><br>

        <label>Correo:</label><br>
        <input type="email" name="correo"><br><br>

        <label>Fecha de nacimiento:</label><br>
        <input type="date" name="fecha_nac"><br><br>

        <button type="submit" name="agregar_empleado">Agregar Empleado</button>
    </form>
    <?php
}

if ($action === 'empleado_list') {
    ?>
    <a class="secondary" href="?" style="display:inline-block;margin-bottom:10px;text-decoration:none;color:#fff;padding:6px 8px;background:#6c757d;border-radius:6px;">Volver al menú</a>
    <h2>Empleados</h2>
    <table>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Puesto</th>
        <th>Departamento</th>
        <th>Fecha Contrato</th>
        <th>Teléfono</th>
        <th>Correo</th>
        <th>Acciones</th>
    </tr>
    <?php
    $resEmp = mysqli_query($conexion, "
        SELECT e.id_empleado, e.nombre, te.puesto, d.nombre_departamento, e.fecha_contrato, dg.telefono, dg.correo
        FROM empleados e
        LEFT JOIN tipoempleado te ON e.id_tipo_empleado = te.id_tipo_empleado
        LEFT JOIN departamento d ON e.id_departamento = d.id_departamento
        LEFT JOIN datosgenerales dg ON e.id_datos = dg.id_datos
        ORDER BY e.nombre
    ");
    if ($resEmp && mysqli_num_rows($resEmp) > 0) {
        while ($e = mysqli_fetch_assoc($resEmp)) {
            echo "<tr>";
            echo "<td>".htmlspecialchars($e['id_empleado'])."</td>";
            echo "<td>".htmlspecialchars($e['nombre'])."</td>";
            echo "<td>".htmlspecialchars($e['puesto'])."</td>";
            echo "<td>".htmlspecialchars($e['nombre_departamento'])."</td>";
            echo "<td>".htmlspecialchars($e['fecha_contrato'])."</td>";
            echo "<td>".htmlspecialchars($e['telefono'])."</td>";
            echo "<td>".htmlspecialchars($e['correo'])."</td>";
            echo "<td><a class='botonEliminar' href='?action=empleado_list&eliminar_empleado=".urlencode($e['id_empleado'])."' onclick='return confirm(\"¿Eliminar empleado y sus datos?\");'>Eliminar</a></td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='8'>No hay empleados registrados.</td></tr>";
    }
    ?>
    </table>
    <?php
}

/* =====================================================================
   VISTAS: Venta de Autos cálculo en tiempo real
===================================================================== */

if ($action === 'venta_add') {
    // Cargar selects: empleados, clientes, autos disponibles, métodos de pago, seguros
    $resEmps = mysqli_query($conexion, "SELECT id_empleado, nombre FROM empleados ORDER BY nombre");
    $resClients = mysqli_query($conexion, "SELECT c.id_cliente, c.nombre FROM cliente c ORDER BY c.nombre");
    $resAutos = mysqli_query($conexion, "SELECT id_numserie, costo, estado FROM Autos WHERE estado = 'Disponible' ORDER BY id_numserie");
    $resMetodos = mysqli_query($conexion, "SELECT id_pago, tipo_pago FROM metodo ORDER BY tipo_pago");
    $resSeguros = mysqli_query($conexion, "SELECT id_seguro, compania, tipo_seguro, costo_seguro FROM seguro ORDER BY compania");
    ?>
    <a class="secondary" href="?" style="display:inline-block;margin-bottom:10px;text-decoration:none;color:#fff;padding:6px 8px;background:#6c757d;border-radius:6px;">Volver al menú</a>
    <h2>Registrar Venta de Auto</h2>
    <form method="post" action="?action=venta_add" id="formVenta">
        <label>Fecha de venta:</label><br>
        <input type="date" name="fecha_venta" value="<?= date('Y-m-d') ?>"><br><br>

        <label>Empleado (vendedor):</label><br>
        <select name="id_empleado" required>
            <option value="">-- Seleccionar empleado --</option>
            <?php if ($resEmps) { while ($r = mysqli_fetch_assoc($resEmps)) {
                echo "<option value='".htmlspecialchars($r['id_empleado'])."'>".htmlspecialchars($r['nombre'])."</option>";
            } } ?>
        </select><br><br>

        <label>Cliente:</label><br>
        <select name="id_cliente" required>
            <option value="">-- Seleccionar cliente --</option>
            <?php if ($resClients) { while ($r = mysqli_fetch_assoc($resClients)) {
                echo "<option value='".htmlspecialchars($r['id_cliente'])."'>".htmlspecialchars($r['nombre'])."</option>";
            } } ?>
        </select><br><br>

        <label>Auto (número de serie):</label><br>
        <!-- cada option incluye data-cost para permitir cálculo en cliente -->
        <select name="id_numserie" id="selectAuto" required>
            <option value="" data-cost="0">-- Seleccionar auto disponible --</option>
            <?php if ($resAutos) { while ($r = mysqli_fetch_assoc($resAutos)) {
                $cost = htmlspecialchars($r['costo']);
                $serie = htmlspecialchars($r['id_numserie']);
                echo "<option value='{$serie}' data-cost='{$cost}'>{$serie} - ${$cost}</option>";
            } } ?>
        </select><br><br>

        <label>Método de pago:</label><br>
        <select name="id_pago" required>
            <option value="">-- Seleccionar método --</option>
            <?php if ($resMetodos) { while ($r = mysqli_fetch_assoc($resMetodos)) {
                echo "<option value='".htmlspecialchars($r['id_pago'])."'>".htmlspecialchars($r['tipo_pago'])."</option>";
            } } ?>
        </select><br><br>

        <label>Seguro (opcional):</label><br>
        <select name="id_seguro" id="selectSeguro">
            <option value="" data-cost="0">-- Sin seguro --</option>
            <?php if ($resSeguros) { while ($r = mysqli_fetch_assoc($resSeguros)) {
                $idseg = htmlspecialchars($r['id_seguro']);
                $comp = htmlspecialchars($r['compania']);
                $tipo = htmlspecialchars($r['tipo_seguro']);
                $cseg = htmlspecialchars($r['costo_seguro']);
                echo "<option value='{$idseg}' data-cost='{$cseg}'>{$comp} - {$tipo} (${$cseg})</option>";
            } } ?>
        </select><br><br>

        <label>Descuento:</label><br>
        <input type="number" step="0.01" name="descuento" id="inputDescuento" value="0.00" min="0"><br><br>

        <!-- Vista previa del cálculo en tiempo real -->
        <div class="smallInfo">
            <div class="priceBox">Precio base: <span id="basePrice">$0.00</span></div>
            <div class="priceBox">Costo seguro: <span id="seguroPrice">$0.00</span></div>
            <div class="priceBox">Descuento: <span id="discPrice">$0.00</span></div>
            <div class="priceBox" style="font-weight:bold;">Precio final: <span id="finalPrice">$0.00</span></div>
        </div>

        <br>
        <button type="submit" name="agregar_venta">Registrar Venta</button>
    </form>

    <script>
    // Cálculo en tiempo real
    (function(){
        const selectAuto = document.getElementById('selectAuto');
        const selectSeguro = document.getElementById('selectSeguro');
        const inputDescuento = document.getElementById('inputDescuento');
        const basePriceEl = document.getElementById('basePrice');
        const seguroPriceEl = document.getElementById('seguroPrice');
        const discPriceEl = document.getElementById('discPrice');
        const finalPriceEl = document.getElementById('finalPrice');

        function parseCostFromOption(opt) {
            if (!opt) return 0.0;
            const c = opt.getAttribute('data-cost');
            return c ? parseFloat(c) : 0.0;
        }

        function formatMoney(v) {
            return '$' + v.toFixed(2);
        }

        function recalc() {
            const autoOpt = selectAuto.selectedOptions[0];
            const seguroOpt = selectSeguro.selectedOptions[0];
            const base = parseCostFromOption(autoOpt);
            const seguroCost = parseCostFromOption(seguroOpt);
            const disc = parseFloat(inputDescuento.value) || 0.0;
            let final = base + seguroCost - disc;
            if (!isFinite(final) || final < 0) final = 0.0;

            basePriceEl.textContent = formatMoney(base);
            seguroPriceEl.textContent = formatMoney(seguroCost);
            discPriceEl.textContent = formatMoney(disc);
            finalPriceEl.textContent = formatMoney(final);
        }

        // recalcular al inicio y al cambiar select/inputs
        selectAuto.addEventListener('change', recalc);
        selectSeguro.addEventListener('change', recalc);
        inputDescuento.addEventListener('input', recalc);

        document.addEventListener('DOMContentLoaded', recalc);
    })();
    </script>
    <?php
}

if ($action === 'venta_list') {
    ?>
    <a class="secondary" href="?" style="display:inline-block;margin-bottom:10px;text-decoration:none;color:#fff;padding:6px 8px;background:#6c757d;border-radius:6px;">Volver al menú</a>
    <h2>Ventas registradas</h2>
    <table>
    <tr>
        <th>ID Venta</th>
        <th>Fecha</th>
        <th>Empleado</th>
        <th>Cliente</th>
        <th>Núm. Serie</th>
        <th>Método Pago</th>
        <th>Seguro</th>
        <th>Descuento</th>
        <th>Precio Final</th>
        <th>Acciones</th>
    </tr>
    <?php
    $resVentas = mysqli_query($conexion, "
        SELECT v.id_venta, v.fecha_venta, e.nombre AS empleado, c.nombre AS cliente, v.id_numserie, m.tipo_pago, s.compania, v.descuento, v.precio_final
        FROM ventaautos v
        LEFT JOIN empleados e ON v.id_empleado = e.id_empleado
        LEFT JOIN cliente c ON v.id_cliente = c.id_cliente
        LEFT JOIN metodo m ON v.id_pago = m.id_pago
        LEFT JOIN seguro s ON v.id_seguro = s.id_seguro
        ORDER BY v.fecha_venta DESC, v.id_venta DESC
    ");
    if ($resVentas && mysqli_num_rows($resVentas) > 0) {
        while ($v = mysqli_fetch_assoc($resVentas)) {
            echo "<tr>";
            echo "<td>".htmlspecialchars($v['id_venta'])."</td>";
            echo "<td>".htmlspecialchars($v['fecha_venta'])."</td>";
            echo "<td>".htmlspecialchars($v['empleado'])."</td>";
            echo "<td>".htmlspecialchars($v['cliente'])."</td>";
            echo "<td>".htmlspecialchars($v['id_numserie'])."</td>";
            echo "<td>".htmlspecialchars($v['tipo_pago'])."</td>";
            echo "<td>".htmlspecialchars($v['compania'])."</td>";
            echo "<td>$".htmlspecialchars(number_format(floatval($v['descuento']), 2))."</td>";
            echo "<td>$".htmlspecialchars(number_format(floatval($v['precio_final']), 2))."</td>";
            echo "<td><a class='botonEliminar' href='?action=venta_list&eliminar_venta=".urlencode($v['id_venta'])."' onclick='return confirm(\"¿Eliminar esta venta y marcar el auto como disponible?\");'>Eliminar</a></td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='10'>No hay ventas registradas.</td></tr>";
    }
    ?>
    </table>
    <?php
}

/* =====================================================================
   VISTAS ORIGINALES: Autos 
===================================================================== */

if ($action === 'add') {
    ?>
    <a class="secondary" href="?" style="display:inline-block;margin-bottom:10px;text-decoration:none;color:#fff;padding:6px 8px;background:#6c757d;border-radius:6px;">Volver al menú</a>
    <h2>Agregar Auto Nuevo</h2>
    <form method="post" action="?action=add">
        <label>Número de serie:</label><br>
        <input type="text" name="numserie" required><br><br>

        <label>Marca:</label><br>
        <select name="id_marca" required>
            <option value="">-- Seleccionar marca --</option>
            <?php
            $marcas = mysqli_query($conexion, "SELECT id_marca, nombre_marca FROM Marca ORDER BY nombre_marca");
            while ($m = mysqli_fetch_assoc($marcas)) {
                echo "<option value='".htmlspecialchars($m['id_marca'])."'>".htmlspecialchars($m['nombre_marca'])."</option>";
            }
            ?>
        </select><br><br>

        <label>Modelo (si no existe se creará):</label><br>
        <input type="text" name="modelo_nombre" required><br><br>

        <label>Año:</label><br>
        <input type="number" name="anio" required><br><br>

        <label>Color:</label><br>
        <input type="text" name="color" required><br><br>

        <label>Tipo de Auto:</label><br>
        <select name="id_tipo_auto" required>
            <option value="">-- Seleccionar tipo --</option>
            <?php
            $tipos = mysqli_query($conexion, "SELECT id_tipo_auto, categoria FROM TipoAuto ORDER BY categoria");
            while ($t = mysqli_fetch_assoc($tipos)) {
                echo "<option value='".htmlspecialchars($t['id_tipo_auto'])."'>".htmlspecialchars($t['categoria'])."</option>";
            }
            ?>
        </select><br><br>

        <label>Costo:</label><br>
        <input type="number" name="costo" step="0.01" required><br><br>

        <label>ID proveedor:</label><br>
        <input type="number" name="id_proveedor" required><br><br>

        <label>Tipo de manejo:</label><br>
        <input type="text" name="tipo_manejo"><br><br>

        <button type="submit" name="agregar_auto">Agregar Auto</button>
    </form>
    <?php
}

if ($action === 'list') {
    // Parámetros recibidos del formulario
    $color = $_GET['color'] ?? '';
    $min = $_GET['min'] ?? '';
    $max = $_GET['max'] ?? '';
    $marca = $_GET['marca'] ?? '';
    $anio = $_GET['ano'] ?? '';
    $modelo = $_GET['modelo'] ?? '';
    $tipo_auto = $_GET['tipo_auto'] ?? '';
    $pagina = $_GET['pagina'] ?? 1;
    $limite = 20;
    $offset = ($pagina - 1) * $limite;

    // Construcción dinámica de la consulta
    $consulta = "
        SELECT A.id_numserie, M.nombre_modelo, Ma.nombre_marca, 
               A.anio, A.color, A.costo, A.estado, TA.categoria AS tipo_auto
        FROM Autos A
        INNER JOIN Modelo M ON A.id_modelo = M.id_modelo
        INNER JOIN Marca Ma ON M.id_marca = Ma.id_marca
        INNER JOIN TipoAuto TA ON A.id_tipo_auto = TA.id_tipo_auto
        WHERE A.estado = 'Disponible'
    ";

    if ($color != '') {
        $consulta .= " AND A.color LIKE '%" . mysqli_real_escape_string($conexion, $color) . "%'";
    }

    $minf = isset($_GET['min']) && $_GET['min'] !== '' ? floatval($_GET['min']) : '';
    $maxf = isset($_GET['max']) && $_GET['max'] !== '' ? floatval($_GET['max']) : '';

    if ($minf !== '' && $maxf !== '') {
        $consulta .= " AND A.costo BETWEEN $minf AND $maxf";
    }
    if ($marca != '') {
        $consulta .= " AND Ma.nombre_marca LIKE '%" . mysqli_real_escape_string($conexion, $marca) . "%'";
    }
    if ($anio != '') {
        $consulta .= " AND A.anio LIKE '%" . mysqli_real_escape_string($conexion, $anio) . "%'";
    }
    if ($modelo != '') {
        $consulta .= " AND M.nombre_modelo LIKE '%" . mysqli_real_escape_string($conexion, $modelo) . "%'";
    }
    if ($tipo_auto != '') {
        $consulta .= " AND TA.categoria LIKE '%" . mysqli_real_escape_string($conexion, $tipo_auto) . "%'";
    }

    $consulta .= " LIMIT $limite OFFSET $offset";

    $resultado = mysqli_query($conexion, $consulta);

    // Mostrar filtro y resultados
    ?>
    <a class="secondary" href="?" style="display:inline-block;margin-bottom:10px;text-decoration:none;color:#fff;padding:6px 8px;background:#6c757d;border-radius:6px;">Volver al menú</a>
    <h2>Filtrar Autos Disponibles</h2>

    <form method="get" action="?">
        <input type="hidden" name="action" value="list">
        <label>Color:</label>
        <input type="text" name="color" value="<?= htmlspecialchars($color) ?>"><br><br>

        <label>Precio mínimo:</label>
        <input type="number" name="min" step="0.01" value="<?= htmlspecialchars($min) ?>"><br><br>

        <label>Precio máximo:</label>
        <input type="number" name="max" step="0.01" value="<?= htmlspecialchars($max) ?>"><br><br>

        <label>Marca:</label>
        <input type="text" name="marca" value="<?= htmlspecialchars($marca) ?>"><br><br>

        <label>Año:</label>
        <input type="text" name="ano" value="<?= htmlspecialchars($anio) ?>"><br><br>

        <label>Modelo:</label>
        <input type="text" name="modelo" value="<?= htmlspecialchars($modelo) ?>"><br><br>

        <label>Tipo de auto:</label>
        <select name="tipo_auto">
            <option value="">-- Todos --</option>
            <option value="Sedan">Sedán</option>
            <option value="SUV">SUV</option>
            <option value="Hatchback">Hatchback</option>
            <option value="Pickup">Pickup</option>
            <option value="Coupe">Coupé</option>
            <option value="Convertible">Convertible</option>
            <option value="Deportivo">Deportivo</option>
            <option value="Minivan">Minivan</option>
            <option value="Camioneta">Camioneta</option>
            <option value="Todo terreno">Todo terreno</option>
            <option value="Electrico">Eléctrico</option>
            <option value="Hibrido">Híbrido</option>    
            <option value="Compacto">Compacto</option>
            <option value="Lujo">Lujo</option>
            <option value="Familiar">Familiar</option>
            <option value="Utilitario">Utilitario</option>
            <option value="Van de carga">Van de carga</option>
            <option value="Crossover">CrossOver</option>
            <option value="Off-Road">Off-Road</option>
            <option value="Microcar">Microcar</option>
        </select>

        <br><br>
        <button type="submit">Buscar</button>
    </form>

    <hr>
    <h3>Resultados:</h3>
    <table>
    <tr>
        <th>Número de Serie</th>
        <th>Marca</th>
        <th>Modelo</th>
        <th>Año</th>
        <th>Color</th>
        <th>Costo</th>
        <th>Tipo de auto</th>
        <th>Estado</th>
        <th>Acciones</th>
    </tr>

    <?php
    if ($resultado && mysqli_num_rows($resultado) > 0) {
        while ($fila = mysqli_fetch_assoc($resultado)) {
            echo "<tr>";
            echo "<td>".htmlspecialchars($fila['id_numserie'])."</td>";
            echo "<td>".htmlspecialchars($fila['nombre_marca'])."</td>";
            echo "<td>".htmlspecialchars($fila['nombre_modelo'])."</td>";
            echo "<td>".htmlspecialchars($fila['anio'])."</td>";
            echo "<td>".htmlspecialchars($fila['color'])."</td>";
            echo "<td>$".htmlspecialchars($fila['costo'])."</td>";
            echo "<td>".htmlspecialchars($fila['tipo_auto'])."</td>";
            echo "<td>".htmlspecialchars($fila['estado'])."</td>";
            echo "<td><a class='botonEliminar' href='?action=list&eliminar=".urlencode($fila['id_numserie'])."' onclick='return confirm(\"¿Eliminar auto?\");'>Eliminar</a></td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='9'>No se encontraron autos con esos filtros.</td></tr>";
    }
    ?>
    </table>

    <nav>
    <?php
    $parametros = "&action=list&color=".urlencode($color)."&min=".urlencode($min)."&max=".urlencode($max);
    echo "<a href='?pagina=" . max(1, $pagina - 1) . $parametros . "'>Anterior</a> ";
    echo "<a href='?pagina=" . ($pagina + 1) . $parametros . "'>Siguiente</a>";
    ?>
    </nav>

    <?php
}

mysqli_close($conexion);
?>
</body>
</html>