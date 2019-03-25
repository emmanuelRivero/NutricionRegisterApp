package fileGenerator;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.net.FileRetrieve;
import com.itextpdf.tool.xml.net.FileRetrieveImpl;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.AbstractImageProvider;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;
import com.itextpdf.tool.xml.pipeline.html.LinkProvider;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;



public class generatePDF {

	public static void generatePDFFromHTML(String HTMLinput, String PDFoutput, String ImagePath, String CurrentPath) throws IOException, DocumentException {
		
		final String HTML = HTMLinput;
	    final String IMG_PATH = ImagePath;
	    final String RELATIVE_PATH = CurrentPath;
	    final String CSS_DIR = CurrentPath;

		// step 1
        Document document = new Document(PageSize.LETTER);
        // step 2
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(PDFoutput));
        // step 3
        document.open();
        // step 4

        // CSS
        CSSResolver cssResolver =
                XMLWorkerHelper.getInstance().getDefaultCssResolver(false);
        FileRetrieve retrieve = new FileRetrieveImpl(CSS_DIR);
        cssResolver.setFileRetrieve(retrieve);
        
        System.out.println("ccs: " + CSS_DIR);
        // HTML
        HtmlPipelineContext htmlContext = new HtmlPipelineContext(null);
        htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
        htmlContext.setImageProvider(new AbstractImageProvider() {
            public String getImageRootPath() {
                return IMG_PATH;
            }
        });
        
        System.out.println("html: " +HTML);
        System.out.println("image: " +IMG_PATH);
        
        htmlContext.setLinkProvider(new LinkProvider() {
            public String getLinkRoot() {
                return RELATIVE_PATH;
            }
        });

        System.out.println("relative path: " +RELATIVE_PATH);
        // Pipelines
        PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
        HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
        CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
        
        
        System.out.println("parcing... ");
        // XML Worker
        XMLWorker worker = new XMLWorker(css, true);
        XMLParser p = new XMLParser(worker);
        p.parse(new FileInputStream(HTML));
        
        // step 5
        document.close();
        System.out.println("pdf: " + PDFoutput);
    }
	
}
