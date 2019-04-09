package fileGenerator;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import models.Registro;

public class generateHTML {
	public static void generateRegistroHTML(String TemplatePath, String HTMLoutput, Registro registro) throws IOException {
		File htmlTemplateFile = new File(TemplatePath);
		
		String htmlString = "";
		htmlString = FileUtils.readFileToString(htmlTemplateFile);
		
		htmlString = htmlString.replace("$cuenta", String.valueOf(registro.getCuenta()));
		htmlString = htmlString.replace("$alumno", registro.getNombres() + " " + registro.getApellidoPaterno() + " " + registro.getApellidoMaterno());
		if (registro.getEmail()!= null && !registro.getEmail().isEmpty()) {
			htmlString = htmlString.replace("$eMail", registro.getEmail());
		} else {
			htmlString = htmlString.replace("$eMail", "");
		}
		
		if (registro.getTelefono()!= null && !registro.getTelefono().isEmpty()) {
			htmlString = htmlString.replace("$telefono", registro.getTelefono());
		} else {
			htmlString = htmlString.replace("$telefono", "");
		}
		
		if (registro.getEmergencia()!= null && !registro.getEmergencia().isEmpty()) {
			htmlString = htmlString.replace("$emergencia", registro.getEmergencia());
		} else {
			htmlString = htmlString.replace("$emergencia", "");
		}

		if (registro.getTelfam()!= null && !registro.getTelfam().isEmpty()) {
			htmlString = htmlString.replace("$emeTelefono", registro.getTelfam());
		} else {
			htmlString = htmlString.replace("$emeTelefono", "");
		}
		
		if (registro.getFechaPractica()!= null && !registro.getFechaPractica().isEmpty()) {			
			htmlString = htmlString.replace("$fechaPractica", registro.getFechaPractica());
		} else {
			htmlString = htmlString.replace("$fechaPractica", "");
		}

		if (registro.getHospital()!= null && !registro.getHospital().isEmpty()) {			
			htmlString = htmlString.replace("$hospital", registro.getHospital());
		} else {
			htmlString = htmlString.replace("$hospital", "");
		}
		
		if (registro.getHorario()!= null && !registro.getHorario().isEmpty()) {	
			htmlString = htmlString.replace("$horario", registro.getHorario());
		} else {
			htmlString = htmlString.replace("$horario", "");
		}
		
		if (registro.getHorario()!= null && !registro.getHorario().isEmpty()) {
			htmlString = htmlString.replace("$direccion", registro.getHospitalDom());
		} else {
			htmlString = htmlString.replace("$direccion", "");
		}
		
		File newHtmlFile = new File(HTMLoutput);
		FileUtils.writeStringToFile(newHtmlFile, htmlString);
	}
}
