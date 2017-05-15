USE s17guest28;  
GO  
BACKUP DATABASE s17guest28  
TO DISK = 's17guest28.Bak'  
   WITH FORMAT,  
      MEDIANAME = 's17guest28_sqlserverbackup',  
      NAME = 'Full Backup of s17guest28';  
GO 

