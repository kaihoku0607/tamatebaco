BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Recipes" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	"can"	INTEGER NOT NULL,
	"unit"	INTEGER NOT NULL,
	"rice_flower"	INTEGER NOT NULL,
	"soy_milk"	INTEGER NOT NULL,
	"coconut_oil"	INTEGER NOT NULL,
	"brown_sugar"	INTEGER NOT NULL,
	"starch"	INTEGER NOT NULL,
	"almond"	INTEGER NOT NULL,
	"cocoa"	INTEGER NOT NULL,
	"raspberry"	INTEGER,
	"lemon"	INTEGER,
	"baking_soda"	INTEGER,
	PRIMARY KEY("id")
);
INSERT INTO "Recipes" ("id","name","can","unit","rice_flower","soy_milk","coconut_oil","brown_sugar","starch","almond","cocoa","raspberry","lemon","baking_soda") VALUES (1,'鯉のぼり（プレーン',3,10,240,120,110,150,30,0,0,0,0,5),
 (2,'鯉のぼり（ココア）','３',10,240,120,110,150,30,0,30,0,0,5),
 (3,'お魚','５',30,240,120,110,150,30,0,0,0,0,5),
 (4,'ラズベリー','５',15,240,120,110,150,30,0,0,50,0,5),
 (5,'レモンアイシング','５',15,240,120,110,150,30,0,0,0,30,5);
COMMIT;
