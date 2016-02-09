package edu.mum.devfest.group8.index;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import edu.mum.devfest.group8.parsers.PdfFileParser;

/**
 * This class will build index of the source location specified into the
 * destination specified.This class will only index txt files.
 *
 */
public class Indexer {

    private final String sourceFilePath = "F:/srcloc";    //give the location of the source files location here
    private final String indexFilePath = "F:/indexloc";   //give the location where you guys want to create index
    private IndexWriter writer = null;
    private File indexDirectory = null;
    private String fileContent;  //temp storer of all the text parsed from doc and pdf 

    /**
     *
     * @throws FileNotFoundException
     * @throws CorruptIndexException
     * @throws IOException
     */
    public Indexer() throws FileNotFoundException, CorruptIndexException, IOException {
        try {
            long start = System.currentTimeMillis();
            createIndexWriter();
            checkFileValidity();
            closeIndexWriter();
            long end = System.currentTimeMillis();
            System.out.println("Total Document Indexed : " + TotalDocumentsIndexed());
            System.out.println("Total time" + (end - start) / (100 * 60));
        } catch (Exception e) {
            System.out.println("Sorry task cannot be completed");
        }
    }

    /**
     * IndexWriter writes the data to the index. Its provided by Lucene
     *
     * @param analyzer : its a standard analyzer, in this case it filters out
     * englishStopWords and also analyses TFIDF
     */
    private void createIndexWriter() {
        try {
        	indexDirectory = new File(indexFilePath);
            if (indexDirectory.exists()) {
            	final File[] files = indexDirectory.listFiles();
            	if (files != null && files.length > 0) {
            		for (File f: files) f.delete();
            	}
            	indexDirectory.delete();
            }
            indexDirectory.mkdir();
            FSDirectory dir = FSDirectory.open(indexDirectory);
            StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_34);
            IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_34, analyzer);
            writer = new IndexWriter(dir, config);
        } catch (Exception ex) {
            System.out.println("Sorry cannot get the index writer");
        }
    }

    /**
     * This function checks whenther the file passed is valid or not
     */
    private void checkFileValidity() {

        File[] filesToIndex = new File[100]; // suppose there are 100 files at max
        filesToIndex = new File(sourceFilePath).listFiles();
        for (File file : filesToIndex) {
            try {
                //to check whenther the file is a readable file or not.
                if (!file.isDirectory()
                        && !file.isHidden()
                        && file.exists()
                        && file.canRead()
                        && file.length() > 0.0
                        && file.isFile() ) {
                    if(file.getName().endsWith(".txt")){
                        indexTextFiles(file);//if the file text file no need to parse text. 
                    System.out.println("INDEXED FILE " + file.getAbsolutePath() + " :-) ");
                    }
                    else if(file.getName().endsWith(".pdf")){
                        //different methof for indexing  pdf file.
                       StartIndex(file);                    
                    }
                }
            } catch (Exception e) {
                System.out.println("Sorry cannot index " + file.getAbsolutePath());
            }
        }
    }
    
    
    /**
     * This method is for indexing pdf file and doc file.
     * The text parsed from them are indexed along with the filename and filepath
     * @param file : the file which you want to index
     * @throws FileNotFoundException
     * @throws CorruptIndexException
     * @throws IOException 
     */
    public void StartIndex(File file) throws FileNotFoundException, CorruptIndexException, IOException {
         fileContent = null;
        try {
            Document doc = new Document();
            if (file.getName().endsWith(".pdf")) {
                //call the pdf file parser and get the content of pdf file in txt format
                fileContent = new PdfFileParser().PdfFileParser(file.getAbsolutePath());
            }
            doc.add(new Field("content", fileContent,
                    Field.Store.YES, Field.Index.ANALYZED,
                    Field.TermVector.WITH_POSITIONS_OFFSETS));
            doc.add(new Field("filename", file.getName(),
                    Field.Store.YES, Field.Index.ANALYZED));
            doc.add(new Field("fullpath", file.getAbsolutePath(),
                    Field.Store.YES, Field.Index.ANALYZED));
            if (doc != null) {
                writer.addDocument(doc);
            }
            System.out.println("Indexed" + file.getAbsolutePath());
        } catch (Exception e) {
            System.out.println("error in indexing" + (file.getAbsolutePath()));
        }
    }

    /**
     *
     * @param file
     * @throws CorruptIndexException
     * @throws IOException
     */
    private void indexTextFiles(File file) throws CorruptIndexException, IOException {
        Document doc = new Document();
        doc.add(new Field("content", new FileReader(file)));
        doc.add(new Field("filename", file.getName(),
                Field.Store.YES, Field.Index.ANALYZED));
        doc.add(new Field("fullpath", file.getAbsolutePath(),
                Field.Store.YES, Field.Index.ANALYZED));
        if (doc != null) {
            writer.addDocument(doc);
        }
    }

    /**
     *
     * @return
     */
    private int TotalDocumentsIndexed() {
        try {
            IndexReader reader = IndexReader.open(FSDirectory.open(indexDirectory));
            return reader.maxDoc();
        } catch (Exception ex) {
            System.out.println("Sorry no index found");
        }
        return 0;
    }

    /**
     * closes the IndexWriter
     */
    private void closeIndexWriter() {
        try {
            writer.optimize();
            writer.close();
        } catch (Exception e) {
            System.out.println("Indexer Cannot be closed");
        }
    }

  
}
