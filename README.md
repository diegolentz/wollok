# Pepita (parte 2)

Este ejercicio extiende la versión inicial de pepita para que les estudiantes agreguen
sus primeras líneas en wollok luego de la explicación del docente

## Ejercicio 1: Pepón

Agregar a Pepón: Pepón es otra ave que puede comer el alpiste y la manzana y sigue las siguientes reglas:

- La energía inicial de pepón es 30.
- Sabe decir su energía. 
- Cuando come, solo puede aprovechar la mitad de la energía que aporta el alimento
- Cuando vuela gasta 20 fijos más 2 joules por km, 

Ejemplos:
- si tiene 30 de energía y come alpiste su nueva energía es 30 + 20/2 = 40 
- si tiene 30 de energía y vuela 3 km su nueva energía es: 30 - 20 - 2*3 = 4


## Ejercicio 2: Roque
Agregar a Roque, que es una persona

### Ave de roque
Tiene un ave, a veces es Pepón, a veces es Pepita, por lo tanto tiene que entender un mensaje para que se le indique cual es su ave. Inicialmente es pepita.

### Alimentar

 Entiende el mensaje *alimentar*, que recibe un alimento por parámetro. Al recibir este mensaje roque alimenta a su ave. 

Ejemplos:
- Si tiene a pepona con energía de 30, y recibe el mensaje alimentar(alpiste) pepon queda con 40 de energía
- Si tiene a pepita con energía de 100 y recibe el mensaje alimentar(alpiste) pepita queda con 120 de energía.

### Cenas

Entiende el mensaje *cenas* sin parámetros, el cual devuelve la cantidad de veces que roque dio de alimentar a su ave
Desde que la está entrenando. (pensar como hacer para recordar este dato)
Por ejemplo:
1. a roque se le encomienda entrenar a pepita
2. a roque se le pide alimentar a su ave
3. a roque se le pide nuevamente alimentar a su ave
4. a roque se le pregunta por las cenas: devuelve 2
5. a roque se le enconmienda  entrenar a pepon
6. a roque se le pide alimentar a su ave
7. a roque se le pregunta por las cenas: devuelve 1
8. a roque se le encomienda entrenar a pepita
9. a roque se le pregunta por las cenas: devuelve 0


