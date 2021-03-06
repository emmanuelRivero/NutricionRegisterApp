package worksheets;

import models.*;
import java.util.ArrayList;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import database.databaseQuery;

public class ExcelExport {
	public static void registros(String sessioncicloID, String filePath) throws IOException, FileNotFoundException {
		ArrayList<Registro> dataRegistros;
		dataRegistros = databaseQuery.getRegistros(sessioncicloID);
		
		ArrayList<String> headers = new ArrayList<String>();
		headers.add("Cuenta");
		headers.add("Nombres");
		headers.add("Apellido Paterno");
		headers.add("Apellido Materno");
		headers.add("Horario");
		headers.add("Hospital");
		headers.add("Telefono");
		headers.add("Celular");		
		headers.add("E-mail");
		headers.add("Nombre Emergencia");
		headers.add("Tel. Familiar");
		headers.add("Fecha Practica");
		headers.add("Documentos faltantes");
		
		XSSFWorkbook workbook = new XSSFWorkbook();
		
        Sheet sheet = workbook.createSheet("Registros");
        // 3328/143
        // sheet.setColumnWidth(0, 2327);
        
        // Create a Font for styling header cells
        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 11);
        
        
        // Create a CellStyle with the font
        CellStyle headerCellStyle = workbook.createCellStyle();  
        headerCellStyle.setFont(headerFont);

        System.out.println("Generating Headers");
        // Create Headrers
        Row headerRow = sheet.createRow(0);
        for(int i = 0; i < headers.size(); i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers.get(i));
            cell.setCellStyle(headerCellStyle);
            sheet.autoSizeColumn(i);
        }
        System.out.println("Fulling up with data");
        // Data
        for (int i = 0; i < dataRegistros.size(); i++) {
        	Row data = sheet.createRow(i+1);
        	Registro registro = dataRegistros.get(i);      
        	
        	Cell cuenta = data.createCell(0);    
        	cuenta.setCellValue(registro.getCuenta());
        	sheet.autoSizeColumn(0);
        	
        	Cell nombres = data.createCell(1);    
        	nombres.setCellValue(registro.getNombres());
        	sheet.autoSizeColumn(1);
        	
        	Cell apellidoPaterno = data.createCell(2);    
        	apellidoPaterno.setCellValue(registro.getApellidoPaterno());
        	sheet.autoSizeColumn(2);
        	
        	Cell apellidoMaterno = data.createCell(3);    
        	apellidoMaterno.setCellValue(registro.getApellidoMaterno());
        	sheet.autoSizeColumn(3);
        	
        	Cell horario = data.createCell(4);    
        	horario.setCellValue(registro.getHorario());
        	sheet.autoSizeColumn(4);
        	
        	Cell hospital = data.createCell(5);    
        	hospital.setCellValue(registro.getHospital());
        	sheet.autoSizeColumn(5);
        	
        	Cell telefono = data.createCell(6);    
        	telefono.setCellValue(registro.getTelefono());
        	sheet.autoSizeColumn(6);
        	
        	Cell celular = data.createCell(7);    
        	celular.setCellValue(registro.getCelular());
        	sheet.autoSizeColumn(7);
        	
        	Cell correo = data.createCell(8);    
        	correo.setCellValue(registro.getEmail());
        	sheet.autoSizeColumn(8);
        	
        	Cell emergencia = data.createCell(9);    
        	emergencia.setCellValue(registro.getEmergencia());
        	sheet.autoSizeColumn(9);
        	
        	Cell telfam = data.createCell(10);    
        	telfam.setCellValue(registro.getTelfam());
        	sheet.autoSizeColumn(10);
        	
        	Cell fechaPractica = data.createCell(11);    
        	fechaPractica.setCellValue(registro.getFechaPractica());
        	sheet.autoSizeColumn(11);
        	
        	String documentosString = "";
        	
        	if (registro.getHistorial() == 0) {
        		documentosString = documentosString + "Historial academico";
        	}
        	
        	if (registro.getCartilla() == 0) {
        		if (documentosString.length() > 0) {
        			documentosString = documentosString + ", ";
        		}
        		documentosString = documentosString + "Cartilla de vacunacion";
        	}
        	
        	if (registro.getFotos() == 0) {
        		if (documentosString.length() > 0) {
        			documentosString = documentosString + ", ";
        		}
        		documentosString = documentosString + "Fotografias infantil";
        	}
        	
        	if (registro.getSeguro() == 0) {
        		if (documentosString.length() > 0) {
        			documentosString = documentosString + ", ";
        		}
        		documentosString = documentosString + "Seguro medico";
        	}
        	
        	if (registro.getHorario2() == 0) {
        		if (documentosString.length() > 0) {
        			documentosString = documentosString + ", ";
        		}
        		documentosString = documentosString + "Horario de la materia de practica clinica";
        	}
        	//documentosString = URLEncoder.encode(documentosString, "UTF-8");
        	
        	//String documentosANSI = new String(documentosString.getBytes(Charset.forName("ISO-8859-1")));
        	//Charset iso88591charset = Charset.forName("ISO-8859-1");
        	//byte[] documentosISObyte = documentosString.getBytes(iso88591charset);
        	//String documentosISO = new String (documentosISObyte,iso88591charset);
        	
        	//Charset utf8charset = Charset.forName("UTF-8");
        	//byte[] documentosUTFbyte = documentosString.getBytes(utf8charset);
        	//String documentosUTF = new String (documentosUTFbyte,utf8charset);
         	
        	
        	Cell documentos = data.createCell(12);    
        	documentos.setCellValue(documentosString);
        	sheet.autoSizeColumn(12);
        }
        
        
        FileOutputStream fileOut = new FileOutputStream(filePath);
        workbook.write(fileOut);
        fileOut.close();
        System.out.println("File Generated: " + filePath);
        workbook.close();
	}
	
}
