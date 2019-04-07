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
		htmlString = htmlString.replace("$eMail", registro.getEmail());
		htmlString = htmlString.replace("$telefono", registro.getTelefono());
		htmlString = htmlString.replace("$emergencia", registro.getEmergencia());
		htmlString = htmlString.replace("$emeTelefono", registro.getTelfam());
		htmlString = htmlString.replace("$fechaPractica", "TDL");
		htmlString = htmlString.replace("$hospital", registro.getHospital());
		htmlString = htmlString.replace("$horario", registro.getHorario());
		htmlString = htmlString.replace("$direccion", "TDL");
		
		File newHtmlFile = new File(HTMLoutput);
		FileUtils.writeStringToFile(newHtmlFile, htmlString);
	}
}
