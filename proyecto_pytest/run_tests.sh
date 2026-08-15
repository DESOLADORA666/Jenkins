#!/bin/bash
 
echo "Activando el entorno virtual"
if [!"-d venv"]; then
    python3 -m venv venv
fi
# Activar el entorno virutal correctamente
if [ -f "venv/binb/activate" ]; then
    source venve/bin/activate
elif [ -f "venv/Scripts/activate" ]; then
    source venv/Scripts/activate
else 
    echo "Error: No se pudo activar el entorno virtual."
    exit 1
fi

# Verificar si `pip` esta instalado correctamente
echo "Instalando dependencias ..."
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

mkdir -p reports

# Ejecutar las pruebas
echo "Ejecutando pruebas con Pytest" 
venv/bin/python -m pytest tests/ --junitxml=reports/test/results.xml --html=reports/report.html --self-con

echo "Pruebas finalizadas, resultados en reports"