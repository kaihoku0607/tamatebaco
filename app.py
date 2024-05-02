from flask import Flask, render_template, request
import sqlite3
import math

app = Flask(__name__)

def connect_db():
    return sqlite3.connect('sweets2.db')

@app.route('/')
def index():
    return render_template('index.html', math=math)

@app.route('/calculate', methods=['POST', 'GET'])
def calculate():
    if request.method == 'POST':
        cans = int(request.form['cans'])
    else:
        cans = int(request.args.get('cans', ''))

    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Recipes")
    recipes = cursor.fetchall()
    conn.close()

    calculated_ingredients = []
    for recipe in recipes:
        recipe_id = recipe[0]
        name = recipe[1]
        can = int(recipe[2])
        unit = int(recipe[3])
        needed_cans = cans
        needed_units = math.ceil(cans * can / unit)
        ingredients = {}
        for idx, ingredient in enumerate(["米粉", "有機無調整豆乳", "ココナッツオイル", "三温糖", "馬鈴薯澱粉", "アーモンドプードル", "ココア", "ラズベリー", "レモン", "重曹"]):
            quantity = math.ceil(needed_units * int(recipe[4 + idx]))
            ingredients[ingredient] = quantity
        calculated_ingredients.append((name, ingredients, needed_cans, needed_units, can))

    return render_template('results.html', calculated_ingredients=calculated_ingredients, cans=cans, math=math)

if __name__ == '__main__':
    app.run(debug=True)
