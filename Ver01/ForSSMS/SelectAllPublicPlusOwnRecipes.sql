USE [Assignment4]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllPublicPlusOwnRecipes]    Script Date: 12/13/2016 6:01:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SelectAllPublicPlusOwnRecipes]
(
	@RecipeName nvarchar(50),
	@CategoryName nvarchar(50),
	@CuisineName nvarchar(50),
	@CookingTime nvarchar(50),
	@Portions nvarchar(50),
	@Privacy nvarchar(50),
	@Description nvarchar(500),
	@UserId uniqueidentifier
)
AS
SELECT UserName, RecipeName, CategoryName, CuisineName, CookingTime, Portions, Privacy, Description  
	FROM aspnet_Users
	INNER JOIN ProjectUserRecipe  ON aspnet_Users.UserId = ProjectUserRecipe.UserId
	INNER JOIN Project_Recipe ON ProjectUserRecipe.RecipeId = Project_Recipe.RecipeId
	INNER JOIN Category ON Project_Recipe.CategoryId = Category.CategoryId  
	INNER JOIN Cuisine ON Project_Recipe.CuisineId = Cuisine.CuisineId  
		WHERE RecipeName LIKE @RecipeName  
		AND CategoryName LIKE @CategoryName  
		AND CuisineName LIKE @CuisineName  
		AND CookingTime LIKE @CookingTime  
		AND Portions LIKE @Portions  
		AND Privacy LIKE 0  
		AND Description LIKE @Description 
		AND aspnet_Users.UserId != @UserId
UNION

SELECT UserName, RecipeName, CategoryName, CuisineName, CookingTime, Portions, Privacy, Description  
	FROM aspnet_Users
	INNER JOIN ProjectUserRecipe  ON aspnet_Users.UserId = ProjectUserRecipe.UserId
	INNER JOIN Project_Recipe ON ProjectUserRecipe.RecipeId = Project_Recipe.RecipeId
	INNER JOIN Category ON Project_Recipe.CategoryId = Category.CategoryId  
	INNER JOIN Cuisine ON Project_Recipe.CuisineId = Cuisine.CuisineId  
		WHERE aspnet_Users.UserId = @UserId
		AND CategoryName LIKE @CategoryName  
		AND CuisineName LIKE @CuisineName  
		AND CookingTime LIKE @CookingTime  
		AND Portions LIKE @Portions  
		AND Privacy LIKE 0  
		AND Description LIKE @Description