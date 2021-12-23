# Lab04 Diseño de banco de Registro

* Ana Isabella Goyeneche Fonseca 1.192.793.310
* Diego Andrés Quintero Rois
* Oscar Santiago Suarez Aguilar 1.003.822.596

# Generalidades de un Banco de Registro.

Un banco de registros es un conjunto de elementos tipo registro;  su vez, los registros son dispositivos digitales donde se obtiene almacenamiento temporal. Dado que la memoria y el desplazamiento de información son sus características básicas, los registros son circuitos secuenciales constituidos por flip-flops.

Los bancos de registro son de gran importancia y entre sus características más importantes es que mediante señales de control permiten el almacenamiento y recuperación de información; es decir, que cada registro sea escrito o leido.  Por lo generar el banco de registro tiene un puerto de salida de datos y uno de entrada. Dependiedo de la aplicación el banco de registro debe permite la lectura y escritura simultánea de varios registros. 

# Descripción y alcance del banco a implementar.

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

# Desarrollo del diseño.

A continuación, se muestran los pantallazos del código comentado en los cuales se explica brevemente el funcionamiento del banco de registro, y en los cuales se muestra como se cumplen los requisitos de diseño solicitados.

![Fig1](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/BancoRegistro1.png)

![Fig2](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/BancoRegistro2.png)

Referente a los cambios implementados en los archivos ¨BCDtoSSeg.v¨ y ¨display.v¨ se puede argumentar que fueron menores y además solo se hicieron con el fin de hacer visualización dinámica de los dos datos de salida en dos display y no en 4 como anteriormente se había implementado; por lo cual no se adjutan pantallazos y para mayor información se debe remitir al código de ésta carpeta.

Como se habia mencionado anteriormente, el módulo "Top" del proyecto es el encargado de unir los diferentes elementos que se encargan tanto del manejo de la información como de su proyección, por eso se muestra a continuación el código desarrollado y sus respectivos comentarios. Adicionalmente se incluye un esquema del funcionamiento del módulo y sus conexiones para facilitar el entendimiento.

![Fig1](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/BancoRegistroTop.png)

![Fig2](https://github.com/unal-edigital1-lab/lab04-2021-2-grupo03-2021-2/blob/master/figs/Esquema.png)

# Resultados del TestBench, incluyendo muestra de funcionamiento de Precarga.
 //Explicación y pantallazo del código testbench explicando que hace cada sección comentada.
 //Muestra de funcionamiento de testbench y análisis.
 
 # Video Demostrativo
 //Adjunto video demostrativo mostrando cada función (Lectura, escritura, reseteo)