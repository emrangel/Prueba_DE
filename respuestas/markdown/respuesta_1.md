## a. Explicación de la problemática actual de la compañía

La empresa está experimentando dificultades en la gestión de sus datos debido a un proceso manual y centralizado en una persona que extrae los datos desde el ERP en formato Excel. Esto implica varias limitaciones:

- **Dependencia de personal**: Solo una persona de soporte está capacitada para extraer los datos desde la base de datos, lo que genera un cuello de botella y retrasa los reportes.
- **Capacidad limitada de Excel**: Debido al gran volumen de datos, Excel no es una herramienta adecuada, ya que tiene una capacidad limitada de manejo de filas, lo cual afecta la precisión y utilidad de los reportes. Luego del millón de filas se pierde las posibilidades sin mencionar la carga de las dimensiones de las columnas.
- **Toma de decisiones tardía**: La extracción y procesamiento manual de datos hace que la información llegue tarde a cada área, lo que impacta la capacidad de respuesta frente a cambios en las ventas y demanda.
- **Escalabilidad y actualización insuficiente**: Con el crecimiento de clientes y ventas, el proceso actual no permite un ajuste dinámico en la toma de decisiones, lo que afecta el inventario y el servicio al cliente.

## b. Propuesta de solución

### 1. Arquitectura

Se recomienda una arquitectura de datos en la nube con un flujo de datos automatizado, permitiendo una ingesta, almacenamiento y procesamiento continuo y escalable. Esta arquitectura podría incluir:

- **Data Lake**: Un espacio para almacenar los datos crudos provenientes del ERP, en un entorno que permita trabajar tanto con datos estructurados como no estructurados.
- **Data Warehouse**: Una capa de almacenamiento para datos organizados y optimizados para consultas analíticas, donde se podrían cargar los datos del Data Lake después de ser procesados y transformados.
- **ETL/ELT**: Procesos de transformación que permiten estructurar y limpiar los datos, agregando la frecuencia y granularidad requerida para generar reportes precisos.

En caso de no poder contar con una arquitectura en nube, se puede optar por crear un servidor local con toda la seguridad necesaria.

### 2. Infraestructura

La infraestructura podría estar basada en servicios en la nube como AWS, Azure o Google Cloud Platform para asegurar escalabilidad y disponibilidad, y para reducir la dependencia de hardware físico. Componentes específicos podrían incluir:

- **DB2(IBM) / Azure / SAP en la nube** para la replicación de la base de datos del ERP en un entorno gestionado.
- **Almacenamiento en Data Lake** para datos sin procesar y de alto volumen.
- **Data Warehouse** (BigQuery, Redshift, o Azure Synapse), que permite el acceso rápido a los datos para consultas analíticas.
- **Pipeline de datos** con herramientas como Apache Airflow o el servicio de flujo de datos en la nube para automatizar el proceso de extracción y carga de datos.

### 3. Solución a nivel de datos

Se propone un flujo de datos automático que extraiga la información del ERP a intervalos frecuentes, que luego pase por procesos de transformación (ETL) para convertirla en información útil para las áreas de negocio. Esto debería:

- Facilitar el acceso directo de cada área a un **data mart** específico para sus indicadores.
- Incluir capas de datos preprocesados para diferentes niveles de análisis (desde resúmenes hasta datos detallados para análisis específicos).
- Integración con **APIs** que faciliten la actualización automática de los datos sin necesidad de intervención manual.

### 4. Visualización

Para la presentación de los datos, se recomienda utilizar herramientas de BI como **Power BI**, **Tableau** o **Looker Studio**. Estas herramientas permitirán a cada área consultar sus indicadores de gestión y realizar análisis en tiempo real sin depender de una persona para el procesamiento de datos. La visualización debe enfocarse en:

- **Tableros en tiempo real** para monitorear indicadores clave como ventas, stock y crecimiento de clientes.
- **Accesibilidad según roles** para cada área, garantizando que tengan acceso a la información relevante para sus decisiones.

## c. Metodología para la construcción y validación de la solución

Se recomienda utilizar una metodología ágil, como **Scrum**, para desarrollar esta solución en etapas, que incluye:

1. **Etapa de análisis**: Revisión de necesidades de cada área y del volumen de datos para definir requerimientos y seleccionar herramientas.
2. **Etapa de diseño**: Diseñar la arquitectura de datos y las conexiones necesarias entre el ERP y el sistema analítico.
3. **Etapa de desarrollo**: Implementación de pipelines de datos y desarrollo de tableros en una fase piloto.
4. **Pruebas y validación**: Validar los datos mediante pruebas con usuarios de cada área y hacer ajustes según los requerimientos.
5. **Implementación y capacitación**: Lanzamiento de la solución y capacitación del personal para que sean autosuficientes en el uso de los tableros.
