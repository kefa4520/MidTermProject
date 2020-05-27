package com.skilldistillery.morebetterapp.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.morebetterapp.entities.Article;
import com.skilldistillery.morebetterapp.entities.Category;
import com.skilldistillery.morebetterapp.entities.User;

@Service
@Transactional
public class ArticleDAOImpl implements ArticleDAO {
	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public Article findArticleById(int id) {
		return em.find(Article.class, id);
	}

//	@Override
//	public Article findArticleByTitle(String title) {
//		return null;
//	}

	@Override
	public Article createArticle(Article article, int categoryId, User author) {
		Category category = em.find(Category.class, categoryId);
		author= em.find(User.class, author.getId());
		article.setCategory(category);
		article.setUserAuthor(author);
//		author.getWrittenArticles().get(3);
		
		author.addArticle(article);
		em.persist(category);
		em.persist(article);
		em.flush();
		return article;
	}

	@Override
	public boolean deleteArticleById(int id) {
		Article articleToDelete = em.find(Article.class, id);
		em.remove(articleToDelete);
		boolean stillContains = !em.contains(articleToDelete);
		em.flush();
		return stillContains; // returns TRUE if deleted successfully
	}

	@Override
	public Article updateArticle(int id, Article article) {
		Article updatedArticle = em.find(Article.class, id);
		updatedArticle.setCategory(article.getCategory());
		updatedArticle.setUserAuthor(article.getUserAuthor());
		updatedArticle.setTitle(article.getTitle());
		updatedArticle.setContents(article.getContents());
		updatedArticle.setCreated(article.getCreated());
		em.flush();
		return updatedArticle;
	}

}
