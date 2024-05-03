# sportnews
Esta implementación combina un enfoque innovador de animación con principios sólidos de arquitectura de software, manejo de estado.



Los actores principales en este proyecto:



Clean Architecture: El proyecto sigue los principios de la arquitectura limpia, lo que promueve una separación de responsabilidades y una mayor mantenibilidad del código.



Módular: Donde mediante la Inyección de dependencias, mejoramos la modularidad, cada componente (clases, casos de uso, repositorios) tiene una responsabilidad específica y bien definida.



Bloc: Se emplea el paquete Bloc de Flutter para el manejo del estado de la aplicación, lo que permite una gestión eficiente y predecible del flujo de datos.



DataSource:

Fuente remota: Simula una llamada a una API, de momento se quema la data, pero esta preparado para obtener datos de manera remota.



Fuente local:

Actualmente, se utiliza una variable en tiempo de ejecución para almacenar los elementos eliminados.



En futuras entregas, se reemplazará por un mecanismo de persistencia, como una base de datos local, para permitir que los datos eliminados se mantengan incluso después de cerrar la aplicación.

*Inspirado en:

https://lnkd.in/dzyBURfd
