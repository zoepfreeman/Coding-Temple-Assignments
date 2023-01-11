from app import app
from flask import render_template

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/favorites')
def favorites():
    artists=['Leonora Carrington','Remedios Varo','Pliny the Elder', 'Generic Medieval Monk','Me']
    return render_template('favorites.html',artists=artists)
