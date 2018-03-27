/*----------------------------------------------------------------------------------------------------------
							FileName    : mailService.cfc
							Created By  : Megha Kedia
							DateCreated : 25-March-2018
							Description : sets mail service for whole application.

------------------------------------------------------------------------------------------------------------*/

component singleton = "true" accessors = "true"{

	// Properties


/*----------------------------------------------------------------------------------------------------------
Function Name  : sendMails()
Description    : sets amil service for all users.
Arguments      : string mailTo,
 				string mailFrom,
 				string subject,
 				string mailBody
Return Type    : none
------------------------------------------------------------------------------------------------------------*/

	function sendMails(required string mailTo, required string mailFrom,
		required string subject, required string mailBody){
			try{
				mailerService = new mail();
				mailerService.setTo(arguments.mailto);
				mailerService.setFrom(arguments.mailFrom);
				mailerService.setSubject(arguments.subject);
				mailerService.setType("html");
				mailerService.send(body = mailBody);
			}
			catch(any e){
				application.errorLogService.(e);
				return false;
			}
			return true;
	}
}