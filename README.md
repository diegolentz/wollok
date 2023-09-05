
 
[![Build Status](https://travis-ci.org/wollok/polimorfismoEmpanadasGimenez.svg?branch=master)](https://travis-ci.org/wollok/polimorfismoEmpanadasGimenez)

# Empanadas Giménez

<img src="img/empanadasGimenez.png" height="200" width="300">

## Planteo inicial

En "Empanadas Giménez", un modesto local de delivery de empanadas, tenemos dos empleados:

* Galván, el empleado de siempre, que cobra un sueldo fijo. El valor arranca en $ 15.000, y después puede cambiar mes a mes.
* Baigorria, el joven y explotado empleado de Giménez, que cobra en base a la cantidad de empanadas vendidas (actualmente $ 15 por empanada). Debe haber una forma de informar que Baigorria vende una cantidad de empanadas.

El dueño, el señor Giménez, es el encargado de pagarle el sueldo a los empleados, y de gestionar el dinero que se utiliza para esto. Asumimos que Giménez arranca con un fondo para sueldos de $ 300.000. Como los sueldos salen de este fondo, hay que descontar el importe correspondiente cuando Giménez le paga a un empleado.

Por ahora no vamos a tener en cuenta qué hace cada empleado al recibir el dinero, el único efecto que nos interesa del pago es que disminuye el fondo de Giménez.

Modelar al dueño y a los dos empleados, de forma tal que se pueda indicar: un cambio de sueldo de Galván, la venta de empanadas por parte de Baigorria, el pago de sueldo de cualquiera de los dos empleados. Y se pueda preguntar: el sueldo de Baigorria, y el importe actual en el fondo de Giménez.

P.ej. si se realizan estas acciones

- registrar la venta de 500 empanadas por parte de Baigorria
- cambiar el sueldo de Galván a 20000
- registrar la venta de otras 300 empanadas por parte de Baigorria
- que Giménez le pague el sueldo a Baigorria
- finalmente, que Giménez le pague el sueldo a Galván

Entonces el sueldo de Baigorria es 12000, y el fondo de Galván tiene 268000 pesos.

<br>

## Qué hacen los empleados con lo que cobran

Ahora queremos agregar al modelo aquellos que hacen los empleados cuando cobran el suedo:
- Agregar / modificar los métodos necesarios para que Giménez le pueda pagar el sueldo a cualquiera de los dos empleados teniendo en cuenta que:
  - Baigorria cuando cobra el sueldo lo suma a un acumulador de todo lo que cobró, agregarle la capacidad de entender el mensaje `totalCobrado()`. 
    _Nota: Ojo con las ganancias del mes pasado que ya le pagaron a Baigorria! ¿Qué debe pasar con la cantidad de empanadas vendidas?_
  - Galván no hace nada.

<br>

## Manejo fino de las finanzas de Galván

Modificar el comportamiento de Galván para que maneje sus gastos, el dinero que tiene, y su deuda. Cuando Galván gasta, se descuenta de su dinero, si no le alcanza aumenta la deuda. Cuando cobra un sueldo, Galván paga sus deudas. Si sobra algo, se suma al dinero que tiene. Agregar a Galván la capacidad de entender los mensajes: `gastar(cuanto)`, `deuda()`, `dinero()`.

Tener en cuenta este escenario
1. Galván arranca con deuda en 0 y dinero en 0. Su sueldo (que aún no cobró) es de 15000.
1. Galván gasta 4000, `deuda()` debe ser 4000, `dinero()` debe ser 0.
1. Galván gasta otros 8000, `deuda()` pasa a 12000, `dinero()` sigue en 0.
1. Galván cobra, con los 15000 que recibe paga toda su deuda y le sobran 3000 pesos. Por lo tanto, `deuda()` debe ser 0, y `dinero()` debe ser 3000.
1. Galván gasta 25000, cubre 3000 con el dinero que tiene, el resto es deuda. `deuda()` queda en 22000, `dinero()` en 0.
1. Galván cobra, tiene que dedicar los 15000 a pagar deudas, y no le alcanza. Ahora, `deuda()` pasa a 7000, y `dinero()` a 0.


<br>

# Conceptos vistos en el ejemplo

* Modelar objetos
* Polimorfismo entre Baigorria y Galván.
 * Para pensar: ¿qué mensajes entiende cada uno? ¿qué efecto produce al utilizar ambos objetos en el REPL?
