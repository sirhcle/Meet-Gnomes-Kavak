# Meet-Gnomes
 Se creó esta aplicación como parte del proceso de selección.
 
# Implementación
 Se hizo un visual donde se carga a través de un collection view el listado de Gnomes que arroja la consulta a la URL proporcionada. Cuando se selecciona el item deseado se muestra en otra pantalla la información del gnome.
 Se utilizó la arquitectura MVVM para el primer visual, para el segundo visual como solo se carga la información a la vista no se utilizó MVVM para no ocupar recursos innecesarios.
Los request HTTP se hicieron de forma nativa, sin ayuda de librerías, esto fue con URSession. Para el parseo de los datos se hace a través de estructuras que heredan de la clase Codeable

# Librerías adicionales
 Se utiliza la librería https://github.com/SDWebImage/SDWebImage para un manejo óptimo en la carga de imágenes a través de URLs
