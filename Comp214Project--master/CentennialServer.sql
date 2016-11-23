DROP TABLE recipes CASCADE CONSTRAINTS;
DROP TABLE ingredients CASCADE CONSTRAINTS;
Drop sequence recipe_id_seq;
drop sequence ingredient_id_seq;

--tables
create table recipes(
recipeId NUMBER(4) not null,
recipeName VARCHAR2(20) not null,
submittedBy VARCHAR2(20) not null,
category varchar2(20),
cookTime varchar2(10),
servingNum number(4) not null,
description varchar2(300) not null,
constraint pk_receipe primary key (recipeId));


create table ingredients(
ingredientId number(4),
ingredientName VARCHAR2(25),
quantity NUMBER(4),
measure varchar(10),
recipeId number(4),
constraint pk_ingredients primary key (ingredientName),
constraint fk_ingredients FOREIGN KEY (recipeId) 
references recipes (recipeId));



create table recipes2(
recipeId NUMBER(4),
recipeName VARCHAR2(20),
submittedBy VARCHAR2(20),
category varchar2(20),
cookTime varchar2(10),
servingNum varchar(20),
description varchar2(300));

--sequences 
CREATE SEQUENCE recipe_id_seq
  START WITH 1
  INCREMENT BY 1
  nocache
  nocycle;
  
  CREATE SEQUENCE ingredient_id_seq
  START WITH 100
  INCREMENT BY 1
  nocache
  nocycle;

--insert
insert into RECIPES 
values(recipe_id_seq.nextval, 'Pizza', 'Josh', 'Pizza', '20 Min', 10, 'Cook Pizza for 20 minutes');

insert into INGREDIENTS
values(ingredient_id_seq.nextval, 'Pepperoni', 10, 'amt', recipe_id_seq.CURRVAL);

insert into INGREDIENTS
values(ingredient_id_seq.nextval, 'Cheese', 10, 'grams', recipe_id_seq.CURRVAL);

insert into INGREDIENTS
values(ingredient_id_seq.nextval, 'Dough', 50, 'grams', recipe_id_seq.CURRVAL);


insert into RECIPES 
values(recipe_id_seq.nextval, 'Spaghetti', 'Dan', 'Pasta', '15 Min', 10, 'Cook Pasta for 10 minutes');

insert into INGREDIENTS
values(ingredient_id_seq.nextval, 'Meatballs', 10, 'amt', recipe_id_seq.CURRVAL);

insert into INGREDIENTS
values(ingredient_id_seq.nextval, 'Tomato Sauce', 15, 'grams', recipe_id_seq.CURRVAL);

insert into INGREDIENTS
values(ingredient_id_seq.nextval, 'Spaghetti', 30, 'grams', recipe_id_seq.CURRVAL);

commit;

--select statements   
  select submittedBy, ingredientName
  from recipes, ingredients
  where recipes.recipeId = ingredients.recipeID;
  
   select recipes.RECIPENAME, ingredients.INGREDIENTNAME, ingredients.QUANITIY
  from recipes
  where submittedby = 'Josh';
 
  
select *
from recipes 
inner join ingredients 
on recipes.recipeId = ingredients.RECIPEID
where submittedby = 'Josh';


select recipes.RECIPENAME, ingredients.INGREDIENTNAME, ingredients.QUANITIY
from recipes 
inner join ingredients 
on recipes.recipeId = ingredients.RECIPEID
where submittedby = 'Josh';

select recipename, submittedby, cooktime
from recipes;

delete from recipes 
where recipeid = 5;
insert into RECIPES (recipeId, recipeName, submittedBy, category, cooktime, servingNum, description) values(5, 'Burgers', 'Dave', 'Fast Food', '30 min', 5, 'cook fast');


--procedure 
create or replace PROCEDURE insertRecipe(
	   --recipe_Id IN recipes.recipeid%TYPE,
	   r_recipe_Name IN recipes.recipeName%TYPE,
	   r_submitted_By IN recipes.submittedby%TYPE,
	   r_category IN recipes.category%TYPE,
     r_cook_time IN recipes.cookTime%TYPE,
     r_serving_num IN recipes.servingNum%TYPE,
     r_description IN recipes.description%TYPE)
IS
BEGIN

  INSERT INTO recipes (recipeId, recipeName, submittedBy, category, cooktime, servingNum, description)
  VALUES (recipe_id_seq.nextval, r_recipe_Name, r_submitted_By, r_category, r_cook_time, r_serving_Num, r_description);

  COMMIT;

END;

Delete From ingredients where ingredientId = 1;
DELETE FROM recipes where recipeId = 1;


