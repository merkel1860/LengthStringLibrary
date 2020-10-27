use TestDB;
CREATE ASSEMBLY lengthStringlib
    FROM '/home/schatz/RiderProjects/LengthStringLibrary/LengthStringLibrary/bin/Debug/LengthStringLibrary.dll'
    WITH PERMISSION_SET = SAFE;

drop function dbo.getStringLen;

create function dbo.getStringLen(@a nvarchar(100)) returns int
as external name
    lengthStringlib.[LengthStringLibrary.LengthStringLibrary].GetStringLength ;

SELECT title, dbo.getStringLen(title) as "Length" FROM customer_services.Course c


EXEC sp_configure 'clr strict security', 0;
RECONFIGURE;

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

EXEC sp_configure 'clr enabled', 1;
RECONFIGURE;  