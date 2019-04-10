package fileGenerator;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

import models.Registro;

public class generateDOCX {
	public static void generateRegistroDOC(String TemplatePath, String DOCXoutput, Registro alumno) throws IOException, InvalidFormatException {
		XWPFDocument doc = new XWPFDocument(OPCPackage.open(TemplatePath));
		System.out.println(alumno.getCuenta());
		System.out.println(alumno.getNombres());
		
		// this is for paragraphs still dont need and its not coded to works
		/*
	    for (XWPFParagraph p : doc.getParagraphs()) {
	        List<XWPFRun> runs = p.getRuns();
	        if (runs != null) {
	            for (XWPFRun r : runs) {
	                String text = r.getText(0);
	                if (text != null && text.contains("{alumno}")) {
	                    text = text.replace("{alumno}", "Yo");
	                    r.setText(text, 0);
	                }
	            }
	        }
	    }*/
		
		
	    System.out.println("Replace on tables:");
	    for (XWPFTable tbl : doc.getTables()) {
	        for (XWPFTableRow row : tbl.getRows()) {
	            for (XWPFTableCell cell : row.getTableCells()) {
	                for (XWPFParagraph p : cell.getParagraphs()) {
	    	        	String Fullrun = "";
	                    for (XWPFRun r : p.getRuns()) {
	    	            	Fullrun = Fullrun + r.getText(0);
	                        String text = r.getText(0);
	                    }
	                    
                        if (Fullrun != null && Fullrun.contains("{alumno}")) {
                        	System.out.println("Find: " + Fullrun);
                        	Fullrun = Fullrun.replace("{alumno}", alumno.getNombres() +" "+ alumno.getApellidoPaterno() +" "+ alumno.getApellidoMaterno());
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
                        
                        if (Fullrun != null && Fullrun.contains("{cuenta}")) {
                        	System.out.println("Find: " + Fullrun);
                        	Fullrun = Fullrun.replace("{cuenta}", String.valueOf(alumno.getCuenta()));
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
                        
                        if (Fullrun != null && Fullrun.contains("{email}")) {
                        	System.out.println("Find: " + Fullrun);
                        	if (alumno.getEmail() != null && !alumno.getEmail().isEmpty()) {
                        		Fullrun = Fullrun.replace("{email}", alumno.getEmail());
                        	} else {
                        		Fullrun = Fullrun.replace("{email}", "");
                        	}
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
                        
                        if (Fullrun != null && Fullrun.contains("{telefono}")) {
                        	System.out.println("Find: " + Fullrun);
                        	if (alumno.getTelefono() != null && !alumno.getTelefono().isEmpty()) {
                        		Fullrun = Fullrun.replace("{telefono}", alumno.getTelefono());
                        	} else {
                        		Fullrun = Fullrun.replace("{telefono}", "");
                        	}
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
                        
                        if (Fullrun != null && Fullrun.contains("{celular}")) {
                        	System.out.println("Find: " + Fullrun);
                        	if (alumno.getCelular() != null && !alumno.getCelular().isEmpty()) {
                        		Fullrun = Fullrun.replace("{celular}", alumno.getCelular());
                        	} else {
                        		Fullrun = Fullrun.replace("{celular}", "");
                        	}                        	
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
                        
                        if (Fullrun != null && Fullrun.contains("{emergencia}")) {
                        	System.out.println("Find: " + Fullrun);
                         	if (alumno.getEmergencia() != null && !alumno.getEmergencia().isEmpty()) {                                
                         		Fullrun = Fullrun.replace("{emergencia}", alumno.getEmergencia());
                         	} else {
                         		Fullrun = Fullrun.replace("{emergencia}", "");
                         	}
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
                        
                        if (Fullrun != null && Fullrun.contains("{emetelefono}")) {
                        	System.out.println("Find: " + Fullrun);
                        	if (alumno.getTelfam() != null && !alumno.getTelfam().isEmpty()) {                                                             	
                        		Fullrun = Fullrun.replace("{emetelefono}", alumno.getTelfam());
                        	} else {
                        		Fullrun = Fullrun.replace("{emetelefono}", "");
                        	}
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
                        
                        if (Fullrun != null && Fullrun.contains("{hospital}")) {
                        	System.out.println("Find: " + Fullrun);
                        	if (alumno.getHospital() != null && !alumno.getHospital().isEmpty()) {   
                        		Fullrun = Fullrun.replace("{hospital}", alumno.getHospital());
                        	} else {
                        		Fullrun = Fullrun.replace("{hospital}", "");
                        	}
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
                        
                        if (Fullrun != null && Fullrun.contains("{horario}")) {
                        	System.out.println("Find: " + Fullrun);
                        	if (alumno.getHorario() != null && !alumno.getHorario().isEmpty()) {                               	
                        		Fullrun = Fullrun.replace("{horario}", alumno.getHorario());
                        	} else {
                        		Fullrun = Fullrun.replace("{horario}", "");
                        	}
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
                        
                        if (Fullrun != null && Fullrun.contains("{fechaPractica}")) {
                        	System.out.println("Find: " + Fullrun);
                        	if (alumno.getFechaPractica() != null && !alumno.getFechaPractica().isEmpty()) { 
                        		Fullrun = Fullrun.replace("{fechaPractica}", alumno.getFechaPractica());
                        	} else {
                        		Fullrun = Fullrun.replace("{fechaPractica}", "");
                        	}
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
                        
                        if (Fullrun != null && Fullrun.contains("{direccion}")) {
                        	System.out.println("Find: " + Fullrun);
                        	if (alumno.getHospitalDom() != null && !alumno.getHospitalDom().isEmpty()) { 
                        		Fullrun = Fullrun.replace("{direccion}", alumno.getHospitalDom());
                        	} else {
                        		Fullrun = Fullrun.replace("{direccion}", "");
                        	}
                        	changeText(p,Fullrun);
                        	System.out.println("Replaced: " + Fullrun);
                        }
	                }
	            }
	        }
	    }
	
	    doc.write(new FileOutputStream(DOCXoutput));
	    System.out.println("File generated: " + DOCXoutput);
	}
	
	public static void changeText(XWPFParagraph p, String newText) {
		   List<XWPFRun> runs = p.getRuns();
		   for(int i = runs.size() - 1; i > 0; i--) {
		      p.removeRun(i);
		   }
		   XWPFRun run = runs.get(0);
		   run.setText(newText, 0);
		}
}
