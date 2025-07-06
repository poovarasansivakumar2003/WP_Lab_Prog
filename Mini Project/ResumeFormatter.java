import javax.xml.parsers.*;
import org.w3c.dom.*;
import java.io.*;
import org.apache.pdfbox.pdmodel.*;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.font.Standard14Fonts;
import org.apache.pdfbox.pdmodel.PDPageContentStream;

public class ResumeFormatter {
    public static void main(String[] args) throws Exception {
        File xmlFile = new File("C:/xampp/htdocs/output/resume.xml");
        File pdfFile = new File("C:/xampp/htdocs/output/resume.pdf");

        if (!xmlFile.exists()) {
            System.err.println("Error: XML file not found at " + xmlFile.getAbsolutePath());
            return;
        }

        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        Document doc = dBuilder.parse(xmlFile);
        doc.getDocumentElement().normalize();

        // Extract fields
        String name = getTag(doc, "name");
        String email = getTag(doc, "email");
        String phone = getTag(doc, "phone");
        String address = getTag(doc, "address");
        String summary = getTag(doc, "summary");
        String skills = getTag(doc, "skills");
        String education = getTag(doc, "education");
        String experience = getTag(doc, "experience");
        String projects = getTag(doc, "projects");
        String certifications = getTag(doc, "certifications");
        String hobbies = getTag(doc, "hobbies");

        try (PDDocument pdfDoc = new PDDocument()) {
            PDPage page = new PDPage(PDRectangle.LETTER);
            pdfDoc.addPage(page);

            PDPageContentStream content = new PDPageContentStream(pdfDoc, page);

            float y = 720;
            float left = 60;
            float width = 500;
            float leading = 18;

            PDFont boldFont = new PDType1Font(Standard14Fonts.FontName.HELVETICA_BOLD);
            PDFont regularFont = new PDType1Font(Standard14Fonts.FontName.HELVETICA);

            // Name
            content.beginText();
            content.setFont(boldFont, 20);
            float nameWidth = boldFont.getStringWidth(name) / 1000 * 20;
            float centerX = left + (width - nameWidth) / 2;
            content.newLineAtOffset(centerX, y);
            content.showText(name);
            content.endText();

            y -= leading + 2;

            // Contact info
            String contactInfo = email + " | " + phone + " | " + address;
            float contactWidth = regularFont.getStringWidth(contactInfo) / 1000 * 11;
            float contactX = left + (width - contactWidth) / 2;
            content.beginText();
            content.setFont(regularFont, 11);
            content.newLineAtOffset(contactX, y);
            content.showText(contactInfo);
            content.endText();

            y -= leading * 1.5;

            // Summary
            y = writeSection(content, "Professional Summary", summary, y, left, width, leading, boldFont, regularFont);

            y -= leading / 2;

            // Skills
            y = writeSection(content, "Skills", null, y, left, width, leading, boldFont, regularFont);
            for (String skill : skills.split(",")) {
                if (!skill.trim().isEmpty()) {
                    y = writeBullet(content, skill.trim(), y, left, width, leading, regularFont);
                }
            }
            y -= leading / 2;

            // Education
            y = writeSection(content, "Education", education, y, left, width, leading, boldFont, regularFont);

            y -= leading / 2;

            // Experience
            y = writeSection(content, "Experience", null, y, left, width, leading, boldFont, regularFont);
            for (String exp : experience.split("\\n")) {
                if (!exp.trim().isEmpty()) {
                    y = writeBullet(content, exp.trim(), y, left, width, leading, regularFont);
                }
            }
            y -= leading / 2;

            // Projects
            y = writeSection(content, "Projects", null, y, left, width, leading, boldFont, regularFont);
            for (String proj : projects.split("\\n")) {
                if (!proj.trim().isEmpty()) {
                    y = writeBullet(content, proj.trim(), y, left, width, leading, regularFont);
                }
            }
            y -= leading / 2;

            // Certifications
            y = writeSection(content, "Certifications", certifications, y, left, width, leading, boldFont, regularFont);

            y -= leading / 2;

            // Hobbies
            y = writeSection(content, "Hobbies", hobbies, y, left, width, leading, boldFont, regularFont);

            content.close();
            pdfDoc.save(pdfFile);
        }

        System.out.println("Resume PDF generated successfully!");
    }

    private static String getTag(Document doc, String tag) {
        NodeList nl = doc.getElementsByTagName(tag);
        if (nl.getLength() > 0 && nl.item(0) != null) {
            return nl.item(0).getTextContent();
        }
        return "";
    }

    private static float writeSection(PDPageContentStream content, String header, String text, float y, float left, float width, float leading, PDFont boldFont, PDFont regularFont) throws IOException {
        if (y < 80) return y;
        content.beginText();
        content.setFont(boldFont, 13);
        content.newLineAtOffset(left, y);
        content.showText(header);
        content.endText();
        y -= leading;
        if (text != null && !text.trim().isEmpty()) {
            content.beginText();
            content.setFont(regularFont, 11);
            content.newLineAtOffset(left + 10, y);
            content.showText(text);
            content.endText();
            y -= leading;
        }
        return y;
    }

    private static float writeBullet(PDPageContentStream content, String text, float y, float left, float width, float leading, PDFont regularFont) throws IOException {
        if (y < 80) return y;
        content.beginText();
        content.setFont(regularFont, 11);
        content.newLineAtOffset(left + 10, y);
        content.showText("\u2022 " + text);
        content.endText();
        return y - leading;
    }
}