# Lab04 Diseño de banco de Registro

* Ana Isabella Goyeneche Fonseca 1.192.793.310
* Diego Andrés Quintero Rois
* Oscar Santiago Suarez Aguilar 1.003.822.596

## Generalidades de un Banco de Registro.

Un banco de registros es un conjunto de elementos tipo registro;  su vez, los registros son dispositivos digitales donde se obtiene almacenamiento temporal. Dado que la memoria y el desplazamiento de información son sus características básicas, los registros son circuitos secuenciales constituidos por flip-flops.

Los bancos de registro son de gran importancia y entre sus características más importantes es que mediante señales de control permiten el almacenamiento y recuperación de información; es decir, que cada registro sea escrito o leido.  Por lo generar el banco de registro tiene un puerto de salida de datos y uno de entrada. Dependiedo de la aplicación el banco de registro debe permite la lectura y escritura simultánea de varios registros. 

## Descripción y alcance del banco a implementar.

En el desarrollo a continuación presentado se pretende alcanzar un banco implementado en la FPGA que:

* Tenga 8 registros de 4 bits Read and Write.
* Permita la lectura de 2 registros simultáneamente,
* Permita la escritura de 1 registro, acorde a la señal de control regwrite
* Cuente con señal de rst, la cual ponga todos los registros en un valor conocido.
* Permita visualizar la información, en al menos dos display de 7 segmentos (información de cada registro leído.
* Haga el ingreso de la información por medio de los interruptores dispuestos en la tarjeta de desarrollo.
* Parametrizar el tamaño de palabra de cada registro y la cantidad de registros.
* Pre cargar el banco de registro con información. Usar $readmenh.

Es decir, el trabajo del equipo de diseño consiste en crear un archivo tipo ¨Top¨ que permita integrar los archivos previamente dados en el paquete de trabajo que permitan hacer la implementación en forma de lenguaje de descripción de Hardware; en el cual se instancian tanto el banco de registros como el display. Adicionalmente se mustran los resultados del diseño tanto por TestBench como en la implementación física.

## Desarrollo del diseño.

A continuación, se muestran los pantallazos del código comentado en los cuales se explica brevemente el funcionamiento del banco de registro, y en los cuales se muestra como se cumplen los requisitos de diseño solicitados.

![Fig1](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/BancoRegistro1.png)

![Fig2](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/BancoRegistro2.png)

Referente a los cambios implementados en los archivos ¨BCDtoSSeg.v¨ y ¨display.v¨ se puede argumentar que fueron menores y además solo se hicieron con el fin de hacer visualización dinámica de los dos datos de salida en dos display y no en 4 como anteriormente se había implementado; por lo cual no se adjutan pantallazos y para mayor información se debe remitir al código de ésta carpeta.

Como se habia mencionado anteriormente, el módulo "Top" del proyecto es el encargado de unir los diferentes elementos que se encargan tanto del manejo de la información como de su proyección, por eso se muestra a continuación el código desarrollado y sus respectivos comentarios. Adicionalmente se incluye un esquema del funcionamiento del módulo y sus conexiones para facilitar el entendimiento.

![Fig1](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/BancoRegistroTop.png)

![Fig2](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/Esquema.png)
## Archivo de memoria
El archivo de memoria creado contiene 8 registros escritos en hexadecimal, como se muestra a continuación:
```
A
0
D
2
5
4
6
8
```
## Resultados del TestBench, incluyendo muestra de funcionamiento de Precarga.
 Con el fin de verificar el correcto funcionamiento del programa diseñado se simulo, usando el codigo a continuación.
 ![Fig1](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/TestBench.png)

 En la figura se observan 3 secciones que permiten simular las 3 funcionalidades. En el caso del reset, se pone en activo durante 25 unidades de tiempo, y lo que hace es devolver al banco a sus valores iniciales precargados. Por otro lado, para la lectura de los registros se usan las dos direcciones de entrada y se varian las dos direcciones simultaneamente para mostrar los registros en dos displays. Esto se hace mostrando la dirección 1 y la 4 en cada display, variandolas sucesivamente hasta completar los 8 registros. Finalmente para la escritura, se activa a través de la variable RegWrit y se escribe en el registro 7, un valor que avaria de 0 hasta 9 cada 5000 unidades de tiempo.

 A continuación se observan los resultados de las simulaciones:

### Lectura

![Fig2](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/SimulacionLectura.png)

En el caso de la lectura se observa que cuando la direccion en addRa es 001 y addRb es 100, en el display (sseg) se muestra 0000001 en el primer display y 0100100 en el segundo display. Esto coincide con el banco de registro dado que en la dirección 1 se encuentra el valor de 0 y en la dirección 4 se encuentra el valor de 5. Para las direcciones siguientes que corresponden a 2 y 6 tambien se observa el correcto funcionamiento dado que se muestra el valor D y 4, respectivamente.

### Escritura

![Fig3](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/Escritura.png)

En el caso de la escritura como se observa en la imagen al realizar la lectura de la dirección 7 que es donde se esta escribiendo, se evidencia el cambio del segundo display el cual varia en funcion de la variable i, y por lo tanto la dirección va almacenando el valor de i cada 5000 unidades de tiempo. Se puede ver el cambio de 0 a 1 en el segundo display, y asi ocurre sucesivamente hasta llegar a 9.

### Reset

![Fig4](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/Reset.png)

Finalmente, se simulo el reset durante el proceso de escritura, cuando el proceso de escritura, ya cambio el registro de la dirección 7 al valor de 7 se activa el reset como se observa en la figura, al activarlo el valor de la dirección 7 vuelve a su valor original precargado que es 8 y se mantiene dado que al no escribir de nuevo en esa dirección, no se cambia su valor. Evidenciando el correcto funcionamiento del reset.
 
 ## Video Demostrativo
 Se adjunta link del video donde se puede evidenciar el correcto funcionamiento de las 3 operaciones básicas solicitadas: Lectura, Escritura y Reseteo: https://youtu.be/VZBKySBjUvA
