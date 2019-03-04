package worksheets;

import models.*;

import java.util.ArrayList;
import java.util.Iterator;
import database.databaseInsert;
import database.databaseQuery;
import database.databaseUpdate;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class parseToDB {
	/*
	public static void hospital(XSSFWorkbook workbook) {
		Sheet firstSheet = workbook.getSheetAt(0);
		Iterator<Row> iterator = firstSheet.iterator();
		ArrayList cellArrayListHolder=new ArrayList();
		while (iterator.hasNext()) {
			XSSFRow nextRow =(XSSFRow)iterator.next();
			ArrayList rowarrylist=new ArrayList();
			Iterator<Cell> cellIterator = nextRow.cellIterator();
			while (cellIterator.hasNext()) {
                XSSFCell cell = (XSSFCell)cellIterator.next();
                rowarrylist.add(cell);    
            }
			cellArrayListHolder.add(rowarrylist);
		}
		System.out.println("array:" + cellArrayListHolder);
		ArrayList rowarrylist=null;
		for(int i=1;i<cellArrayListHolder.size();i++)
        {  
//				if (!rowarrylist.get(1).toString().equals("") || rowarrylist.get(i).toString() != null ) {
					rowarrylist=(ArrayList)cellArrayListHolder.get(i);
					String nombre=rowarrylist.get(5).toString();
					String horario=rowarrylist.get(7).toString();
					String periodo=rowarrylist.get(8).toString();
					String domicilio=rowarrylist.get(9).toString();
					System.out.println("registro: "+i);
					System.out.println(nombre);
					System.out.println(horario);
					System.out.println(periodo);
					System.out.println(domicilio);
//				}                 
                //databaseInsert.hospital(nombre, horario, periodo, domicilio);
            } 
	}*/
	public static void hospital(XSSFWorkbook workbook) {
		Sheet firstSheet = workbook.getSheetAt(0);
		DataFormatter formatter = new DataFormatter();
		ArrayList<Hospital> Hospitales = new ArrayList<Hospital>();
		System.out.println(firstSheet.getLastRowNum());
		for (int i=1; i<= firstSheet.getLastRowNum();i++) {
			Hospital hospital = new Hospital();
				if (formatter.formatCellValue(firstSheet.getRow(i).getCell(0)).equals("") ) {
					System.out.println("Line:" + i + "Found empty");
				} else {			
				hospital.setNombre(formatter.formatCellValue(firstSheet.getRow(i).getCell(4)));
				hospital.setHorario(formatter.formatCellValue(firstSheet.getRow(i).getCell(6)));
				hospital.setPeriodo(formatter.formatCellValue(firstSheet.getRow(i).getCell(7)));
				hospital.setDomiclio(formatter.formatCellValue(firstSheet.getRow(i).getCell(10)));
				Hospitales.add(hospital);
				}		
		}
		ArrayList<Hospital> DBdata = new ArrayList<Hospital>();
		DBdata = databaseQuery.getHospitales();
		for (Hospital data : Hospitales) {
			boolean update = false;
			for (Hospital db : DBdata) {
				if (db.getNombre().equals(data.getNombre())) {
					System.out.println("Actualizando:" + data.getNombre());
					databaseUpdate.hospital(String.valueOf(db.getId()), data.getNombre(), data.getHorario(), data.getHorario(), data.getDomiclio());
					update = true;
					break;
				}
			}
			if (update == false) {
				System.out.println("Importando: " + data.getNombre());
				databaseInsert.hospital(data.getNombre(), data.getHorario(), data.getPeriodo(), data.getDomiclio());
			}
		}
	}
}
