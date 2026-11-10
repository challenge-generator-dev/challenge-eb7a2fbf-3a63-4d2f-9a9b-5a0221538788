# Aprovisionamiento de Infraestructura con Terraform para el Servicio de Órdenes

El equipo de desarrollo necesita aprovisionar la infraestructura AWS para el servicio de órdenes utilizando Terraform. El objetivo es versionar la configuración de la infraestructura para garantizar consistencia y reproducibilidad en el despliegue.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el servicio de ordenes |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: JDK 17+, Maven 3.9+, IDE con soporte Java.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Ejecuta `mvn compile` en la raíz. Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración Inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform para el aprovisionamiento de la infraestructura AWS.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los componentes de la infraestructura necesarios para el servicio de órdenes.
- Configurar el archivo principal de Terraform para definir la infraestructura.
- Establecer las variables y proveedores necesarios para la configuración.

**Entregable:** Archivo principal de Terraform configurado y variables definidas.

<details>
<summary>Pistas de conocimiento</summary>

- Configuración de proveedores en Terraform.
- Uso de variables en Terraform para parametrizar la configuración.

</details>

### Fase 2: Definición de Recursos de Infraestructura

**Objetivo:** Definir los recursos de infraestructura necesarios en Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crear los recursos de AWS necesarios para el servicio de órdenes (ej. instancias EC2, bases de datos, servicios de red).
- Asegurar que los recursos definidos cumplan con los requisitos del servicio.
- Validar la configuración de los recursos para evitar errores de despliegue.

**Entregable:** Recursos de infraestructura definidos en Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Creación de recursos en Terraform.
- Validación de la configuración de recursos.

</details>

### Fase 3: Despliegue y Verificación de la Infraestructura

**Objetivo:** Desplegar la infraestructura definida en Terraform y verificar su correcto funcionamiento.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Ejecutar el plan de Terraform para desplegar la infraestructura.
- Verificar que todos los recursos se han creado correctamente.
- Realizar pruebas de integración para asegurar que la infraestructura funciona como se espera.

**Entregable:** Infraestructura desplegada y verificada.

<details>
<summary>Pistas de conocimiento</summary>

- Ejecución de planes en Terraform.
- Verificación de recursos desplegados.
- Pruebas de integración para infraestructura.
- Java: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en el aprovisionamiento de infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la configuración de la infraestructura con Terraform?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para definir y desplegar recursos de infraestructura en AWS?
- **erroresComunes**: ¿Cuáles son los errores comunes al configurar y desplegar infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el aprovisionamiento de infraestructura con Terraform y cómo se toman?

## Criterios de Evaluacion

- Configuración inicial de Terraform realizada correctamente.
- Recursos de infraestructura definidos y validados.
- Infraestructura desplegada y verificada correctamente.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `api` | `api/` | chapter, support | server | Java | - |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd api && mvn clean compile` — componente `api` (chapter, support).

### Contratos entre componentes

- `api` expone http (api: http://localhost:8080):
  - `POST /api/orders`
  - `GET /api/orders/{id}`
  - `PUT /api/orders/{id}`
  - `DELETE /api/orders/{id}`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).
- **Java**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd api && mvn clean compile)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
