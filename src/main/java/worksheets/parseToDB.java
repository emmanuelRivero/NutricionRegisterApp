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

	public static boolean hospital(XSSFWorkbook workbook) {
		Sheet firstSheet = workbook.getSheetAt(0);
		DataFormatter formatter = new DataFormatter();
		ArrayList<Hospital> hospitales = new ArrayList<Hospital>();
		System.out.println("number of rows: " + firstSheet.getLastRowNum());
		
		boolean status = true;
		
		for (int i=1; i<= firstSheet.getLastRowNum();i++) {
			Hospital hospital = new Hospital();
				if (formatter.formatCellValue(firstSheet.getRow(i).getCell(0)).equals("") ) {
					System.out.println("Line:" + i + "Found empty");
				} else {			
				hospital.setNombre(formatter.formatCellValue(firstSheet.getRow(i).getCell(4)));
				hospital.setHorario(formatter.formatCellValue(firstSheet.getRow(i).getCell(6)));
				hospital.setPeriodo(formatter.formatCellValue(firstSheet.getRow(i).getCell(7)));
				hospital.setDomiclio(formatter.formatCellValue(firstSheet.getRow(i).getCell(10)));
				hospitales.add(hospital);
				}		
		}
		ArrayList<Hospital> DBdata = new ArrayList<Hospital>();
		DBdata = databaseQuery.getHospitales();
		for (Hospital data : hospitales) {
			boolean update = false;
			for (Hospital db : DBdata) {
				if (db.getNombre().equals(data.getNombre())) {
					System.out.println("Actualizando:" + data.getNombre());
					databaseUpdate.hospital(String.valueOf(db.getId()), data.getNombre(), data.getHorario(), data.getHorario(), data.getDomiclio());
					update = true;
					if (status == false) {
						return false;
					}	
					break;
				}
			}
			if (update == false) {
				System.out.println("Importando: " + data.getNombre());
				databaseInsert.hospital(data.getNombre(), data.getHorario(), data.getPeriodo(), data.getDomiclio());
			}
		}
		return status;
	}
	
	public static boolean Alumnos(XSSFWorkbook workbook, String cicloID) {
		Sheet firstSheet = workbook.getSheetAt(0);
		DataFormatter formatter = new DataFormatter();
		ArrayList<Alumno> alumnos = new ArrayList<Alumno>();
		System.out.println("number of rows: " + firstSheet.getLastRowNum());
		
		boolean status = true;
		
		for (int i=1; i<= 10;i++) {
			
		//for (int i=1; i<= firstSheet.getLastRowNum();i++) {
			Alumno alumno = new Alumno();
				if (formatter.formatCellValue(firstSheet.getRow(i).getCell(0)).equals("") ) {
					System.out.println("Line:" + i + "Found empty");
				} else {
					alumno.setCuenta((int)firstSheet.getRow(i).getCell(4).getNumericCellValue());
					alumno.setNombre(formatter.formatCellValue(firstSheet.getRow(i).getCell(5)));
					alumno.setApellidoPaterno(formatter.formatCellValue(firstSheet.getRow(i).getCell(6)));
					alumno.setApellidoMaterno(formatter.formatCellValue(firstSheet.getRow(i).getCell(7)));
					alumno.setCarrera(formatter.formatCellValue(firstSheet.getRow(i).getCell(8)));
					alumno.setDescCarrera(formatter.formatCellValue(firstSheet.getRow(i).getCell(9)));
					alumno.setSexo(formatter.formatCellValue(firstSheet.getRow(i).getCell(10)));					
					alumnos.add(alumno);
				}		
		}
		ArrayList<Alumno> DBdata = new ArrayList<Alumno>();
		DBdata = databaseQuery.getAlumno();
		for (Alumno data : alumnos) {
			boolean update = false;
			for (Alumno db : DBdata) {
				if (db.getNombre().equals(data.getNombre())) {
					System.out.println("Actualizando:" + data.getNombre());
					status = databaseUpdate.Alumno(String.valueOf(data.getCuenta()), data.getNombre(), data.getApellidoPaterno(), data.getApellidoMaterno(), data.getCarrera(), data.getDescCarrera(), data.getSexo(), cicloID);					
					update = true;					
					if (status == false) {
						return false;
					}					
					break;
				}
			}
			if (update == false) {
				System.out.println("Importando: " + data.getNombre());
				databaseInsert.alumno(String.valueOf(data.getCuenta()), data.getNombre(), data.getApellidoPaterno(), data.getApellidoMaterno(), data.getCarrera(), data.getDescCarrera(), data.getSexo(), cicloID);					
			}
		}
		return status;
	}	
	
	
	/*
	public static boolean Alumnos(XSSFWorkbook workbook, String cicloID) {
		Sheet firstSheet = workbook.getSheetAt(0);
		DataFormatter formatter = new DataFormatter();
		ArrayList<Alumno> alumnos = new ArrayList<Alumno>();
		System.out.println("number of rows: " + firstSheet.getLastRowNum());
		boolean status = true;
		
		for (int i=1; i<= firstSheet.getLastRowNum();i++) {
			System.out.print(i + " ");
			Alumno alumno = new Alumno();
				if (formatter.formatCellValue(firstSheet.getRow(i).getCell(0)).equals("") ) {
					System.out.println("Line:" + i + "Found empty");
				} else {			
					alumno.setCuenta(Integer.parseInt(formatter.formatCellValue(firstSheet.getRow(i).getCell(1))));
					alumno.setNombre(formatter.formatCellValue(firstSheet.getRow(i).getCell(2)));
					alumno.setApellidoPaterno(formatter.formatCellValue(firstSheet.getRow(i).getCell(2)));
					alumno.setApellidoMaterno(formatter.formatCellValue(firstSheet.getRow(i).getCell(4)));
					alumno.setCarrera(formatter.formatCellValue(firstSheet.getRow(i).getCell(5)));
					alumno.setDescCarrera(formatter.formatCellValue(firstSheet.getRow(i).getCell(6)));
					alumno.setSexo(formatter.formatCellValue(firstSheet.getRow(i).getCell(7)));					
					System.out.println("add shit");
					alumnos.add(alumno);
				}		
		}
		System.out.println("gettinf db data");
		ArrayList<Alumno> DBdata = new ArrayList<Alumno>();
		DBdata = databaseQuery.getAlumno(cicloID);
		for (Alumno data : alumnos) {
			boolean update = false;
			for (Alumno db : DBdata) {
				if (db.getNombre().equals(data.getNombre())) {
					System.out.println("Actualizando:" + data.getNombre());
					boolean updateStatus = databaseUpdate.Alumno(String.valueOf(data.getCuenta()), data.getNombre(), data.getApellidoPaterno(), data.getApellidoMaterno(), data.getCarrera(), data.getDescCarrera(), data.getSexo(), cicloID);
					update = true;
					
					if (updateStatus = false)
						status = false;
					break;
				}
			}
			if (update == false) {
				System.out.println("Importando: " + data.getNombre());
				databaseInsert.alumno(String.valueOf(data.getCuenta()), data.getNombre(), data.getApellidoPaterno(), data.getApellidoMaterno(), data.getCarrera(), data.getDescCarrera(), data.getSexo(), cicloID);
			}
		}
		return status;
	}*/

}
