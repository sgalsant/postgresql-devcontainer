# 🐘 SQL con PostgreSQL + Python + Jupyter en DevContainer

Este entorno está preparado para realizar prácticas de SQL usando PostgreSQL, Python y Jupyter dentro de un contenedor de desarrollo (DevContainer) en Visual Studio Code.

## 📦 Requisitos previos

Antes de comenzar, asegúrate de tener instalado:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Visual Studio Code](https://code.visualstudio.com/)
- Extensión de VSCode: **Dev Containers** (`ms-vscode-remote.remote-containers`)

## 🚀 Primeros pasos

1. **Clona este repositorio** o descarga el proyecto:
   ```bash
   git clone https://github.com/tu_usuario/nombre_repositorio.git
   cd nombre_repositorio
   ```

2. **Abre la carpeta del proyecto en VSCode.**

3. VSCode detectará automáticamente el entorno y mostrará una notificación:
   > *"Este proyecto contiene un archivo DevContainer. ¿Quieres reabrirlo en el contenedor?"*

   Haz clic en **"Reabrir en contenedor"**.

4. Espera a que el entorno se construya. Esto puede tardar unos minutos la primera vez. Se instalarán las siguientes herramientas:
   - PostgreSQL
   - Python 3
   - Jupyter Notebook
   - Bibliotecas necesarias (`pandas`, `sqlalchemy`, `ipython-sql`, etc.)

5. Una vez abierto, puedes ejecutar los cuadernos desde la interfaz de Jupyter dentro de VSCode.

## 🧪 Conexión a la base de datos PostgreSQL

Dentro de los cuadernos Jupyter puedes conectarte a la base de datos con la siguiente celda:

```python
%load_ext sql
%sql postgresql://admin:admin@db:5432/postgres
```

Si necesitas usar otro nombre de base de datos o credenciales, modifícalo según corresponda.

## ⚙️ Servicios

Este entorno usa `docker-compose` para levantar dos servicios:

| Servicio | Descripción | Puerto |
|----------|-------------|--------|
| `db`     | Servidor PostgreSQL | 5432 |
| `app`    | Entorno Python + Jupyter | 8080 (interno) |

## 📝 Estructura recomendada para el trabajo

- `cuaderno-jupyter.ipynb`: cuaderno base para ejercicios SQL interactivos.
- `makefile`: comandos automatizados (en desarrollo).
- `requirements.txt`: bibliotecas de Python.
- `Dockerfile`, `docker-compose.yml`, `.devcontainer/`: configuración del entorno.

## 🛠 Comandos útiles

Puedes abrir una terminal dentro del contenedor desde VSCode y ejecutar:

```bash
# Iniciar Jupyter (si no está corriendo)
jupyter notebook --ip=0.0.0.0 --port=8888 --NotebookApp.token=''
```

```bash
# Crear una nueva base de datos desde terminal
psql -h db -U admin -c "CREATE DATABASE alumnos;"
```

## 🧠 Recomendaciones para los alumnos

- Realiza las actividades dentro del cuaderno Jupyter.
- Guarda tu progreso frecuentemente.
- No edites directamente los archivos de configuración a menos que se indique.
- Puedes usar `%sql` para escribir consultas directamente dentro del cuaderno.

---

## ✅ Créditos

Plantilla desarrollada por SGALSANT para prácticas de base de datos con PostgreSQL en entorno aislado y reproducible.
