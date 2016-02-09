package edu.mum.devfest.group8.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import edu.mum.devfest.group8.index.Indexer;

@WebServlet("/Search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		try {
			new Indexer();
		} catch (Exception ex) {
			System.out.println("Cannot Start :(");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword;
		keyword = request.getParameter("keyword");

		try {
			IndexSearcher searcher = new IndexSearcher(FSDirectory.open(new File("F:/indexloc")));
			Analyzer analyzer1 = new StandardAnalyzer(Version.LUCENE_34);
			QueryParser queryParser = new QueryParser(Version.LUCENE_34, "content", analyzer1);
			QueryParser queryParserfilename = new QueryParser(Version.LUCENE_34, "fullpath", analyzer1);
			Query query = queryParser.parse(keyword);// to search in the content
			Query queryfilename = queryParserfilename.parse(keyword);
			TopDocs hits = searcher.search(query, 1000); // for
			ScoreDoc[] document = hits.scoreDocs;
			System.out.println("Total no of hits for content: " + hits.totalHits);
			String[] filepaths = new String[document.length];
			for (int i = 0; i < document.length; i++) {
				Document doc = searcher.doc(document[i].doc);
				String filePath = doc.get("fullpath");
				filepaths[i] = filePath;
				System.out.println(filePath);
			}
			request.setAttribute("filepaths", filepaths);
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/search.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
		}

	}
}
