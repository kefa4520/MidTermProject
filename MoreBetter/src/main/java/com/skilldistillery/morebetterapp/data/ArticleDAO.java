package com.skilldistillery.morebetterapp.data;

import com.skilldistillery.morebetterapp.entities.Article;
import com.skilldistillery.morebetterapp.entities.Category;
import com.skilldistillery.morebetterapp.entities.User;

public interface ArticleDAO {
	public Article findArticleById(int id);
//	public Article findArticleByTitle(String title);
//	public Article findArticleByCategory(Category category);
	// this delete may have to take in the mentor/user id?:
	public boolean deleteArticleById(int id);
	public Article updateArticle(int id, Article article);
	Article createArticle(Article article, int categoryId, User user);
}
