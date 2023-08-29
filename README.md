# Casa de Pepe y Julián

Pepe y Julián viven juntos, y nos pidieron que les ayudemos con un sistema para administrar los gastos de la casa.

## La casa
De la casa se conoce la cantidad de víveres que tiene (en porcentaje) y un monto (en pesos) necesario para reparaciones. Además se quiere saber:
- Si la casa _tiene víveres suficientes_: mayor al 40%
- Si _hay que hacer reparaciones_.
- Si la casa _está en orden_, que implica que no hay que hacer reparaciones y tiene víveres suficientes.

#### Implementar los objetos y métodos necesarios para obtener la información requerida y poder configurar los víveres tiene y reparaciones que necesita la casa, sabiendo que comienza con 50% de los víveres y sin necesidad de reparaciones.

> **Caso de Prueba**: Hacer que se rompa algo de 1000 pesos de la casa, aumentando el monto de reparación. Verificar que la casa:
> - Tiene víveres suficientes
> - Hay que hacer reparaciones
> - No está en orden

## Cuentas bancarias
Pepe y Julián poseen varios tipos de cuentas bancarias, de las cuales pueden conocer su saldo y extraer y depositar dinero:

1. Una **cuenta corriente**, al depositar suma el saldo, al extraer resta.
2. Una **cuenta con gastos**, también mantiene un saldo y, además, un costo por operación. Al depositar suma el importe indicado menos el costo por operación. Al extraer resta el saldo normalmente.
> **Caso de Prueba**: para una cuenta vacía con 20 pesos de costo por operación, si se deposita 1000 pesos, el saldo queda en 980 pesos.
3. Una **cuenta combinada** que tiene dos cuentas, una _primaria_ y una _secundaria_. Si se deposita, el importe pasa a la primaria. Cuando se extrae es así: si la cuenta primaria tiene saldo suficiente se extrae de esa, y si no de la secundaria (vale suponer que la secundaria siempre tiene saldo). El saldo de la combinada es la suma del saldo de las dos.
> **Caso de Prueba**: suponiendo que configuramos la cuenta combinada así: la primaria es la cuenta con gastos con 50 pesos de costo de operación y la secundaria es la cuenta corriente, ya con 500 pesos de saldo. Luego,
> - Se _depositan_ 100 pesos en la cuenta combinada (van a la cuenta con gastos, porque es la primaria, depositándose 50 pesos efectivos). 
> - Si se _extraen_ 200 pesos (salen de la cuenta corriente, ya que a la primaria no le alcanza, dejándola en 300 pesos).
> - _Verificar_ que el saldo de la cuenta con gastos queda en 50 pesos, la cuenta corriente con 300 pesos y la combindada con 350 pesos.

Ellos asignan una de esas cuentas para gestionar los gastos de la casa. Cada vez que se preduce un gasto en la casa, se extrae de la cuenta asignada el importe correspondiente.

#### Se pide poder generar un gasto por un importe determinado en la casa, y que eso se vea afectado en la cuenta elegida previamente.

## Manteniendo la casa
Cada cierto tiempo Pepe y Julián hacen un mantenimiento de la casa y los gastos que producen dependen de la estrategia de ahorro que hayan consensuado. Existen tres _estrategias de ahorro_:

1. **Mínimo e indispensable**: si la casa no tiene los víveres suficientes, compran lo necesaria para que alcance (o sea, llegar al 40%). El gasto de comprar víveres se calcula como `porcentaje a comprar * calidad`, siendo la calidad un valor determinado al elegir esta estrategia. 

1. **Full**:
	- Si la casa está en orden, se llena de víveres al 100%, sino solamente aumenta un 40%, siempre con una calidad de `5`.
	- Además, si el saldo, después de comprar los víveres, en la cuenta alcanza para hacer todas las reparaciones _y sobran más de 1000 pesos_, se hacen, sino no.

#### Se pide poder hacer un mantenimiento a la casa, sufriendo los efectos según la estrategia de ahorro.

> **Caso de Prueba**: Si la casa tiene 50% de los víveres, necesita 100 pesos para reparaciones y tiene asociada la cuenta corriente con 1000 pesos de saldo. Al hacer un mantenimiento con la estrategia _Full_:
> - Como la casa no está en orden, aumenta 40% de sus víveres gastando `40 * 5 = 200` pesos.
> - Si bien luego les alcanza para hacer las reparaciones, no sobrarían 1000 pesos, así que no se hacen.
> - _Verificar_ que la casa queda con 90% de víveres, mantiene los 100 pesos para reparaciones, y la cuenta corriente queda con 800 pesos.


#### Para pensar: Si se agrega una nueva casa, ¿Es posible usar estas estrategias con ella? ¿Qué mensajes debería entender? (Podés responder con comentarios en el código o directamente inventando otra casa con tu propia implementación para que funcione)
