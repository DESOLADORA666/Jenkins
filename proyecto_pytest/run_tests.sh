#!/bin/bash
 
echo "Activando el entorno virtual"
if [!"-d venv"]; then
    python3 -m venv venv
fi
source venv/bin/activate

echo "Instalando dependencias"
pip install -r requirements.txt

echo "Ejecuntaod pruebas con Pytest" 
pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas, resultados en reports"